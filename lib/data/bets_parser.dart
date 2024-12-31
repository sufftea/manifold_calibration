import 'package:flutter/widgets.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';

class BetsParser {
  List<Bet> parseBets(List<dynamic> betsJson) {
    final bets = betsJson
        .map<Bet?>(
          (betJson) {
            return parseBet(betJson);
          },
        )
        .nonNulls
        .toList();

    return bets;
  }

  Bet? parseBet(dynamic betJson) {
    try {
      final num amount = betJson['amount'];
      final String contractId = betJson['contractId'];
      final String? answerId = betJson['answerId'];
      final int updatedTime = betJson['updatedTime'];
      final double probAfter = betJson['probAfter'];
      final String outcome = betJson['outcome'];
      final String id = betJson['id'];

      final bet = Bet(
        id: id,
        outcome: switch ((outcome, answerId)) {
          ('YES', null) => BinaryBetOutcomeYes(probAfter: probAfter),
          ('NO', null) => BinaryBetOutcomeNo(probAfter: probAfter),
          ('YES', String answerId) => MultipleChoiceBetOutcomeYes(
              answerId: answerId,
              probAfter: probAfter,
            ),
          ('NO', String answerId) => MultipleChoiceBetOutcomeNo(
              probAfter: probAfter,
              answerId: answerId,
            ),
          _ => UnimplementedBetOutcome(),
        },
        updatedTime: DateTime.fromMillisecondsSinceEpoch(updatedTime),
        marketId: contractId,
        amount: amount.toDouble(),
      );

      return bet;
    } on TypeError catch (e) {
      debugPrint('failed to parse bet: $betJson');
      debugPrint(e.toString());
      return null;
    }
  }
}
