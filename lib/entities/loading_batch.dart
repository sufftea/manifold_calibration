import 'package:manifold_callibration/entities/bet.dart';

class LoadingBatch {
  final List<Bet> bets;
  final int errored;
  final int total;
  final int loaded;

  LoadingBatch({
    required this.bets,
    required this.errored,
    required this.total,
    required this.loaded,
  });
}
