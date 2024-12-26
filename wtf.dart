import 'dart:convert';
import 'dart:io';

void main(List<String> args) async {
  final betsString = await File('./assets/test_data/bets.json').readAsString();
  final actualBetsJson = jsonDecode(betsString) as List<dynamic>;

  print('loading metrics ');
  final metricsString = await File(
          './assets/test_data/get-user-contract-metrics-with-contracts.json')
      .readAsString();
  final actualUserContractsJson = jsonDecode(metricsString);

  print('loaded successfully?');
}
