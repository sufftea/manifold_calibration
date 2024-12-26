import 'package:flutter/widgets.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';

class BetsParser {
  List<Bet> parseBets(dynamic betsJson, Map<String, Market> idToMarket) {
    final bets = betsJson
        .map(
          (betJson) {
            return parseBet(betJson, idToMarket);
          },
        )
        .nonNulls
        .toList();

    return bets;
  }

  Bet? parseBet(dynamic betJson, Map<String, Market> idToMarket) {
    try {
      final <dynamic, dynamic>{
        'id': String id,
        'outcome': String outcome,
        'probAfter': double probAfter,
        'updatedTime': int updatedTime,
        'contractId': String contractId,
        'amount': num amount,
      } = betJson;

      final market = idToMarket[contractId];
      if (market == null) {
        return null;
      }

      final bet = Bet(
        id: id,
        outcome: switch (outcome) {
          'YES' => BinaryYesBetOutcome(probAfter: probAfter),
          'NO' => BinaryNoBetOutcome(probAfter: probAfter),
          _ => UnimplementedBetOutcome(),
        },
        updatedTime: DateTime.fromMillisecondsSinceEpoch(updatedTime),
        market: market,
        amount: amount.toDouble(),
      );

      return bet;
    } on StateError catch (e) {
      debugPrint('failed to parse bet: $betJson');
      debugPrint(e.toString());
      return null;
    }
  }
}
