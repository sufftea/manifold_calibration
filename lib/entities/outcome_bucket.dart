import 'package:manifold_callibration/entities/bet.dart';

class OutcomeBucket {
  final List<Bet> bets;
  final double yesRatio;
  final double noRatio;

  OutcomeBucket({
    required this.bets,
    required this.yesRatio,
    required this.noRatio,
  });
}
