import 'package:manifold_callibration/entities/exceptions.dart';
import 'package:manifold_callibration/entities/market.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';

class MarketsParser {
  List<Market> parseUserMetrics(dynamic metricsJson) {
    try {
      final List<dynamic> marketsJson = metricsJson['contracts'];

      final result = <Market?>[
        for (final marketJson in marketsJson) parseMarket(marketJson),
      ];

      return result.nonNulls.toList();
    } on TypeError catch (_) {
      throw UnexpectedResponseException("Couldn't parse markets");
    }
  }

  Market? parseMarket(dynamic marketJson) {
    try {
      final double? resolutionProbability = marketJson['resolutionProbability'];
      final String? resolution = marketJson['resolution'];
      final String outcomeType = marketJson['outcomeType'];
      final String id = marketJson['id'];
      final bool? shouldAnswersSumToOne = marketJson["shouldAnswersSumToOne"];
      final List<dynamic>? answers = marketJson['answers'];

      final market = Market(
        id: id,
        outcome: switch (outcomeType) {
          'BINARY' => switch (resolution) {
              'YES' => BinaryMarketOutcomeYes(),
              'NO' => BinaryMarketOutcomeNo(),
              'MKT' => switch (resolutionProbability) {
                  double resolutionProbability =>
                    BinaryMarketOutcomeMkt(probability: resolutionProbability),
                  null => null,
                },
              null => null,
              _ => UnimplementedMarketOutcome(),
            },
          'MULTIPLE_CHOICE' => switch (shouldAnswersSumToOne) {
              false when answers != null => MultipleChoiceMarketOutcome(
                  answerOutcomes: answers
                      .map((e) {
                        final answerResolution = e['resolution'];
                        final answerId = e['id'];

                        return switch (answerResolution) {
                          'YES' => MultipleChoiceAnswerOutcomeYes(answerId),
                          'NO' => MultipleChoiceAnswerOutcomeYes(answerId),
                          'MKT' => switch (resolutionProbability) {
                              double resolutionProbability =>
                                MultipleChoiceAnswerOutcomeMkt(
                                  probability: resolutionProbability,
                                  answerId: answerId,
                                ),
                              null => null,
                            },
                          null => null,
                          _ => null,
                        };
                      })
                      .nonNulls
                      .toList(),
                ),
              true when answers != null && resolution != null =>
                MultipleChoiceMarketOutcome(
                  answerOutcomes: answers.map(
                    (e) {
                      final answerId = e['id'];

                      return e['id'] == resolution
                          ? MultipleChoiceAnswerOutcomeYes(answerId)
                          : MultipleChoiceAnswerOutcomeNo(answerId);
                    },
                  ).toList(),
                ),
              _ => UnimplementedMarketOutcome(),
            },
          _ => UnimplementedMarketOutcome(),
        },
      );

      return market;
    } on TypeError catch (_) {
      // throw UnexpectedResponseException("Couldn't parse markets");
      return null;
    }
  }
}
