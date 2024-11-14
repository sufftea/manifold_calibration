import 'package:manifold_callibration/data/bets_repository.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';

class BetsRepositoryMock implements BetsRepository {
  @override
  Future<List<Bet>> getUserBets(String username) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Bet(
        id: 'huy9Pnqq6O69',
        outcome: BinaryYesBetOutcome(probAfter: 0.5613878471696756),
        updatedTime: DateTime.parse('2024-11-10T23:14:46.000'),
        market: Market(id: 'E628cNnNEq', outcome: null),
      ),
      Bet(
        id: '2s6q22qc5UZd',
        outcome: BinaryYesBetOutcome(probAfter: 0.07603147973796494),
        updatedTime: DateTime.parse('2024-11-07T20:48:54.000'),
        market: Market(
            id: 'LUfHod2UsrGClj9T3ziA', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'L8R98qqnsNNI',
        outcome: BinaryNoBetOutcome(probAfter: 0.07603147973796494),
        updatedTime: DateTime.parse('2024-11-07T20:48:54.000'),
        market: Market(
            id: 'LUfHod2UsrGClj9T3ziA', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'zIuh8ICzQNsy',
        outcome: BinaryNoBetOutcome(probAfter: 0.07603147973796494),
        updatedTime: DateTime.parse('2024-11-07T20:48:54.000'),
        market: Market(
            id: 'LUfHod2UsrGClj9T3ziA', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'QsULZusO5NnS',
        outcome: BinaryYesBetOutcome(probAfter: 0.027182643807744288),
        updatedTime: DateTime.parse('2024-11-07T16:22:25.000'),
        market: Market(
            id: 'LUfHod2UsrGClj9T3ziA', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '4a12azWWISJE',
        outcome: BinaryYesBetOutcome(probAfter: 0.21213820223160254),
        updatedTime: DateTime.parse('2024-09-19T06:37:30.000'),
        market: Market(
            id: 'kuCvMHLZ8wtaYYqb4sWe', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: '3t6pA2cjUILT',
        outcome: BinaryNoBetOutcome(probAfter: 0.3749518911048558),
        updatedTime: DateTime.parse('2024-09-06T06:05:48.000'),
        market: Market(id: 'cy4il0tvgl', outcome: null),
      ),
      Bet(
        id: 'b0vMoLmJvV09',
        outcome: BinaryYesBetOutcome(probAfter: 0.6740802739928277),
        updatedTime: DateTime.parse('2024-09-03T02:34:49.000'),
        market: Market(id: 'BcJbQTDX1rdmaLYGKUOz', outcome: null),
      ),
      Bet(
        id: '9rzFlEaXiNv9',
        outcome: BinaryYesBetOutcome(probAfter: 0.07048230581851339),
        updatedTime: DateTime.parse('2024-08-26T16:11:15.000'),
        market: Market(
            id: 'O941dnCU7xt65y5W2DBz', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'JZHSnuYcQP7R',
        outcome: BinaryYesBetOutcome(probAfter: 0.026744321489377037),
        updatedTime: DateTime.parse('2024-08-23T09:13:21.000'),
        market: Market(
            id: 'LUfHod2UsrGClj9T3ziA', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'v6FgbvN8CjqD',
        outcome: BinaryYesBetOutcome(probAfter: 0.029823622543940605),
        updatedTime: DateTime.parse('2024-08-19T23:41:29.000'),
        market: Market(
            id: 'LUfHod2UsrGClj9T3ziA', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'ss8yhrmv1EN0',
        outcome: BinaryYesBetOutcome(probAfter: 0.45563892672752676),
        updatedTime: DateTime.parse('2024-08-11T07:36:53.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'ha8pAqyBbGHb',
        outcome: BinaryYesBetOutcome(probAfter: 0.4414785854300866),
        updatedTime: DateTime.parse('2024-08-10T00:41:01.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: '43uvaJXkBVUc',
        outcome: BinaryYesBetOutcome(probAfter: 0.06249097905916199),
        updatedTime: DateTime.parse('2024-08-08T08:19:39.000'),
        market: Market(
            id: 'O941dnCU7xt65y5W2DBz', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'zPhkTkQXDWkj',
        outcome: BinaryNoBetOutcome(probAfter: 0.04105555682541214),
        updatedTime: DateTime.parse('2024-08-08T08:18:37.000'),
        market: Market(
            id: 'O941dnCU7xt65y5W2DBz', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'rkfreomLaHBO',
        outcome: BinaryYesBetOutcome(probAfter: 0.03332456228673828),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '3mceaVM7wVq0',
        outcome: BinaryYesBetOutcome(probAfter: 0.04255784703935991),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'atUXzWLE9gcx',
        outcome: BinaryYesBetOutcome(probAfter: 0.026630913755073714),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'tmIh6XBjPe8w',
        outcome: BinaryYesBetOutcome(probAfter: 0.03332456228673828),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'srBZJFcMlSka',
        outcome: BinaryYesBetOutcome(probAfter: 0.046187019590598725),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '7WmGeVCDjofC',
        outcome: BinaryYesBetOutcome(probAfter: 0.04255784703935991),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'Um3dtIXrsMzM',
        outcome: BinaryYesBetOutcome(probAfter: 0.046187019590598725),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'Y95pyIBlkUN1',
        outcome: BinaryYesBetOutcome(probAfter: 0.026630913755073714),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'AtCFDncQ4xDS',
        outcome: BinaryYesBetOutcome(probAfter: 0.046187019590598725),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'QcpvkairEZkt',
        outcome: BinaryYesBetOutcome(probAfter: 0.04255784703935991),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'EoKeN5AFSbt3',
        outcome: BinaryYesBetOutcome(probAfter: 0.03332456228673828),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'mOo0fjG9aD6D',
        outcome: BinaryYesBetOutcome(probAfter: 0.03332456228673828),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'hfnQ5CCAL90B',
        outcome: BinaryYesBetOutcome(probAfter: 0.04255784703935991),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'aElTsrqtqcJT',
        outcome: BinaryYesBetOutcome(probAfter: 0.03332456228673828),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'UtBDSq2Zv6rM',
        outcome: BinaryYesBetOutcome(probAfter: 0.04255784703935991),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'eP5JqctwLSrs',
        outcome: BinaryYesBetOutcome(probAfter: 0.04255784703935991),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'ZOyh1nhGbSMV',
        outcome: BinaryYesBetOutcome(probAfter: 0.04255784703935991),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'hf8pfOctyZ0X',
        outcome: BinaryYesBetOutcome(probAfter: 0.026630913755073714),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '7AjggF3f57yw',
        outcome: BinaryYesBetOutcome(probAfter: 0.026630913755073714),
        updatedTime: DateTime.parse('2024-07-31T20:01:12.000'),
        market: Market(id: 'xcx2lzq2tr', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'cIx7mTJ1nlCh',
        outcome: BinaryYesBetOutcome(probAfter: 0.02203208043293702),
        updatedTime: DateTime.parse('2024-07-24T17:50:42.000'),
        market: Market(
            id: 'O941dnCU7xt65y5W2DBz', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '5BQnMuUsXTQN',
        outcome: BinaryYesBetOutcome(probAfter: 0.012226953466508211),
        updatedTime: DateTime.parse('2024-07-24T17:50:11.000'),
        market: Market(
            id: 'O941dnCU7xt65y5W2DBz', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '5Lvy6lPTy65X',
        outcome: BinaryYesBetOutcome(probAfter: 0.04438762971559802),
        updatedTime: DateTime.parse('2024-07-24T17:50:03.000'),
        market: Market(
            id: 'O941dnCU7xt65y5W2DBz', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'GNSdtA9n2s9L',
        outcome: BinaryYesBetOutcome(probAfter: 0.023017190364335905),
        updatedTime: DateTime.parse('2024-07-24T17:49:54.000'),
        market: Market(
            id: 'O941dnCU7xt65y5W2DBz', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 's8DEwzPvqjLc',
        outcome: BinaryNoBetOutcome(probAfter: 0.05178263468417654),
        updatedTime: DateTime.parse('2024-07-24T17:49:08.000'),
        market: Market(
            id: 'O941dnCU7xt65y5W2DBz', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'IHMDUvpluuwT',
        outcome: BinaryNoBetOutcome(probAfter: 0.04067594473451542),
        updatedTime: DateTime.parse('2024-07-24T17:48:59.000'),
        market: Market(
            id: 'O941dnCU7xt65y5W2DBz', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'RvGM00hLS3Df',
        outcome: BinaryNoBetOutcome(probAfter: 0.032978595945770864),
        updatedTime: DateTime.parse('2024-07-24T17:48:41.000'),
        market: Market(
            id: 'O941dnCU7xt65y5W2DBz', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'wgEDu9THH4i4',
        outcome: BinaryYesBetOutcome(probAfter: 0.7799590914836645),
        updatedTime: DateTime.parse('2024-07-24T06:48:30.000'),
        market: Market(id: '1rF6Kxt2ySIk5PqVPKZu', outcome: null),
      ),
      Bet(
        id: '1d8zYe5y50S3',
        outcome: BinaryNoBetOutcome(probAfter: 0.5321418193593398),
        updatedTime: DateTime.parse('2024-07-21T00:25:09.000'),
        market: Market(id: 'w4l6r8bqau', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'b3LUxAbdaFLF',
        outcome: BinaryYesBetOutcome(probAfter: 0.1592455471948558),
        updatedTime: DateTime.parse('2024-07-19T03:03:01.000'),
        market: Market(
            id: 'YTIuuSsNRn2OlA4KykRM', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: '2qb4FD4iO1zg',
        outcome: BinaryYesBetOutcome(probAfter: 0.01885215853383643),
        updatedTime: DateTime.parse('2024-06-27T16:15:33.000'),
        market: Market(
            id: 'LUfHod2UsrGClj9T3ziA', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'ZRRN6EqL2EVd',
        outcome: BinaryNoBetOutcome(probAfter: 0.11024301852358086),
        updatedTime: DateTime.parse('2024-06-07T19:37:55.000'),
        market: Market(
            id: 'O941dnCU7xt65y5W2DBz', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'apCYe6HNowXd',
        outcome: BinaryYesBetOutcome(probAfter: 0.34039363515773163),
        updatedTime: DateTime.parse('2024-05-26T03:28:40.000'),
        market: Market(id: 'MiYKcO3SMlpUqgbRh9TK', outcome: null),
      ),
      Bet(
        id: 'XxIP15Q9yrkW',
        outcome: BinaryYesBetOutcome(probAfter: 0.7444555673722407),
        updatedTime: DateTime.parse('2024-05-24T15:41:26.000'),
        market: Market(id: '0aoeJgwTsdA3ub166M1j', outcome: null),
      ),
      Bet(
        id: 'MmGaNLJYujijIseyg7vq',
        outcome: BinaryNoBetOutcome(probAfter: 0.7448531598931759),
        updatedTime: DateTime.parse('2024-05-23T07:33:36.000'),
        market: Market(
            id: 'WniqmZSD5cN6z9542P7Z', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'EQlb2C7huPkoxWrUhJYu',
        outcome: BinaryNoBetOutcome(probAfter: 0.5612893564733776),
        updatedTime: DateTime.parse('2024-05-20T18:47:35.000'),
        market: Market(
            id: 'WniqmZSD5cN6z9542P7Z', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: '7bZAbXd69fPYP1fedxvV',
        outcome: BinaryYesBetOutcome(probAfter: 0.3285755592558454),
        updatedTime: DateTime.parse('2024-05-19T18:40:57.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'UXNr4WIHUd17IlFscIO2',
        outcome: BinaryYesBetOutcome(probAfter: 0.29714237249263176),
        updatedTime: DateTime.parse('2024-05-17T22:58:05.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'bNlZZv1nLrKOT36rkBS0',
        outcome: BinaryYesBetOutcome(probAfter: 0.23302511603036602),
        updatedTime: DateTime.parse('2024-05-14T17:23:48.000'),
        market: Market(
            id: 'LUfHod2UsrGClj9T3ziA', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '5KKIxbuG3KkS2RcDFEZV',
        outcome: BinaryYesBetOutcome(probAfter: 0.37916855494735),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: '1e3ISQVpNZAXJtdPcX2S', outcome: null),
      ),
      Bet(
        id: 'Y4lPyPn2AX50izS0EWKe',
        outcome: BinaryYesBetOutcome(probAfter: 0.5200000000000002),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'uZg53aySVmvhJRYER4iy', outcome: null),
      ),
      Bet(
        id: 'jkImAhqp9Fm0mC8klZ7Y',
        outcome: BinaryNoBetOutcome(probAfter: 0.20436561831939795),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'cCACejoJaCvFPmMWpTDe', outcome: null),
      ),
      Bet(
        id: '1quMJqW7fO24AHH0lSnV',
        outcome: BinaryYesBetOutcome(probAfter: 0.6852600445178343),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: 'Via4uNfnVM4XTwwGolZp', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'ylV7SAghfiMAwSivssfz',
        outcome: BinaryYesBetOutcome(probAfter: 0.7627805911372261),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'RxR5grRyVrDm0wtzhAuM', outcome: null),
      ),
      Bet(
        id: 'voenqiRinWJAdCRed884',
        outcome: BinaryYesBetOutcome(probAfter: 0.22157281766348394),
        updatedTime: DateTime.parse('2024-04-27T03:50:59.000'),
        market: Market(
            id: 'JIHxfloj52qW9rzGWj9s', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'SGbQc1j10bpsF8GpmoqD',
        outcome: BinaryNoBetOutcome(probAfter: 0.1879880599192835),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: 'JIHxfloj52qW9rzGWj9s', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '9N69eumcmn7WWFb29OYG',
        outcome: BinaryYesBetOutcome(probAfter: 0.1722537540820112),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: 'JIHxfloj52qW9rzGWj9s', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'pvttKWMpzGYYMAysZMGn',
        outcome: BinaryNoBetOutcome(probAfter: 0.22726811925721285),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'S9xaZi56HNsTeCvrWHWE', outcome: null),
      ),
      Bet(
        id: 'Bo1Ue8O43nGn9sretNg2',
        outcome: BinaryYesBetOutcome(probAfter: 0.28180581377402514),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'dkcu3Ae4HpABJhDIp5Ie', outcome: null),
      ),
      Bet(
        id: 'BRN2OklfInUo3Hav987A',
        outcome: BinaryYesBetOutcome(probAfter: 0.2996628382097278),
        updatedTime: DateTime.parse('2024-04-21T21:38:41.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'VoeqRUOTllEKo7V4Anui',
        outcome: BinaryYesBetOutcome(probAfter: 0.9114619719084721),
        updatedTime: DateTime.parse('2024-04-13T16:14:35.000'),
        market: Market(
            id: 'TSJUTFEaZRAQppZ3ihqQ', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'CZMuK8AZLLTSwTyXRiZv',
        outcome: BinaryYesBetOutcome(probAfter: 0.3400000000000002),
        updatedTime: DateTime.parse('2024-04-06T07:37:46.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: '6xB914dV4DDejVIrVBRr',
        outcome: BinaryYesBetOutcome(probAfter: 0.3400962212710222),
        updatedTime: DateTime.parse('2024-04-05T23:03:22.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'tt5DNIMw662oFupO6eWu',
        outcome: BinaryYesBetOutcome(probAfter: 0.11000000000000001),
        updatedTime: DateTime.parse('2024-03-30T22:53:32.000'),
        market: Market(id: 'mZoOercJWPMFPM6XxKfI', outcome: null),
      ),
      Bet(
        id: 'nM5EfVqmANpWJJsK6i1W',
        outcome: BinaryYesBetOutcome(probAfter: 0.4077759145215733),
        updatedTime: DateTime.parse('2024-03-30T22:51:05.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'RBAz8BF5vj4zLUWt9E9k',
        outcome: BinaryNoBetOutcome(probAfter: 0.21216031933119245),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'exBzGmatm4RmNyUm44YU', outcome: null),
      ),
      Bet(
        id: 'nfxuzSoN356jAxHU0i5V',
        outcome: BinaryNoBetOutcome(probAfter: 0.024851406764222234),
        updatedTime: DateTime.parse('2024-03-28T19:20:51.000'),
        market: Market(
            id: 'bJgQ5907eSqI9LhexGFr', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'HPzrFEc3rauCYj76WoGv',
        outcome: BinaryNoBetOutcome(probAfter: 0.3495769715559973),
        updatedTime: DateTime.parse('2024-03-25T20:05:24.000'),
        market: Market(
            id: 'yi5CLp7JgIQM7D4mqLoO', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'AxquSXzg6YGY3yPUK3xT',
        outcome: BinaryYesBetOutcome(probAfter: 0.5454106847088094),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'zKn87wglAh8zef6T5KtG', outcome: null),
      ),
      Bet(
        id: 'OpQmLXdG2sU5Tp8b4FFJ',
        outcome: BinaryNoBetOutcome(probAfter: 0.0025478154760136596),
        updatedTime: DateTime.parse('2024-03-13T06:54:14.000'),
        market: Market(
            id: 'oJStcCDbR8kmkkvyNiV8', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'DKShO0mwsFlzgjEL93FK',
        outcome: BinaryYesBetOutcome(probAfter: 0.14137018998400744),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: '0LRuI1zVfI2zSbb7UGfm', outcome: null),
      ),
      Bet(
        id: '4pyjlHKcLjTeri52wuxK',
        outcome: BinaryYesBetOutcome(probAfter: 0.10000000000000005),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: 'nx3MjEJZWnARaTZPSy71', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'rK46ayMcx4MxVoYQ5Hi2',
        outcome: BinaryNoBetOutcome(probAfter: 0.03567544793495701),
        updatedTime: DateTime.parse('2024-03-04T12:06:41.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: '2o8pgFjoy496hC5TeAux',
        outcome: BinaryNoBetOutcome(probAfter: 0.03474683668179169),
        updatedTime: DateTime.parse('2024-03-04T08:30:37.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'XNJYCqODoRUWjctbZcCB',
        outcome: BinaryNoBetOutcome(probAfter: 0.034690765227406044),
        updatedTime: DateTime.parse('2024-03-04T08:29:09.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'p1TnGcuKxLrOXjLrjjqf',
        outcome: BinaryNoBetOutcome(probAfter: 0.03494972464561324),
        updatedTime: DateTime.parse('2024-03-04T01:35:43.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'mK1n6mW0cDlqCQ60Xt0n',
        outcome: BinaryNoBetOutcome(probAfter: 0.06630141708313521),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: 'yWuMGGCTzfnhPOMBfQIY', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'D3TsJjdKY5UJzJUfowkV',
        outcome: BinaryNoBetOutcome(probAfter: 0.08261559699064627),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: '6EqOIXF40jfdHKPiwNS5', outcome: null),
      ),
      Bet(
        id: '5ZFJ8SfIQy0OJNj8KOhT',
        outcome: BinaryNoBetOutcome(probAfter: 0.06083069101247159),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'IiB0Yp63a5neUy5Uun04', outcome: null),
      ),
      Bet(
        id: 'Tiz6nZV0Wwiz9zz78c1J',
        outcome: BinaryNoBetOutcome(probAfter: 0.28447963222866174),
        updatedTime: DateTime.parse('2024-04-01T06:53:26.000'),
        market: Market(
            id: 'bJgQ5907eSqI9LhexGFr', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'TYoyFnnjcBaOiucSiPin',
        outcome: BinaryNoBetOutcome(probAfter: 0.041568246870594114),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'EkQ2O0NfRYTHcHfGI4hw', outcome: null),
      ),
      Bet(
        id: '5Nc1vssrnoG1JWpfFh4i',
        outcome: BinaryNoBetOutcome(probAfter: 0.03472044486384884),
        updatedTime: DateTime.parse('2024-02-25T00:35:06.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'E3EB7bb8SlMAYddf5jyE',
        outcome: BinaryNoBetOutcome(probAfter: 0.034527474202326),
        updatedTime: DateTime.parse('2024-02-23T09:20:56.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: '7HyqbBXSRJY0atMV9RCD',
        outcome: BinaryYesBetOutcome(probAfter: 0.5719929109743217),
        updatedTime: DateTime.parse('2024-02-28T02:22:12.000'),
        market: Market(id: 'hYZLy1U5oiOoZGf4K6gR', outcome: null),
      ),
      Bet(
        id: 'H1DNtlOgUsuXRreZg3D3',
        outcome: BinaryYesBetOutcome(probAfter: 0.5506774201029548),
        updatedTime: DateTime.parse('2024-02-22T01:52:46.000'),
        market: Market(id: 'hYZLy1U5oiOoZGf4K6gR', outcome: null),
      ),
      Bet(
        id: 'yQtAQm1P7Ruk1uAoK4pe',
        outcome: BinaryYesBetOutcome(probAfter: 0.6868872650249007),
        updatedTime: DateTime.parse('2024-02-21T21:05:55.000'),
        market: Market(id: 'hYZLy1U5oiOoZGf4K6gR', outcome: null),
      ),
      Bet(
        id: 'TfMmCSSsxr3b4GGwi4hG',
        outcome: BinaryYesBetOutcome(probAfter: 0.7641509433962264),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'hYZLy1U5oiOoZGf4K6gR', outcome: null),
      ),
      Bet(
        id: 'xjZMuxKeSfhDlnbukuVo',
        outcome: BinaryNoBetOutcome(probAfter: 0.15671081246899166),
        updatedTime: DateTime.parse('2024-02-20T12:53:58.000'),
        market: Market(id: 'yQeLTApzKi8E2kjWKF3q', outcome: null),
      ),
      Bet(
        id: 'aYBklnAWzAKVNvQMUwME',
        outcome: BinaryNoBetOutcome(probAfter: 0.021183443838709525),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: 'uNnEF9QZmbGlcIpUhNb1', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '3OBmoMQm4hCCw9vqmBVE',
        outcome: BinaryYesBetOutcome(probAfter: 0.7337764406231031),
        updatedTime: DateTime.parse('2024-05-10T23:18:14.000'),
        market: Market(id: 'AaZr2KnQYHGRVHzvKoHa', outcome: null),
      ),
      Bet(
        id: 'cvtu8tfhXtUr01AI1sWx',
        outcome: BinaryNoBetOutcome(probAfter: 0.5189970263796034),
        updatedTime: DateTime.parse('2024-04-01T06:53:26.000'),
        market: Market(
            id: 'HxUShLjbV5KIbOtvEVGk',
            outcome: BinaryMktMarketOutcome(probability: 0.05)),
      ),
      Bet(
        id: '9ORKHiRBuVai2PwP9uI7',
        outcome: BinaryYesBetOutcome(probAfter: 0.6999999999999998),
        updatedTime: DateTime.parse('2024-02-16T15:01:47.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'o1TlSV5qKLCtbEvWSBaR',
        outcome: BinaryNoBetOutcome(probAfter: 0.6999999999999998),
        updatedTime: DateTime.parse('2024-02-16T15:01:47.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: '3WjGKvCHbOzhzV72jSc3',
        outcome: BinaryYesBetOutcome(probAfter: 0.6999999999999998),
        updatedTime: DateTime.parse('2024-02-16T14:33:26.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'hFPsyAaogl6jCnYo5Dfs',
        outcome: BinaryNoBetOutcome(probAfter: 0.6999999999999998),
        updatedTime: DateTime.parse('2024-02-16T14:33:26.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: '6iEIwsz45LLhieyvM0Ef',
        outcome: BinaryYesBetOutcome(probAfter: 0.6999999999999998),
        updatedTime: DateTime.parse('2024-02-16T14:32:31.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: '4iRQ84mHTbgRYwR3KVgL',
        outcome: BinaryNoBetOutcome(probAfter: 0.6999999999999998),
        updatedTime: DateTime.parse('2024-02-16T14:32:31.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: '2vnQOuNOMYeEvCSfZzLx',
        outcome: BinaryNoBetOutcome(probAfter: 0.6999999999999998),
        updatedTime: DateTime.parse('2024-02-23T14:31:23.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'UJ2VxZBL74iN1ElEDOIr',
        outcome: BinaryNoBetOutcome(probAfter: 0.03197812714257967),
        updatedTime: DateTime.parse('2024-04-01T17:17:18.000'),
        market: Market(
            id: 'aK7xmZiz7uE8tlaa3D3d', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'FcCHYlAnZBMqF5Jptvvq',
        outcome: BinaryYesBetOutcome(probAfter: 0.06710935091593484),
        updatedTime: DateTime.parse('2024-02-02T17:22:20.000'),
        market: Market(
            id: 'FeUa4fLXINiuaOC3blmB', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'hpMtbQa4nKVn58HwCNuU',
        outcome: BinaryYesBetOutcome(probAfter: 0.73),
        updatedTime: DateTime.parse('2024-02-02T17:21:00.000'),
        market: Market(id: '4MkPyu5D9MRLPREODSD7', outcome: null),
      ),
      Bet(
        id: 'B8huPQ8tqe6p2edWvnl1',
        outcome: BinaryYesBetOutcome(probAfter: 0.969906228463621),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: 'gFdknKY3QlPPkaUT8ykx', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'pVWK7QBgpDRCpSYR3pbG',
        outcome: BinaryNoBetOutcome(probAfter: 0.4894864139965329),
        updatedTime: DateTime.parse('2024-01-24T02:33:40.000'),
        market: Market(
            id: '2LlPluvb3GHpurMlcfow', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '6I1z0Zl6UVki4fwC7rFo',
        outcome: BinaryYesBetOutcome(probAfter: 0.14921426571788607),
        updatedTime: DateTime.parse('2024-01-22T16:42:43.000'),
        market: Market(
            id: 'FeUa4fLXINiuaOC3blmB', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'IbXj0jQYY1rANaTgIalF',
        outcome: BinaryYesBetOutcome(probAfter: 0.23189300635046017),
        updatedTime: DateTime.parse('2024-01-22T16:42:30.000'),
        market: Market(
            id: 'FeUa4fLXINiuaOC3blmB', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '6USr3ZQ6Wd5cHm8iY83t',
        outcome: BinaryYesBetOutcome(probAfter: 0.08859680829370489),
        updatedTime: DateTime.parse('2024-01-22T16:41:20.000'),
        market: Market(
            id: 'FeUa4fLXINiuaOC3blmB', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'pXO9WI9re4BWCDNnhcQQ',
        outcome: BinaryYesBetOutcome(probAfter: 0.19452694059610867),
        updatedTime: DateTime.parse('2024-01-22T16:40:52.000'),
        market: Market(
            id: 'FeUa4fLXINiuaOC3blmB', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '6j87iHJUS2ZlQquxSGTj',
        outcome: BinaryNoBetOutcome(probAfter: 0.1485241663223081),
        updatedTime: DateTime.parse('2024-01-22T16:40:02.000'),
        market: Market(
            id: 'FeUa4fLXINiuaOC3blmB', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '7o5VHqgb9ktdCctfyADq',
        outcome: BinaryYesBetOutcome(probAfter: 0.2499999999999998),
        updatedTime: DateTime.parse('2024-01-21T21:28:33.000'),
        market: Market(id: 'BcJbQTDX1rdmaLYGKUOz', outcome: null),
      ),
      Bet(
        id: 'nNhHxsnDmUQChM2s0Zef',
        outcome: BinaryYesBetOutcome(probAfter: 0.33671867829869173),
        updatedTime: DateTime.parse('2024-01-21T21:25:25.000'),
        market: Market(id: 'WQ6zukx8CRol0ayLu1pb', outcome: null),
      ),
      Bet(
        id: 'gXyWmATY39ku8b0cKkmj',
        outcome: BinaryNoBetOutcome(probAfter: 0.6066856226635479),
        updatedTime: DateTime.parse('2024-01-21T17:35:46.000'),
        market: Market(
            id: 'wUVx1lah6QNcAeSYcNCc', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'KxFw3Q9xBIowgaakNQ5p',
        outcome: BinaryNoBetOutcome(probAfter: 0.6073973712460623),
        updatedTime: DateTime.parse('2024-01-21T17:35:21.000'),
        market: Market(
            id: 'wUVx1lah6QNcAeSYcNCc', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'yLnMgzGsLEURemMPjT8Y',
        outcome: BinaryNoBetOutcome(probAfter: 0.5682431314097525),
        updatedTime: DateTime.parse('2024-01-21T14:35:33.000'),
        market: Market(
            id: 'wUVx1lah6QNcAeSYcNCc', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'uZ9i9GWJPwKkfUSB21zm',
        outcome: BinaryNoBetOutcome(probAfter: 0.5728537215702378),
        updatedTime: DateTime.parse('2024-01-21T14:35:14.000'),
        market: Market(
            id: 'wUVx1lah6QNcAeSYcNCc', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: '0tAM0jKTZZRuNwUms4YD',
        outcome: BinaryYesBetOutcome(probAfter: 0.9464387765083118),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'Mz4fbDGSVFvEizkoGPIr', outcome: null),
      ),
      Bet(
        id: 'BW1w6BB1hFdOOmjy3Lil',
        outcome: BinaryYesBetOutcome(probAfter: 0.09489169072079612),
        updatedTime: DateTime.parse('2024-01-18T21:44:14.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: 'Mml0fo9erp1EI8IUed82',
        outcome: BinaryYesBetOutcome(probAfter: 0.2186388816950722),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'BcJbQTDX1rdmaLYGKUOz', outcome: null),
      ),
      Bet(
        id: 'BRmG8J6laSR5cHGfVCFC',
        outcome: BinaryNoBetOutcome(probAfter: 0.10172525595848053),
        updatedTime: DateTime.parse('2024-01-17T23:44:52.000'),
        market: Market(
            id: '2Fx7Bc95V8ObllM9zsgT', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'TMrdLCli5npKicuudiyP',
        outcome: BinaryNoBetOutcome(probAfter: 0.11007860543893905),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(
            id: '2Fx7Bc95V8ObllM9zsgT', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'pXcNwY0tCfCUhmEQi9yo',
        outcome: BinaryNoBetOutcome(probAfter: 0.07961783439490451),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(
            id: '2Fx7Bc95V8ObllM9zsgT', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'kbsPdqkLEANp8WcKoCwh',
        outcome: BinaryYesBetOutcome(probAfter: 0.49467989898010334),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(
            id: '2Fx7Bc95V8ObllM9zsgT', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'npkrtxzUP050KRdok2O4',
        outcome: BinaryNoBetOutcome(probAfter: 0.11076923076923083),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(
            id: '2Fx7Bc95V8ObllM9zsgT', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'Duwx0y2RoCmsXKbA0k0I',
        outcome: BinaryNoBetOutcome(probAfter: 0.01846195305597853),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(
            id: '2Fx7Bc95V8ObllM9zsgT', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'BNwhKJrpBIuAwnEW6reC',
        outcome: BinaryYesBetOutcome(probAfter: 0.8138259311838316),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(
            id: '2Fx7Bc95V8ObllM9zsgT', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'kudSANC9uATGvRrPiHEM',
        outcome: BinaryYesBetOutcome(probAfter: 0.6155829371138571),
        updatedTime: DateTime.parse('2024-01-15T21:19:36.000'),
        market: Market(
            id: 'uh1Hz5g58IV9EeRRNEkD', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'vFsIvZV3QinATyG2k7D7',
        outcome: BinaryNoBetOutcome(probAfter: 0.09437150796727202),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'yQeLTApzKi8E2kjWKF3q', outcome: null),
      ),
      Bet(
        id: 'SnlvRvtJvqI3C4G26uhi',
        outcome: BinaryYesBetOutcome(probAfter: 0.11978863840473443),
        updatedTime: DateTime.parse('2024-01-14T07:43:45.000'),
        market: Market(
            id: '2LlPluvb3GHpurMlcfow', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'GmdFdRcUHi6AZ5hJGwVi',
        outcome: BinaryNoBetOutcome(probAfter: 0.11182065870060895),
        updatedTime: DateTime.parse('2024-03-27T01:18:46.000'),
        market: Market(
            id: '2LlPluvb3GHpurMlcfow', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'STNGsDQonx0aEzJpMCHA',
        outcome: BinaryYesBetOutcome(probAfter: 0.09047970332154708),
        updatedTime: DateTime.parse('2024-02-27T19:49:32.000'),
        market: Market(
            id: '2LlPluvb3GHpurMlcfow', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '3lpKLRzi53TLV1xWrDIK',
        outcome: BinaryYesBetOutcome(probAfter: 0.4999999999999999),
        updatedTime: DateTime.parse('2024-01-28T07:30:12.000'),
        market: Market(
            id: 'uh1Hz5g58IV9EeRRNEkD', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'erzg0uSYxumMKBIFLNdL',
        outcome: BinaryNoBetOutcome(probAfter: 0.5),
        updatedTime: DateTime.parse('2024-01-14T10:14:31.000'),
        market: Market(
            id: 'wUVx1lah6QNcAeSYcNCc', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'H3apYz1ksfrkInwxOyec',
        outcome: BinaryNoBetOutcome(probAfter: 0.434714950752035),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(
            id: 'JPgLY31MTl09FRcLjjio', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'H7nuRbRF4xrZGYXwSmd3',
        outcome: BinaryYesBetOutcome(probAfter: 0.2362053496615672),
        updatedTime: DateTime.parse('2024-01-13T21:20:39.000'),
        market: Market(
            id: 'FeUa4fLXINiuaOC3blmB', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'bzPANssP1MSar00egVZZ',
        outcome: BinaryYesBetOutcome(probAfter: 0.15936760440528114),
        updatedTime: DateTime.parse('2024-01-13T21:20:15.000'),
        market: Market(
            id: 'FeUa4fLXINiuaOC3blmB', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'dY9fyZQb2Lz4gLPbly9K',
        outcome: BinaryYesBetOutcome(probAfter: 0.2041255167226846),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(
            id: 'FeUa4fLXINiuaOC3blmB', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '63a4hrbI2G92rrNAKgIM',
        outcome: BinaryNoBetOutcome(probAfter: 0.10905461185811978),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(
            id: 'FeUa4fLXINiuaOC3blmB', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'MroI6I2pdLpdyP3rxsaB',
        outcome: BinaryNoBetOutcome(probAfter: 0.0974111319390129),
        updatedTime: DateTime.parse('2024-02-19T19:08:20.000'),
        market: Market(
            id: 'FeUa4fLXINiuaOC3blmB', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'io1NAM8QYVDn4C2powv6',
        outcome: BinaryNoBetOutcome(probAfter: 0.19488298972655968),
        updatedTime: DateTime.parse('2024-02-19T19:08:20.000'),
        market: Market(
            id: 'FeUa4fLXINiuaOC3blmB', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'nymZHsngsOzwKyv47aL9',
        outcome: BinaryNoBetOutcome(probAfter: 0.1261854426208874),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(
            id: 'FeUa4fLXINiuaOC3blmB', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'aHXzndVxNFVXezgCXHHp',
        outcome: BinaryNoBetOutcome(probAfter: 0.45586816684713954),
        updatedTime: DateTime.parse('2024-01-13T21:17:46.000'),
        market: Market(
            id: 'wUVx1lah6QNcAeSYcNCc', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'FBgjou53MHi85E47Hpyg',
        outcome: BinaryYesBetOutcome(probAfter: 0.6224336806532176),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: 'uh1Hz5g58IV9EeRRNEkD', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'WHMtgmIGcUaqxM0Mo1LV',
        outcome: BinaryNoBetOutcome(probAfter: 0.45630615428625365),
        updatedTime: DateTime.parse('2024-01-13T19:21:58.000'),
        market: Market(
            id: 'wUVx1lah6QNcAeSYcNCc', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'qVl3VqkTwBX741C6xEsA',
        outcome: BinaryNoBetOutcome(probAfter: 0.5032024416196441),
        updatedTime: DateTime.parse('2024-01-13T19:00:26.000'),
        market: Market(
            id: 'wUVx1lah6QNcAeSYcNCc', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: '5Jsm3lBl7VT0f3sVxLj7',
        outcome: BinaryNoBetOutcome(probAfter: 0.24516756436132214),
        updatedTime: DateTime.parse('2024-03-18T22:30:33.000'),
        market: Market(id: 'YC2uZVhcQvtwUA1vl6ph', outcome: null),
      ),
      Bet(
        id: 'YAWus124RbYA5YHYbH8e',
        outcome: BinaryNoBetOutcome(probAfter: 0.43435558235770344),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(
            id: 'a3k1RgxAVYiAU1qeA5Su', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'XRFPVv82y4oQdGGIAFT8',
        outcome: BinaryNoBetOutcome(probAfter: 0.567806474682294),
        updatedTime: DateTime.parse('2024-01-12T09:08:08.000'),
        market: Market(id: 'Hb1ObYB1ONHzFFNLacMR', outcome: null),
      ),
      Bet(
        id: 'iTd9gSNzYQlRzIEWACsz',
        outcome: BinaryNoBetOutcome(probAfter: 0.14428532599811336),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'YRRAc0vg1Z03fOEIZsON', outcome: null),
      ),
      Bet(
        id: 'bHdemotjkP5i8UxqYxIH',
        outcome: BinaryYesBetOutcome(probAfter: 0.5749999999999997),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: 'yGU0TdAda783KDLjklBH', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '0rK70pPE5G3ilEg60Lti',
        outcome: BinaryYesBetOutcome(probAfter: 0.1277381645694912),
        updatedTime: DateTime.parse('2024-01-09T20:45:27.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: 'duQ3TTAtwo41X1SFmAYc',
        outcome: BinaryNoBetOutcome(probAfter: 0.0414091394810875),
        updatedTime: DateTime.parse('2024-01-09T13:25:15.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'bpTCS2Is8vQUvOX7rIuU',
        outcome: BinaryNoBetOutcome(probAfter: 0.06851053005595097),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 't9dHIAyfX5f04LktaFvW', outcome: null),
      ),
      Bet(
        id: 'kbZympmB3Yw2fxgrGfUr',
        outcome: BinaryYesBetOutcome(probAfter: 0.967818362475259),
        updatedTime: DateTime.parse('2024-01-06T19:08:07.000'),
        market: Market(
            id: 'zQ4btZidOG75GYuIImZ1', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'Uht895Dl66xTyVBD2WXC',
        outcome: BinaryYesBetOutcome(probAfter: 0.9285539404105985),
        updatedTime: DateTime.parse('2024-01-01T23:26:15.000'),
        market: Market(
            id: 'YuUtwu9QxubW13gWfbWh', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '0HvOF9Qg06Pggy8XHzbo',
        outcome: BinaryYesBetOutcome(probAfter: 0.9690181943904225),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: 'YuUtwu9QxubW13gWfbWh', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '8ZCDCxxTD6ZbLv9zcKtu',
        outcome: BinaryNoBetOutcome(probAfter: 0.98),
        updatedTime: DateTime.parse('2024-01-01T06:58:48.000'),
        market: Market(
            id: '6dXuwlg3D1cZzgjrx3R7', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'HMF4cjm3EVnqcpnp9WEh',
        outcome: BinaryNoBetOutcome(probAfter: 0.98),
        updatedTime: DateTime.parse('2024-01-01T06:58:23.000'),
        market: Market(
            id: '6dXuwlg3D1cZzgjrx3R7', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'oj2ATReWRimdt61WEOgY',
        outcome: BinaryYesBetOutcome(probAfter: 0.8914405330518593),
        updatedTime: DateTime.parse('2024-01-01T06:47:05.000'),
        market: Market(
            id: '6dXuwlg3D1cZzgjrx3R7', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'g5ZO3eaIeREHJGf6XpHa',
        outcome: BinaryNoBetOutcome(probAfter: 0.9577749381194289),
        updatedTime: DateTime.parse('2024-01-01T06:54:13.000'),
        market: Market(
            id: '6dXuwlg3D1cZzgjrx3R7', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: '1EMxqhqPc1cbEkXN4gTN',
        outcome: BinaryNoBetOutcome(probAfter: 0.9678946550233078),
        updatedTime: DateTime.parse('2024-01-01T06:42:01.000'),
        market: Market(
            id: '6dXuwlg3D1cZzgjrx3R7', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'QSERcxQPH6nZeN67osSd',
        outcome: BinaryNoBetOutcome(probAfter: 0.0013674305524697663),
        updatedTime: DateTime.parse('2024-01-01T10:10:43.000'),
        market: Market(
            id: 'AY5xjGGSjl1kJwWjVSBE', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: '861DGVgDojS2nrlNw3a0',
        outcome: BinaryNoBetOutcome(probAfter: 0.0054236889803223175),
        updatedTime: DateTime.parse('2024-01-01T10:10:43.000'),
        market: Market(
            id: 'SEJblOu8vN0Oe384NonK', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'M7NXeNR3R7YyEKMzBtPg',
        outcome: BinaryNoBetOutcome(probAfter: 0.17957016407081142),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(
            id: 'wUVx1lah6QNcAeSYcNCc', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'HjhbhAcDj7QRwrsIcA4O',
        outcome: BinaryNoBetOutcome(probAfter: 0.21823343418150806),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'vBTiPDbmRyP4VlSOpOwf', outcome: null),
      ),
      Bet(
        id: '5UWM3k2r0N4RTzq1DVAV',
        outcome: BinaryYesBetOutcome(probAfter: 0.7926389745581579),
        updatedTime: DateTime.parse('2024-04-01T17:17:18.000'),
        market: Market(id: 'US37eQkudjSgCGFtVSRf', outcome: null),
      ),
      Bet(
        id: 'WRgyJeaGQ2RDqK7dx94h',
        outcome: BinaryYesBetOutcome(probAfter: 0.7900000000000001),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(id: '4MkPyu5D9MRLPREODSD7', outcome: null),
      ),
      Bet(
        id: '3OlM50Q6ZZwPGS7SCguw',
        outcome: BinaryYesBetOutcome(probAfter: 0.4000000000000001),
        updatedTime: DateTime.parse('2024-01-16T15:40:09.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'OgkOQvHDnF29Ex8bKcRV',
        outcome: BinaryNoBetOutcome(probAfter: 0.4000000000000001),
        updatedTime: DateTime.parse('2024-01-16T15:51:27.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'yn2Xb55DPnPDQfdg8AL8',
        outcome: BinaryNoBetOutcome(probAfter: 0.17000000000000012),
        updatedTime: DateTime.parse('2023-12-19T08:11:41.000'),
        market: Market(
            id: 'oJStcCDbR8kmkkvyNiV8', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'nreAiZeQAyq40VA7m6R4',
        outcome: BinaryNoBetOutcome(probAfter: 0.17000000000000004),
        updatedTime: DateTime.parse('2023-12-19T00:05:41.000'),
        market: Market(
            id: 'oJStcCDbR8kmkkvyNiV8', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'pQGuPCp5pSjmiaMbI1Pd',
        outcome: BinaryNoBetOutcome(probAfter: 0.1942095046803891),
        updatedTime: DateTime.parse('2024-01-01T01:41:12.000'),
        market: Market(
            id: 'p5uaETNWYokvxyy4ggEE', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'lkDMCPVrono9zPvF8NVz',
        outcome: BinaryNoBetOutcome(probAfter: 0.1416227176328153),
        updatedTime: DateTime.parse('2024-01-01T01:41:12.000'),
        market: Market(
            id: 'aUsvvf14Vy25yONXQME9', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'zfm2JoYs09lTKpIaLgih',
        outcome: BinaryNoBetOutcome(probAfter: 0.17376348951821008),
        updatedTime: DateTime.parse('2023-12-18T22:33:30.000'),
        market: Market(
            id: 'oJStcCDbR8kmkkvyNiV8', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'AL7WM4MZFxe620Qd62D2',
        outcome: BinaryNoBetOutcome(probAfter: 0.12498218414158295),
        updatedTime: DateTime.parse('2023-12-18T17:13:37.000'),
        market: Market(
            id: 'oJStcCDbR8kmkkvyNiV8', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 's4xHpJ4JMddGjncW1AoR',
        outcome: BinaryNoBetOutcome(probAfter: 0.09999999999999999),
        updatedTime: DateTime.parse('2024-03-12T00:22:32.000'),
        market: Market(
            id: 'oJStcCDbR8kmkkvyNiV8', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'jL6xIeQhIYCq1qKQCLBg',
        outcome: BinaryNoBetOutcome(probAfter: 0.03000000000000005),
        updatedTime: DateTime.parse('2023-12-13T18:39:51.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'bEHbJcTZW4ITibWp62ym',
        outcome: BinaryNoBetOutcome(probAfter: 0.02968715854539388),
        updatedTime: DateTime.parse('2023-12-06T22:51:12.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'kHM9zHIgC9cJdVhe5jzR',
        outcome: BinaryNoBetOutcome(probAfter: 0.03914807357176346),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'kdtrrpKEO3k0d0hFffIl', outcome: null),
      ),
      Bet(
        id: 'KdZJzDPCWM9PaBWs1GnT',
        outcome: BinaryNoBetOutcome(probAfter: 0.06410234497000358),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'YldS99vQ6CsMJdZYZGLs', outcome: null),
      ),
      Bet(
        id: 'VPepjnEZ2N4uC7og4AxL',
        outcome: BinaryYesBetOutcome(probAfter: 0.36810290499062703),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: 'cE8Ni0UJsGFIex3gNiT9', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'CJ8yzWGOouJaSghSlBiR',
        outcome: BinaryYesBetOutcome(probAfter: 0.352044177528216),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'WQ6zukx8CRol0ayLu1pb', outcome: null),
      ),
      Bet(
        id: 'EWWaKBe5gRxiAF6ShVeW',
        outcome: BinaryYesBetOutcome(probAfter: 0.7142573734390407),
        updatedTime: DateTime.parse('2023-12-04T10:17:56.000'),
        market: Market(
            id: 'nPiYndJ2rnDGSeCr3rnI', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: '3WqhiEClOsrjgHR0n4hG',
        outcome: BinaryNoBetOutcome(probAfter: 0.8636608763734611),
        updatedTime: DateTime.parse('2024-05-01T03:21:21.000'),
        market: Market(id: 'oA4HtGxQopr70aALEw26', outcome: null),
      ),
      Bet(
        id: 'XuiaIrzcvYhXHBQ6qzBk',
        outcome: BinaryNoBetOutcome(probAfter: 0.7190536781717272),
        updatedTime: DateTime.parse('2023-11-23T06:25:34.000'),
        market: Market(id: 'ubwd4HRwIKt7ms34BhtW', outcome: null),
      ),
      Bet(
        id: 'RLf6rEkQUfhd9isEAHDw',
        outcome: BinaryNoBetOutcome(probAfter: 0.4000000000000001),
        updatedTime: DateTime.parse('2023-11-23T06:21:06.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'GYmvYm0SeEeDRB64kn15',
        outcome: BinaryNoBetOutcome(probAfter: 0.4152823030892461),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(
            id: 'oHKwM5KXR9lmKYgVIfBR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '5pYmUMuxjbWHu5szsyT9',
        outcome: BinaryYesBetOutcome(probAfter: 0.191431453840915),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: 'YUSYFKsEb8E2gYHxdBOA', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'dFIKbO6IIfv3V9HL5Rvx',
        outcome: BinaryYesBetOutcome(probAfter: 0.3300000000000001),
        updatedTime: DateTime.parse('2023-11-19T01:21:06.000'),
        market: Market(id: 'hewgGX3vUjCZR5WqcB2a', outcome: null),
      ),
      Bet(
        id: 'OH235vYVAw77qMNwvJWX',
        outcome: BinaryNoBetOutcome(probAfter: 0.4),
        updatedTime: DateTime.parse('2023-11-18T23:27:58.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'sQYnRRx7E7wOlgjQhYkv',
        outcome: BinaryYesBetOutcome(probAfter: 0.6613320142606819),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(id: 'IUetZc700ZLVlkWh6n0D', outcome: null),
      ),
      Bet(
        id: 'DTxbjyUniJkAYWcBw8CO',
        outcome: BinaryNoBetOutcome(probAfter: 0.396135356517105),
        updatedTime: DateTime.parse('2023-11-21T10:23:58.000'),
        market: Market(
            id: '38bQQV167g1mbmFOl4mE', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'FyNx5cB89EGIS72djOqx',
        outcome: BinaryNoBetOutcome(probAfter: 0.10915976852029954),
        updatedTime: DateTime.parse('2024-01-04T22:15:33.000'),
        market: Market(
            id: 'oHKwM5KXR9lmKYgVIfBR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'NSEbktt8otC6J20pLVxP',
        outcome: BinaryNoBetOutcome(probAfter: 0.14442032071489527),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(
            id: 'oHKwM5KXR9lmKYgVIfBR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '56m8irhBqiiG5usUzPp4',
        outcome: BinaryNoBetOutcome(probAfter: 0.11425731420458152),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(
            id: 'oHKwM5KXR9lmKYgVIfBR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'JqUY3lZSXYY0ZLKvdlvA',
        outcome: BinaryYesBetOutcome(probAfter: 0.7200163172747753),
        updatedTime: DateTime.parse('2023-11-18T10:09:00.000'),
        market: Market(id: 'hewgGX3vUjCZR5WqcB2a', outcome: null),
      ),
      Bet(
        id: 'NK8rQGoVVTx8GuDd6KRg',
        outcome: BinaryNoBetOutcome(probAfter: 0.0898884073196378),
        updatedTime: DateTime.parse('2023-12-22T11:35:49.000'),
        market: Market(id: '6ShC1xoK0JkpUu7edswH', outcome: null),
      ),
      Bet(
        id: 'KPGPtmW5RsnJx6Pub7Oy',
        outcome: BinaryNoBetOutcome(probAfter: 0.034107433049105504),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: 'UOD1hvJcAaXiY13cNXyj', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'WbjwhZTNgc4eA5kqm99D',
        outcome: BinaryNoBetOutcome(probAfter: 0.16259681623760142),
        updatedTime: DateTime.parse('2024-01-04T22:15:33.000'),
        market: Market(
            id: 'oHKwM5KXR9lmKYgVIfBR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'mJgkDDgBmE9NL25fv4Fl',
        outcome: BinaryNoBetOutcome(probAfter: 0.026773642024294022),
        updatedTime: DateTime.parse('2023-11-18T02:00:57.000'),
        market: Market(
            id: 'oHKwM5KXR9lmKYgVIfBR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '8NtoHPLaYEfXo5Yj6LI3',
        outcome: BinaryYesBetOutcome(probAfter: 0.9839266052395552),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'xGWh11BxOECDpE3TrdQV', outcome: null),
      ),
      Bet(
        id: 'JqlG7qNHf5Dtc4tNFMxk',
        outcome: BinaryYesBetOutcome(probAfter: 0.18563143940943358),
        updatedTime: DateTime.parse('2023-11-27T23:07:17.000'),
        market: Market(id: 'i95HLfK9N6hu5H7orfNj', outcome: null),
      ),
      Bet(
        id: 'YYOMfjnsfnTUqBnmHYoi',
        outcome: BinaryYesBetOutcome(probAfter: 0.19000000000000006),
        updatedTime: DateTime.parse('2023-11-08T23:57:04.000'),
        market: Market(id: 'i95HLfK9N6hu5H7orfNj', outcome: null),
      ),
      Bet(
        id: 'incpY56fFZ5IgDJXj2ZH',
        outcome: BinaryNoBetOutcome(probAfter: 0.499830914157153),
        updatedTime: DateTime.parse('2023-12-14T10:24:46.000'),
        market: Market(
            id: 'pIGQYjZ9U21tWrBpnLof', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'RALVjoXMuGHOMLL6FARr',
        outcome: BinaryNoBetOutcome(probAfter: 0.03792289215334576),
        updatedTime: DateTime.parse('2023-11-06T04:51:52.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'nPnIpM38peVkiEt3xsuX',
        outcome: BinaryNoBetOutcome(probAfter: 0.036460217498743785),
        updatedTime: DateTime.parse('2023-11-04T16:54:41.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'N8v9rX8OK3uRdPRxAhFu',
        outcome: BinaryYesBetOutcome(probAfter: 0.31351143846901375),
        updatedTime: DateTime.parse('2023-12-23T23:42:19.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'Srqp7OHevYgibnUK8VAn',
        outcome: BinaryNoBetOutcome(probAfter: 0.033399047815431133),
        updatedTime: DateTime.parse('2023-11-01T21:30:17.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'tC1b6mZe6dbEcMYd0ldd',
        outcome: BinaryNoBetOutcome(probAfter: 0.03700785322326811),
        updatedTime: DateTime.parse('2023-10-31T16:22:40.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'I2SpAGrPNjgH0DkDh9V6',
        outcome: BinaryNoBetOutcome(probAfter: 0.03969525880541638),
        updatedTime: DateTime.parse('2023-11-04T20:16:07.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'RfQSt8CulggH8AO6CQLx',
        outcome: BinaryNoBetOutcome(probAfter: 0.04067868454861103),
        updatedTime: DateTime.parse('2023-11-04T20:16:07.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'FOJxVBZNCK9PtIRBjS1U',
        outcome: BinaryNoBetOutcome(probAfter: 0.03432109876577461),
        updatedTime: DateTime.parse('2023-10-28T01:40:00.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: '6JBxbZVMoEygEvNdHID3',
        outcome: BinaryNoBetOutcome(probAfter: 0.03432109876577461),
        updatedTime: DateTime.parse('2023-10-26T20:36:12.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'Y5tnmQYB2y72J55JSeDc',
        outcome: BinaryNoBetOutcome(probAfter: 0.03380361527670197),
        updatedTime: DateTime.parse('2023-10-25T06:55:44.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'bzNsDcUihEyaCy4BfTK6',
        outcome: BinaryNoBetOutcome(probAfter: 0.03716664062866214),
        updatedTime: DateTime.parse('2023-10-24T11:12:03.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'X3EdZKgVwYKOBglXr0XK',
        outcome: BinaryNoBetOutcome(probAfter: 0.03314241684857503),
        updatedTime: DateTime.parse('2023-10-20T18:08:09.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'x0X8kp3zH2X5PotD5YKI',
        outcome: BinaryNoBetOutcome(probAfter: 0.03482393344787253),
        updatedTime: DateTime.parse('2023-10-19T05:17:09.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'oaGwaTUnjn8K9KpwaKuu',
        outcome: BinaryNoBetOutcome(probAfter: 0.04598930369919011),
        updatedTime: DateTime.parse('2023-10-17T13:46:28.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'XozZ9jNfPm4FTq5lW3XK',
        outcome: BinaryNoBetOutcome(probAfter: 0.040000000000000084),
        updatedTime: DateTime.parse('2023-10-16T12:48:52.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'ZzQlYdrjCstec1m4rNZF',
        outcome: BinaryNoBetOutcome(probAfter: 0.2581117982270765),
        updatedTime: DateTime.parse('2023-10-15T13:55:28.000'),
        market: Market(
            id: 'jfcin8TQ6bVNyodT3ote', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'K34ykFqzWha2fXe3nsyQ',
        outcome: BinaryYesBetOutcome(probAfter: 0.787528840292323),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: '9QqJBfBd2iDe32DmQ80U', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '6bgBhIhOlYSkY0D4yAY3',
        outcome: BinaryYesBetOutcome(probAfter: 0.1563305386960925),
        updatedTime: DateTime.parse('2023-10-14T15:24:04.000'),
        market: Market(id: 'i95HLfK9N6hu5H7orfNj', outcome: null),
      ),
      Bet(
        id: '47pUZDvhPOijFghIffl5',
        outcome: BinaryNoBetOutcome(probAfter: 0.04240445016612039),
        updatedTime: DateTime.parse('2023-10-14T15:22:13.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'xCbTcGD1O0dJ6gCt24IK',
        outcome: BinaryNoBetOutcome(probAfter: 0.039999999999999994),
        updatedTime: DateTime.parse('2023-10-13T12:32:31.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: '3kihhH87ecN9E1kwGLzp',
        outcome: BinaryNoBetOutcome(probAfter: 0.1000000000000001),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'B7fXEYRy8nyG0cVNEthS', outcome: null),
      ),
      Bet(
        id: 'ayZngk3mKs1wgjWv9ssk',
        outcome: BinaryNoBetOutcome(probAfter: 0.2637348031334195),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'wrwB5nnr8dTjxanUZmZo', outcome: null),
      ),
      Bet(
        id: 'bTEdUoujTYZcl0MSog24',
        outcome: BinaryNoBetOutcome(probAfter: 0.05000000000000006),
        updatedTime: DateTime.parse('2023-10-26T20:37:51.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'oXHzQhpGgAeBghim5QG9',
        outcome: BinaryNoBetOutcome(probAfter: 0.05450840955303297),
        updatedTime: DateTime.parse('2023-10-07T15:03:02.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'VjhPMhpbfAr6nWmwyr6s',
        outcome: BinaryNoBetOutcome(probAfter: 0.05460087055732203),
        updatedTime: DateTime.parse('2023-10-07T06:06:52.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'KDy2DaF183pLLC80yjA3',
        outcome: BinaryNoBetOutcome(probAfter: 0.05408986500295827),
        updatedTime: DateTime.parse('2023-10-06T23:34:09.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'L1RYs2cz2qJnNO9GpSLx',
        outcome: BinaryNoBetOutcome(probAfter: 0.055102077543003954),
        updatedTime: DateTime.parse('2023-10-07T15:51:37.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'LFOXUNn5QSTYOinyztna',
        outcome: BinaryNoBetOutcome(probAfter: 0.05000000000000006),
        updatedTime: DateTime.parse('2023-10-05T23:01:45.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'atG4LGCodlonepKPYWDW',
        outcome: BinaryNoBetOutcome(probAfter: 0.060000000000000095),
        updatedTime: DateTime.parse('2023-10-05T07:39:41.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: '1MPfFsj02WpLRaZkHqLR',
        outcome: BinaryNoBetOutcome(probAfter: 0.06000000000000008),
        updatedTime: DateTime.parse('2023-10-04T15:00:46.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'k1lRtnKxM5Npbog3wWRi',
        outcome: BinaryNoBetOutcome(probAfter: 0.06250010866341171),
        updatedTime: DateTime.parse('2023-10-08T17:29:24.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: '3PJSyHaXrbuu5h8vjxiu',
        outcome: BinaryNoBetOutcome(probAfter: 0.06000000000000001),
        updatedTime: DateTime.parse('2023-10-01T13:58:53.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'W2nLpqDleujXc9vVhGmN',
        outcome: BinaryNoBetOutcome(probAfter: 0.06170569888962125),
        updatedTime: DateTime.parse('2023-09-30T09:52:53.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'ZGlsCwTf0OTKVpVZu2u2',
        outcome: BinaryYesBetOutcome(probAfter: 0.9489674432832716),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'cLDcmAfbDFe2WywEz9Ng', outcome: null),
      ),
      Bet(
        id: 'vTPmAUROtLvhvnzAaz88',
        outcome: BinaryYesBetOutcome(probAfter: 0.013174716435037004),
        updatedTime: DateTime.parse('2024-05-16T21:30:09.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'a2ZVOeJvQb6yxARXIDkT',
        outcome: BinaryYesBetOutcome(probAfter: 0.036955454773848574),
        updatedTime: DateTime.parse('2024-05-16T21:30:09.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '950cYmLJ432wjHqJTjmw',
        outcome: BinaryYesBetOutcome(probAfter: 0.0727882408328228),
        updatedTime: DateTime.parse('2024-05-16T21:30:09.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'EfJcyIz4M7QuutdvtuFL',
        outcome: BinaryNoBetOutcome(probAfter: 0.050000000000000065),
        updatedTime: DateTime.parse('2023-09-28T01:06:17.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'hrs4pJ7Y9vDdEj8k73G3',
        outcome: BinaryYesBetOutcome(probAfter: 0.5374778674806745),
        updatedTime: DateTime.parse('2023-10-28T10:22:59.000'),
        market: Market(
            id: '3qRaoYKwpHlEauTxtF1q', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'ssdGfLY1HYpBNFk9AyVI',
        outcome: BinaryYesBetOutcome(probAfter: 0.889723107022871),
        updatedTime: DateTime.parse('2023-09-26T08:40:32.000'),
        market: Market(
            id: '4sUJBULnHY0EcmUKS2Y9', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'bCxkb2iPIbBXG4iQ8ySv',
        outcome: BinaryNoBetOutcome(probAfter: 0.08994218382358819),
        updatedTime: DateTime.parse('2023-09-26T01:47:54.000'),
        market: Market(
            id: 'Jt6W247zs6tnHGXyw8el', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'qu40ZueTHG9zylWUod9n',
        outcome: BinaryYesBetOutcome(probAfter: 0.9260624162179368),
        updatedTime: DateTime.parse('2023-09-26T10:06:20.000'),
        market: Market(
            id: '4sUJBULnHY0EcmUKS2Y9', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: '9oPLwWensG0EttziYa3n',
        outcome: BinaryNoBetOutcome(probAfter: 0.1988317159457734),
        updatedTime: DateTime.parse('2023-09-25T08:00:15.000'),
        market: Market(
            id: 'Jt6W247zs6tnHGXyw8el', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '5RH8v7QFbZLvKzisMx9Y',
        outcome: BinaryNoBetOutcome(probAfter: 0.6200193565848748),
        updatedTime: DateTime.parse('2024-01-16T15:41:48.000'),
        market: Market(id: 'FiH9h6IcEiQmLP4lVKGz', outcome: null),
      ),
      Bet(
        id: 'xBV6E4oLArip8wT6h8ef',
        outcome: BinaryYesBetOutcome(probAfter: 0.6200193565848748),
        updatedTime: DateTime.parse('2024-01-16T16:03:40.000'),
        market: Market(id: 'FiH9h6IcEiQmLP4lVKGz', outcome: null),
      ),
      Bet(
        id: 'XMQdc16kMujH5D3PpGmH',
        outcome: BinaryYesBetOutcome(probAfter: 0.6200193565848748),
        updatedTime: DateTime.parse('2023-09-23T11:49:59.000'),
        market: Market(id: 'FiH9h6IcEiQmLP4lVKGz', outcome: null),
      ),
      Bet(
        id: 'PL5bf5n49ty8OvnD665Y',
        outcome: BinaryNoBetOutcome(probAfter: 0.16172206326870356),
        updatedTime: DateTime.parse('2024-01-08T18:04:55.000'),
        market: Market(
            id: 'Wzni2A6Ggx1TuW12SYyh', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'cGfQCFQx76OP0U9tG76T',
        outcome: BinaryYesBetOutcome(probAfter: 0.03263698809088758),
        updatedTime: DateTime.parse('2023-09-22T13:08:39.000'),
        market: Market(
            id: 'Jt6W247zs6tnHGXyw8el', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'JRuEoKis75LUerDBe6tJ',
        outcome: BinaryNoBetOutcome(probAfter: 0.0029669080862317555),
        updatedTime: DateTime.parse('2023-09-22T13:03:07.000'),
        market: Market(
            id: 'Jt6W247zs6tnHGXyw8el', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '52w1tSu0GE7QKCzlWYr8',
        outcome: BinaryNoBetOutcome(probAfter: 0.25000000000000006),
        updatedTime: DateTime.parse('2023-09-22T17:50:19.000'),
        market: Market(
            id: 'Jt6W247zs6tnHGXyw8el', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'SWRQhp6kCklcpWilC1Gb',
        outcome: BinaryYesBetOutcome(probAfter: 0.3000000000000001),
        updatedTime: DateTime.parse('2023-09-22T13:07:39.000'),
        market: Market(
            id: 'Jt6W247zs6tnHGXyw8el', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'vd0IZzFMNEE0vtW62DPw',
        outcome: BinaryNoBetOutcome(probAfter: 0.06114269900819566),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: '7bKV5hQIVLckkLKFO2iM', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'j9Htkadr2pyPpwhBykV4',
        outcome: BinaryNoBetOutcome(probAfter: 0.15),
        updatedTime: DateTime.parse('2023-09-22T10:57:05.000'),
        market: Market(
            id: 'Jt6W247zs6tnHGXyw8el', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'rEhwHHnXgYDexhFT1nw5',
        outcome: BinaryYesBetOutcome(probAfter: 0.004595274783184392),
        updatedTime: DateTime.parse('2023-09-26T10:06:20.000'),
        market: Market(
            id: 'Jt6W247zs6tnHGXyw8el', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'nz3Hf02gJCy4CT9QHu2w',
        outcome: BinaryNoBetOutcome(probAfter: 0.6681552205989743),
        updatedTime: DateTime.parse('2023-09-23T10:06:31.000'),
        market: Market(id: 'FiH9h6IcEiQmLP4lVKGz', outcome: null),
      ),
      Bet(
        id: '81ayc3gJD9iE1qnFoyZQ',
        outcome: BinaryNoBetOutcome(probAfter: 0.05289542560057639),
        updatedTime: DateTime.parse('2023-09-26T10:06:20.000'),
        market: Market(
            id: 'Jt6W247zs6tnHGXyw8el', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '1hcKnWfnjkUFh12aiFdL',
        outcome: BinaryNoBetOutcome(probAfter: 0.0026011561465680236),
        updatedTime: DateTime.parse('2023-09-26T10:06:20.000'),
        market: Market(
            id: 'Jt6W247zs6tnHGXyw8el', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'HyZlgbmLz4TruN5VkuLx',
        outcome: BinaryYesBetOutcome(probAfter: 0.4928274948018967),
        updatedTime: DateTime.parse('2023-09-26T10:06:20.000'),
        market: Market(
            id: 'Jt6W247zs6tnHGXyw8el', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'goqAEEaAt6ja2X9HRG1n',
        outcome: BinaryNoBetOutcome(probAfter: 0.05000000000000001),
        updatedTime: DateTime.parse('2023-09-22T00:18:22.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: '5Z4bAItK1XzsCPGm1q1z',
        outcome: BinaryNoBetOutcome(probAfter: 0.05000000000000003),
        updatedTime: DateTime.parse('2023-09-22T00:16:49.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: '0R89PTyBEa6gyBDRziul',
        outcome: BinaryYesBetOutcome(probAfter: 0.8589147007369112),
        updatedTime: DateTime.parse('2023-09-24T10:08:37.000'),
        market: Market(
            id: 'hONXZoAYtd10MCzJN1sW', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'n3oVFKsDb4iXAfChCFW0',
        outcome: BinaryYesBetOutcome(probAfter: 0.7991429759756777),
        updatedTime: DateTime.parse('2023-09-20T02:33:21.000'),
        market: Market(
            id: '3zwrdf4vwZJ4SHi6yVQf', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'CrUSwuzZnCcG7ASGJKAC',
        outcome: BinaryYesBetOutcome(probAfter: 0.8064638314737612),
        updatedTime: DateTime.parse('2023-09-20T02:33:13.000'),
        market: Market(
            id: '3zwrdf4vwZJ4SHi6yVQf', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'zHjuc2pUNpvNepYLMyGK',
        outcome: BinaryYesBetOutcome(probAfter: 0.8242940265997466),
        updatedTime: DateTime.parse('2023-09-24T10:08:37.000'),
        market: Market(
            id: '3zwrdf4vwZJ4SHi6yVQf', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'P14Nq1fUjJS2rj8jE6iC',
        outcome: BinaryNoBetOutcome(probAfter: 0.06000000000000007),
        updatedTime: DateTime.parse('2023-09-12T02:14:05.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: '2HPJBKuN6ckhZxhwjaFB',
        outcome: BinaryNoBetOutcome(probAfter: 0.49),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'A319ydGB1B7f4PMOROL3', outcome: null),
      ),
      Bet(
        id: 'PW4K0Elv6e0XBtzDv48V',
        outcome: BinaryYesBetOutcome(probAfter: 0.9527979611625516),
        updatedTime: DateTime.parse('2023-08-28T23:17:36.000'),
        market: Market(
            id: 'HQifVQP0pOLpq3O4xSnx',
            outcome: BinaryMktMarketOutcome(probability: 0.85)),
      ),
      Bet(
        id: 'rwL1Gfw5HYcspIU0zWpy',
        outcome: BinaryYesBetOutcome(probAfter: 0.2100000000000001),
        updatedTime: DateTime.parse('2023-08-23T08:30:56.000'),
        market: Market(id: 'i95HLfK9N6hu5H7orfNj', outcome: null),
      ),
      Bet(
        id: 'IywtfPs8n4t6tDSM9bDP',
        outcome: BinaryYesBetOutcome(probAfter: 0.9507338852404865),
        updatedTime: DateTime.parse('2023-08-22T01:25:28.000'),
        market: Market(
            id: 'HQifVQP0pOLpq3O4xSnx',
            outcome: BinaryMktMarketOutcome(probability: 0.85)),
      ),
      Bet(
        id: 'p8bVzkTsxFeAhFVBZV3Y',
        outcome: BinaryYesBetOutcome(probAfter: 0.9634679694109383),
        updatedTime: DateTime.parse('2023-09-01T10:04:06.000'),
        market: Market(
            id: 'HQifVQP0pOLpq3O4xSnx',
            outcome: BinaryMktMarketOutcome(probability: 0.85)),
      ),
      Bet(
        id: '1kLjy3qvsfcspMM8Py2c',
        outcome: BinaryNoBetOutcome(probAfter: 0.08999999999999996),
        updatedTime: DateTime.parse('2023-08-21T23:43:50.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'etdg8SRlA2YGxGNw6prl',
        outcome: BinaryNoBetOutcome(probAfter: 0.08999999999999996),
        updatedTime: DateTime.parse('2023-08-19T06:08:17.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'LxGVSaSjUMQgLh7419uB',
        outcome: BinaryYesBetOutcome(probAfter: 0.6366295558903365),
        updatedTime: DateTime.parse('2023-08-18T23:02:03.000'),
        market: Market(id: 'zykLH07uEk40QjZ2n3QE', outcome: null),
      ),
      Bet(
        id: 'FV7Zs6ItvB7RcvA5tt6n',
        outcome: BinaryNoBetOutcome(probAfter: 0.59),
        updatedTime: DateTime.parse('2023-08-11T18:29:52.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'b0UjPtCCbqTvZXK8eJd5',
        outcome: BinaryNoBetOutcome(probAfter: 0.5921201926923244),
        updatedTime: DateTime.parse('2023-08-11T15:48:22.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'R6eVr4hMxdqUL5pWq3Dr',
        outcome: BinaryYesBetOutcome(probAfter: 0.34793340158145886),
        updatedTime: DateTime.parse('2023-09-01T10:04:06.000'),
        market: Market(
            id: 'XSGxnh3VW8HHV256w3DS', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'de7CJdhCfnYgR60yV4G5',
        outcome: BinaryYesBetOutcome(probAfter: 0.0019013405457485493),
        updatedTime: DateTime.parse('2023-09-03T10:05:01.000'),
        market: Market(
            id: 'XSGxnh3VW8HHV256w3DS', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'pWhXlBRbLoBS5Kw27tmh',
        outcome: BinaryNoBetOutcome(probAfter: 0.3849726539916849),
        updatedTime: DateTime.parse('2023-08-30T10:10:35.000'),
        market: Market(
            id: 'XSGxnh3VW8HHV256w3DS', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'HNXEFvPhoQdJgnO9QPW8',
        outcome: BinaryYesBetOutcome(probAfter: 0.17817537981860465),
        updatedTime: DateTime.parse('2023-09-04T10:04:25.000'),
        market: Market(
            id: 'XSGxnh3VW8HHV256w3DS', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'AQwcrrSr2AprNtgef7bR',
        outcome: BinaryYesBetOutcome(probAfter: 0.08701722406250324),
        updatedTime: DateTime.parse('2023-09-05T10:04:34.000'),
        market: Market(
            id: 'XSGxnh3VW8HHV256w3DS', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'BCTtt6Yqn1PpzEK9DnbV',
        outcome: BinaryYesBetOutcome(probAfter: 0.08007697969158674),
        updatedTime: DateTime.parse('2023-08-11T04:47:56.000'),
        market: Market(
            id: 'GWPeaRStAN4NqwEuS6Ic', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: '7KVioti0We9JRftUWuWA',
        outcome: BinaryYesBetOutcome(probAfter: 0.15000000000000016),
        updatedTime: DateTime.parse('2023-08-10T03:58:55.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: 'Fz77i0xVIxrPjwbsLQgO',
        outcome: BinaryNoBetOutcome(probAfter: 0.14999999999999994),
        updatedTime: DateTime.parse('2023-08-08T23:23:06.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: '427Im0hxk8twO1bL8mK1',
        outcome: BinaryNoBetOutcome(probAfter: 0.22697716491926356),
        updatedTime: DateTime.parse('2024-01-16T15:40:14.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: 'MEbE7bNmVwhBoTBXSAZB',
        outcome: BinaryYesBetOutcome(probAfter: 0.22697716491926356),
        updatedTime: DateTime.parse('2024-01-16T15:48:38.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: 'eOlEVLKZteY9VY2ql52Q',
        outcome: BinaryNoBetOutcome(probAfter: 0.22697716491926356),
        updatedTime: DateTime.parse('2023-08-08T22:58:47.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: 'n5Lvv8aSYlbOdl27AKuJ',
        outcome: BinaryNoBetOutcome(probAfter: 0.23),
        updatedTime: DateTime.parse('2024-01-16T15:59:54.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: '3BI8WY153MadANiZHVf2',
        outcome: BinaryYesBetOutcome(probAfter: 0.23),
        updatedTime: DateTime.parse('2024-01-16T15:40:07.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: '44Y9wrv5q9zRpmOAzVcp',
        outcome: BinaryNoBetOutcome(probAfter: 0.23),
        updatedTime: DateTime.parse('2023-08-08T22:58:04.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: '1r69BI8vn9aRJyy3CO31',
        outcome: BinaryNoBetOutcome(probAfter: 0.14999999999999986),
        updatedTime: DateTime.parse('2023-08-08T22:56:54.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'W98SpaxmWEmYJrrIfA8Q',
        outcome: BinaryYesBetOutcome(probAfter: 0.25),
        updatedTime: DateTime.parse('2024-01-16T15:52:32.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: 'i2qvSkmpdiLalu5SQsep',
        outcome: BinaryNoBetOutcome(probAfter: 0.25),
        updatedTime: DateTime.parse('2024-01-16T15:59:18.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: 'CLGTsvcAdw5aqkkxawWN',
        outcome: BinaryYesBetOutcome(probAfter: 0.25),
        updatedTime: DateTime.parse('2024-01-16T15:46:42.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: '6lLzZ9wGRpdcpsJAV8s6',
        outcome: BinaryNoBetOutcome(probAfter: 0.25),
        updatedTime: DateTime.parse('2024-01-16T15:41:59.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: '9067WjMk9AgB40hbw864',
        outcome: BinaryNoBetOutcome(probAfter: 0.25),
        updatedTime: DateTime.parse('2024-01-16T15:45:05.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: 'GlLTKiphGQizsh41JNQR',
        outcome: BinaryYesBetOutcome(probAfter: 0.25),
        updatedTime: DateTime.parse('2024-01-16T15:47:15.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: 'j5QPoWntkr2ir3GuUL2x',
        outcome: BinaryNoBetOutcome(probAfter: 0.25),
        updatedTime: DateTime.parse('2023-08-08T22:57:18.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: 'HqhU29qNXuMTpYXXqUKs',
        outcome: BinaryNoBetOutcome(probAfter: 0.33267850051189796),
        updatedTime: DateTime.parse('2023-09-04T10:04:25.000'),
        market: Market(
            id: '25bw7BmeDTEhQRxmHRdr', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'gJ2qeCyw5HFNczj7wEXc',
        outcome: BinaryYesBetOutcome(probAfter: 0.4198899321607017),
        updatedTime: DateTime.parse('2023-08-05T21:41:36.000'),
        market: Market(
            id: 'GWPeaRStAN4NqwEuS6Ic', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'B0nI1OHbB7AyNcU13R6J',
        outcome: BinaryYesBetOutcome(probAfter: 0.35000000000000053),
        updatedTime: DateTime.parse('2024-01-16T15:45:20.000'),
        market: Market(
            id: 'GWPeaRStAN4NqwEuS6Ic', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'SWcZlsHMRA9nhjt3mZ5E',
        outcome: BinaryNoBetOutcome(probAfter: 0.35000000000000053),
        updatedTime: DateTime.parse('2024-01-16T15:52:04.000'),
        market: Market(
            id: 'GWPeaRStAN4NqwEuS6Ic', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: '3GTbtNnWalqBSvqQEw2u',
        outcome: BinaryYesBetOutcome(probAfter: 0.35000000000000053),
        updatedTime: DateTime.parse('2023-08-05T21:42:23.000'),
        market: Market(
            id: 'GWPeaRStAN4NqwEuS6Ic', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: '1BkTr973LPTPTYit0dDu',
        outcome: BinaryNoBetOutcome(probAfter: 0.45000000000000007),
        updatedTime: DateTime.parse('2024-01-16T15:38:57.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: 'YX7wRINSVLQAlRcmtKMX',
        outcome: BinaryYesBetOutcome(probAfter: 0.45000000000000007),
        updatedTime: DateTime.parse('2024-01-16T15:52:49.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: 'LbLHTedE11bXgZ0J1WYd',
        outcome: BinaryYesBetOutcome(probAfter: 0.45000000000000007),
        updatedTime: DateTime.parse('2023-08-08T05:54:14.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: 'Slau0fyyR5sp70sLaMBf',
        outcome: BinaryYesBetOutcome(probAfter: 0.16401758794627772),
        updatedTime: DateTime.parse('2023-09-11T10:05:10.000'),
        market: Market(id: 'Z9WeI1zlUYs5kzDxTptJ', outcome: null),
      ),
      Bet(
        id: 'TfZslPnMRKiSszLq1M1d',
        outcome: BinaryNoBetOutcome(probAfter: 0.25999999999999984),
        updatedTime: DateTime.parse('2023-08-02T21:35:31.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'rRxBSiXQVLGdNljdiGmL',
        outcome: BinaryYesBetOutcome(probAfter: 0.3186474174037339),
        updatedTime: DateTime.parse('2023-08-02T21:34:49.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'b3pl0X8ggf4VevkMgqG7',
        outcome: BinaryNoBetOutcome(probAfter: 0.3899999999999998),
        updatedTime: DateTime.parse('2023-08-08T22:49:38.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'Q2EfRS4C924wtie7QZPf',
        outcome: BinaryNoBetOutcome(probAfter: 0.3599999999999994),
        updatedTime: DateTime.parse('2023-08-02T04:34:28.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'Cxd3CoqN73c5h9lZk9NB',
        outcome: BinaryNoBetOutcome(probAfter: 0.3599999999999994),
        updatedTime: DateTime.parse('2023-08-02T03:44:38.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'VphoWE9xFqMAm3zYYNZV',
        outcome: BinaryYesBetOutcome(probAfter: 0.28029893782241627),
        updatedTime: DateTime.parse('2024-01-01T10:10:43.000'),
        market: Market(
            id: 'xQG825LpD6YITDKRiBfv', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'VLvtwW7LlIFM39CB0n4T',
        outcome: BinaryYesBetOutcome(probAfter: 0.38999999999999996),
        updatedTime: DateTime.parse('2023-08-02T02:30:50.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'BctBwh7ZRBXeFBgRQyg0',
        outcome: BinaryYesBetOutcome(probAfter: 0.3899999999999997),
        updatedTime: DateTime.parse('2023-08-02T02:18:05.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'Y2MzrgYKoeRD7AMjwBrh',
        outcome: BinaryNoBetOutcome(probAfter: 0.35000000000000053),
        updatedTime: DateTime.parse('2023-08-02T02:16:56.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'ZOxT17xoP5Roy0dxFM1i',
        outcome: BinaryNoBetOutcome(probAfter: 0.30000000000000016),
        updatedTime: DateTime.parse('2023-08-01T19:22:56.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: '00pIqJktRAm3wHYx13xF',
        outcome: BinaryYesBetOutcome(probAfter: 0.4099999999999999),
        updatedTime: DateTime.parse('2023-08-01T18:44:57.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'cqks9PFI3c5pS9YQfZmA',
        outcome: BinaryYesBetOutcome(probAfter: 0.48278900386505097),
        updatedTime: DateTime.parse('2023-08-01T12:20:13.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'kwqvZYEwokT1aHtsSUkB',
        outcome: BinaryYesBetOutcome(probAfter: 0.4630015876699405),
        updatedTime: DateTime.parse('2024-01-16T15:59:39.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'AwdvtxXrR3n6HTnXs6jw',
        outcome: BinaryNoBetOutcome(probAfter: 0.4630015876699405),
        updatedTime: DateTime.parse('2024-01-16T15:45:19.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'MaVBtBkj3TuHl0S8pRnf',
        outcome: BinaryYesBetOutcome(probAfter: 0.4630015876699405),
        updatedTime: DateTime.parse('2024-01-16T15:48:40.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'eJ41pYewckeZfxpzONCV',
        outcome: BinaryNoBetOutcome(probAfter: 0.4630015876699405),
        updatedTime: DateTime.parse('2024-01-16T15:58:11.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'iYSDmyWeQIOI1udeBMjT',
        outcome: BinaryNoBetOutcome(probAfter: 0.4630015876699405),
        updatedTime: DateTime.parse('2024-01-16T15:59:22.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'X3XnbIk7RMBAVRoobYe6',
        outcome: BinaryYesBetOutcome(probAfter: 0.4630015876699405),
        updatedTime: DateTime.parse('2024-01-16T15:52:38.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'rDiO6mzywKxILG79RQW8',
        outcome: BinaryYesBetOutcome(probAfter: 0.4630015876699405),
        updatedTime: DateTime.parse('2024-01-16T16:02:03.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'skg8wTvCSWg6QePKPNmx',
        outcome: BinaryNoBetOutcome(probAfter: 0.4630015876699405),
        updatedTime: DateTime.parse('2024-01-16T16:02:13.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'cIpqp7BlqqkoAhsvquw6',
        outcome: BinaryNoBetOutcome(probAfter: 0.4630015876699405),
        updatedTime: DateTime.parse('2023-08-01T12:40:03.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'fwhowKwbRbVeHcc5TxZt',
        outcome: BinaryYesBetOutcome(probAfter: 0.4200000000000001),
        updatedTime: DateTime.parse('2023-08-01T11:30:53.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'SrwAWjyGwuKLT9H9DEBn',
        outcome: BinaryYesBetOutcome(probAfter: 0.5),
        updatedTime: DateTime.parse('2023-08-01T07:52:03.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'mNx9uECFPZa9kwrP9SNd',
        outcome: BinaryYesBetOutcome(probAfter: 0.42999999999999994),
        updatedTime: DateTime.parse('2023-08-01T07:51:34.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'XONPs8Gy9Sqd68tIrjYN',
        outcome: BinaryNoBetOutcome(probAfter: 0.4499999999999994),
        updatedTime: DateTime.parse('2023-08-01T07:48:20.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'M9qbHFOjrAtWvfpBiaKM',
        outcome: BinaryYesBetOutcome(probAfter: 0.4099999999999998),
        updatedTime: DateTime.parse('2024-01-16T15:48:37.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'ZriLCwR1XHXCPDps5RDB',
        outcome: BinaryNoBetOutcome(probAfter: 0.4099999999999998),
        updatedTime: DateTime.parse('2024-01-16T15:52:59.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'o77aN9hrULQN3ZSMf0ZB',
        outcome: BinaryYesBetOutcome(probAfter: 0.4099999999999998),
        updatedTime: DateTime.parse('2023-08-01T07:38:58.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'nCcqZaiLITd6mhx5FBt5',
        outcome: BinaryNoBetOutcome(probAfter: 0.39999999999999986),
        updatedTime: DateTime.parse('2023-08-01T07:38:30.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: '1bLrVNEK267qPUabW66B',
        outcome: BinaryYesBetOutcome(probAfter: 0.8),
        updatedTime: DateTime.parse('2023-09-11T10:05:10.000'),
        market: Market(id: '1kbzaXsfSLjFSe1zt668', outcome: null),
      ),
      Bet(
        id: '0hW5dc67DdnkLVpq1Imt',
        outcome: BinaryNoBetOutcome(probAfter: 0.10344582388283467),
        updatedTime: DateTime.parse('2023-08-28T22:57:06.000'),
        market: Market(
            id: 'zOeYvjJXX42LgySMybg3', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '6VZOwFh4keDnQBEG7ahY',
        outcome: BinaryNoBetOutcome(probAfter: 0.03350018062377443),
        updatedTime: DateTime.parse('2023-09-02T10:03:24.000'),
        market: Market(
            id: 'zOeYvjJXX42LgySMybg3', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'Ag4UMB2gJR0ztnj0InJ2',
        outcome: BinaryNoBetOutcome(probAfter: 0.012598219644788978),
        updatedTime: DateTime.parse('2023-09-01T10:04:06.000'),
        market: Market(
            id: 'zOeYvjJXX42LgySMybg3', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'VQiUHEqh3qF046GUouCt',
        outcome: BinaryNoBetOutcome(probAfter: 0.02002422665506566),
        updatedTime: DateTime.parse('2023-09-04T10:04:25.000'),
        market: Market(
            id: 'zOeYvjJXX42LgySMybg3', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'Y6oYISZIx1Yb4o2N6BeI',
        outcome: BinaryYesBetOutcome(probAfter: 0.35056893261526406),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: 'zOeYvjJXX42LgySMybg3', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'b5UJgAmrUaGph75WFkXC',
        outcome: BinaryNoBetOutcome(probAfter: 0.023183181709488795),
        updatedTime: DateTime.parse('2023-09-03T10:05:01.000'),
        market: Market(
            id: 'zOeYvjJXX42LgySMybg3', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'bxUtrnzHw9uukXlikjDh',
        outcome: BinaryNoBetOutcome(probAfter: 0.016389481116636986),
        updatedTime: DateTime.parse('2023-08-30T10:10:35.000'),
        market: Market(
            id: 'zOeYvjJXX42LgySMybg3', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'hPuH8LkMR3LcKnpUDZ6C',
        outcome: BinaryNoBetOutcome(probAfter: 0.05288101393396174),
        updatedTime: DateTime.parse('2023-09-07T10:05:30.000'),
        market: Market(
            id: 'zOeYvjJXX42LgySMybg3', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'yRxaNGqw2Oxh82AOCtdu',
        outcome: BinaryNoBetOutcome(probAfter: 0.014052064285191667),
        updatedTime: DateTime.parse('2023-09-06T10:06:51.000'),
        market: Market(
            id: 'zOeYvjJXX42LgySMybg3', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'tjzhElLQ8FazyD4OYvbi',
        outcome: BinaryYesBetOutcome(probAfter: 0.15999999999999995),
        updatedTime: DateTime.parse('2023-07-29T20:18:02.000'),
        market: Market(id: 'BKr7KGDSkT6U3dGlqxIk', outcome: null),
      ),
      Bet(
        id: 'K4IvTo70w2In9b39BCSy',
        outcome: BinaryNoBetOutcome(probAfter: 0.5),
        updatedTime: DateTime.parse('2024-01-16T15:48:22.000'),
        market: Market(id: 'IzcdZu8uHQtzqNETcY6j', outcome: null),
      ),
      Bet(
        id: 'IycfpyVy8ZI7deJfxA9l',
        outcome: BinaryYesBetOutcome(probAfter: 0.5),
        updatedTime: DateTime.parse('2024-01-16T15:48:13.000'),
        market: Market(id: 'IzcdZu8uHQtzqNETcY6j', outcome: null),
      ),
      Bet(
        id: 'Sj71ktqeFGd9RsfI6d5L',
        outcome: BinaryYesBetOutcome(probAfter: 0.16000000000000003),
        updatedTime: DateTime.parse('2023-07-29T04:50:48.000'),
        market: Market(id: 'BKr7KGDSkT6U3dGlqxIk', outcome: null),
      ),
      Bet(
        id: 'WmWlImjmgU2827LfDTfA',
        outcome: BinaryYesBetOutcome(probAfter: 0.5),
        updatedTime: DateTime.parse('2024-01-16T15:52:36.000'),
        market: Market(id: 'IzcdZu8uHQtzqNETcY6j', outcome: null),
      ),
      Bet(
        id: 'yKFOVS9LA4yc0GTHkLTs',
        outcome: BinaryNoBetOutcome(probAfter: 0.5),
        updatedTime: DateTime.parse('2024-01-16T16:03:48.000'),
        market: Market(id: 'IzcdZu8uHQtzqNETcY6j', outcome: null),
      ),
      Bet(
        id: 'U4v7CBhxEnBcVDIIJsv5',
        outcome: BinaryNoBetOutcome(probAfter: 0.5),
        updatedTime: DateTime.parse('2023-08-08T22:51:05.000'),
        market: Market(id: 'IzcdZu8uHQtzqNETcY6j', outcome: null),
      ),
      Bet(
        id: 'HeL21kIISkOSql6RxcBe',
        outcome: BinaryYesBetOutcome(probAfter: 0.5),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'IzcdZu8uHQtzqNETcY6j', outcome: null),
      ),
      Bet(
        id: 'DHfSllBb8rr0IxWCHVz1',
        outcome: BinaryNoBetOutcome(probAfter: 0.5),
        updatedTime: DateTime.parse('2023-08-08T22:52:33.000'),
        market: Market(id: 'i95HLfK9N6hu5H7orfNj', outcome: null),
      ),
      Bet(
        id: 'R6l7h9fyyvlCPWLIrDE9',
        outcome: BinaryYesBetOutcome(probAfter: 0.5),
        updatedTime: DateTime.parse('2024-05-09T21:55:53.000'),
        market: Market(id: 'i95HLfK9N6hu5H7orfNj', outcome: null),
      ),
      Bet(
        id: 'cVUyakP4Pi0XPtsFhqZF',
        outcome: BinaryNoBetOutcome(probAfter: 0.10593820649482409),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'cKuMQwDKCH6RybXY2RLk', outcome: null),
      ),
      Bet(
        id: 'hMQiqG0Ipftoshxl0Zlu',
        outcome: BinaryNoBetOutcome(probAfter: 0.20000000000000015),
        updatedTime: DateTime.parse('2023-07-28T03:42:42.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'vuli6E3Zp8sh6aQnFVak',
        outcome: BinaryYesBetOutcome(probAfter: 0.23000000000000007),
        updatedTime: DateTime.parse('2023-07-28T01:31:57.000'),
        market: Market(id: 'BKr7KGDSkT6U3dGlqxIk', outcome: null),
      ),
      Bet(
        id: 'OesSyuWIql9tqnUwSCZh',
        outcome: BinaryNoBetOutcome(probAfter: 0.13838361436580263),
        updatedTime: DateTime.parse('2023-07-28T00:29:51.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: '2ufiY9ERl94FlhBpV5D0',
        outcome: BinaryNoBetOutcome(probAfter: 0.20999999999999974),
        updatedTime: DateTime.parse('2023-07-27T19:12:07.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: '1q7zYTfk9VjPUa7xAtTQ',
        outcome: BinaryYesBetOutcome(probAfter: 0.7499999999999999),
        updatedTime: DateTime.parse('2023-07-27T08:52:05.000'),
        market: Market(id: 'zykLH07uEk40QjZ2n3QE', outcome: null),
      ),
      Bet(
        id: 'GmaaRosz6TpFekmUSYAS',
        outcome: BinaryNoBetOutcome(probAfter: 0.2828126086090041),
        updatedTime: DateTime.parse('2023-07-27T04:00:33.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'EjR2artkaZldxldxqWGJ',
        outcome: BinaryNoBetOutcome(probAfter: 0.1999999999999999),
        updatedTime: DateTime.parse('2023-07-26T22:24:52.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'XXyuC8houW7AcN1z46Um',
        outcome: BinaryNoBetOutcome(probAfter: 0.15908441854075334),
        updatedTime: DateTime.parse('2023-09-11T10:05:10.000'),
        market: Market(id: 'AVVwyo3MoVgo3JSwJLK3', outcome: null),
      ),
      Bet(
        id: 'LCb4MnSTJXDqqmpDR2cp',
        outcome: BinaryNoBetOutcome(probAfter: 0.2179564698351865),
        updatedTime: DateTime.parse('2023-07-26T15:57:13.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'gPdoaqCeHQQsY8tlBCVk',
        outcome: BinaryNoBetOutcome(probAfter: 0.28953141769456714),
        updatedTime: DateTime.parse('2023-07-26T20:29:18.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'MKA04CKUjU9ddMKxoCOo',
        outcome: BinaryNoBetOutcome(probAfter: 0.1850229395473177),
        updatedTime: DateTime.parse('2023-07-26T15:23:45.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'EaT12ooE0XAm91PfQ6fY',
        outcome: BinaryNoBetOutcome(probAfter: 0.7100000000000001),
        updatedTime: DateTime.parse('2023-07-26T03:30:21.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: '9ugyusVJQ75tcVibkJPp',
        outcome: BinaryNoBetOutcome(probAfter: 0.601289658543838),
        updatedTime: DateTime.parse('2024-05-03T16:16:42.000'),
        market: Market(id: 'lm9I9rJ2CHBQsyPo5vcY', outcome: null),
      ),
      Bet(
        id: 'Cjt29loSQXPMhqWdyxU4',
        outcome: BinaryNoBetOutcome(probAfter: 0.18672081768604945),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: '1sfbjcTu6zgqjCVjqWA2', outcome: null),
      ),
      Bet(
        id: 'KF0KoRHPbx7ptbGQ00x6',
        outcome: BinaryNoBetOutcome(probAfter: 0.15000000000000005),
        updatedTime: DateTime.parse('2023-08-10T10:19:22.000'),
        market: Market(
            id: 'GWPeaRStAN4NqwEuS6Ic', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'vq4HH7I8mYaRyN92knPP',
        outcome: BinaryYesBetOutcome(probAfter: 0.9745492839368933),
        updatedTime: DateTime.parse('2024-04-12T15:09:27.000'),
        market: Market(id: 'WCsjjEUk1vxRy1wHNi63', outcome: null),
      ),
      Bet(
        id: 'ZdekaXLblPt3CANVbtvm',
        outcome: BinaryYesBetOutcome(probAfter: 0.23000000000000034),
        updatedTime: DateTime.parse('2023-07-06T23:13:31.000'),
        market: Market(id: 'BKr7KGDSkT6U3dGlqxIk', outcome: null),
      ),
      Bet(
        id: 'ftuhx59aIi9KzKdixRm1',
        outcome: BinaryNoBetOutcome(probAfter: 0.19999999999999982),
        updatedTime: DateTime.parse('2023-08-08T22:50:37.000'),
        market: Market(id: 'BKr7KGDSkT6U3dGlqxIk', outcome: null),
      ),
      Bet(
        id: '4AoqtxwIiSYFsxxUfJLF',
        outcome: BinaryYesBetOutcome(probAfter: 0.19999999999999982),
        updatedTime: DateTime.parse('2023-07-07T17:45:29.000'),
        market: Market(id: 'BKr7KGDSkT6U3dGlqxIk', outcome: null),
      ),
      Bet(
        id: 'zzPnprCXri02KOkGERY1',
        outcome: BinaryYesBetOutcome(probAfter: 0.25000000000000006),
        updatedTime: DateTime.parse('2023-07-29T10:16:36.000'),
        market: Market(id: 'BKr7KGDSkT6U3dGlqxIk', outcome: null),
      ),
      Bet(
        id: 'GzKHojs1JxPseL4uyPLR',
        outcome: BinaryYesBetOutcome(probAfter: 0.936050613051534),
        updatedTime: DateTime.parse('2023-06-30T10:14:53.000'),
        market: Market(
            id: 'r57AB2RZxzhGFtAQoSvR', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: '0vsQ1VJv5qKYntfyrw8x',
        outcome: BinaryNoBetOutcome(probAfter: 0.7500000000000002),
        updatedTime: DateTime.parse('2023-08-08T22:26:49.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'ahF7KRIQ88pZTNvlHdzY',
        outcome: BinaryNoBetOutcome(probAfter: 0.5),
        updatedTime: DateTime.parse('2023-06-17T01:57:02.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'spNOQuU4HfLNSiKlRqvB',
        outcome: BinaryNoBetOutcome(probAfter: 0.1945406702398792),
        updatedTime: DateTime.parse('2024-01-07T19:13:19.000'),
        market: Market(
            id: 'xaXbR3Vc0a5pdL13OBCO', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: '3K2upESGGPAnGLigRzK1',
        outcome: BinaryYesBetOutcome(probAfter: 0.7740807497522191),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: '0aoeJgwTsdA3ub166M1j', outcome: null),
      ),
      Bet(
        id: 'zgabyE3EjTShufUNHHVM',
        outcome: BinaryNoBetOutcome(probAfter: 0.348840597817672),
        updatedTime: DateTime.parse('2023-05-17T01:02:41.000'),
        market: Market(
            id: 'CtIkjtoAUf2DKUB3J6D7', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'rYfO68fy11K9WJbWKDGe',
        outcome: BinaryNoBetOutcome(probAfter: 0.07812516530050642),
        updatedTime: DateTime.parse('2024-03-01T08:51:08.000'),
        market: Market(id: 'WBZkCTDaRbK73ctwskNx', outcome: null),
      ),
      Bet(
        id: 'SBAf1Iv5DK1CDTWV1wID',
        outcome: BinaryYesBetOutcome(probAfter: 0.3799999999999999),
        updatedTime: DateTime.parse('2023-05-06T05:46:55.000'),
        market: Market(id: 'mZoOercJWPMFPM6XxKfI', outcome: null),
      ),
      Bet(
        id: 'OXl5DB0VphmpzaoaVJWK',
        outcome: BinaryYesBetOutcome(probAfter: 0.3900000000000003),
        updatedTime: DateTime.parse('2023-05-06T05:45:46.000'),
        market: Market(id: 'CImI7JWS3X6xQjJZPKKo', outcome: null),
      ),
      Bet(
        id: 'LxE4fpvQ4PVhqS2Sdjei',
        outcome: BinaryNoBetOutcome(probAfter: 0.3197029270387794),
        updatedTime: DateTime.parse('2024-01-01T10:10:43.000'),
        market: Market(
            id: 'CtIkjtoAUf2DKUB3J6D7', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'hm7KM4UmIxtpiwMsMkYL',
        outcome: BinaryYesBetOutcome(probAfter: 0.40417051410611576),
        updatedTime: DateTime.parse('2023-09-11T10:05:10.000'),
        market: Market(id: 'CImI7JWS3X6xQjJZPKKo', outcome: null),
      ),
      Bet(
        id: 'bRcxrXIMLpYPrrQ73THM',
        outcome: BinaryNoBetOutcome(probAfter: 0.15270766893322132),
        updatedTime: DateTime.parse('2023-04-22T04:32:56.000'),
        market: Market(id: 'wvqnH8ivlqY2CysEd2Sr', outcome: null),
      ),
      Bet(
        id: '4aNUpFCZMLv1uR0qfQMn',
        outcome: BinaryYesBetOutcome(probAfter: 0.28000000000000025),
        updatedTime: DateTime.parse('2023-04-22T04:30:36.000'),
        market: Market(id: 'mZoOercJWPMFPM6XxKfI', outcome: null),
      ),
      Bet(
        id: 'RierweqtA9sNwchUQqI1',
        outcome: BinaryYesBetOutcome(probAfter: 0.941986013487187),
        updatedTime: DateTime.parse('2023-04-14T21:29:26.000'),
        market: Market(
            id: 'XZbfnEkUcWT8vfMLG02L', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'FlUASyIlZuNiPjwbLbp7',
        outcome: BinaryYesBetOutcome(probAfter: 0.02886133703630232),
        updatedTime: DateTime.parse('2024-05-16T21:30:04.000'),
        market: Market(
            id: 'LUfHod2UsrGClj9T3ziA', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'say2zecUpviZ4WVsiEgp',
        outcome: BinaryYesBetOutcome(probAfter: 0.6486582164600492),
        updatedTime: DateTime.parse('2024-05-16T21:31:19.000'),
        market: Market(
            id: 'qouftB4g9baXuxrSMamg', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'p5PZTeaRF5aoCKe0eKba',
        outcome: BinaryNoBetOutcome(probAfter: 0.23973427948136702),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'zbekTRSiEbNzFWAtsNYe', outcome: null),
      ),
      Bet(
        id: 'rqDu3DgDcTdEnTGeOsso',
        outcome: BinaryYesBetOutcome(probAfter: 0.3569725959934152),
        updatedTime: DateTime.parse('2023-09-11T10:05:10.000'),
        market: Market(
            id: 'VN1RfimX7PJUnHhYNDiF', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'hDW6uuIGHhcFJVwgNtJu',
        outcome: BinaryYesBetOutcome(probAfter: 0.05041818110632325),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'Qw4KAjWb6YQAantzK3ue',
        outcome: BinaryYesBetOutcome(probAfter: 0.06626275962445984),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'IWmbTnclKbKQl6GiBw9p',
        outcome: BinaryYesBetOutcome(probAfter: 0.0836181097288387),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'bpTfveaPYfEI5Cm850XX',
        outcome: BinaryYesBetOutcome(probAfter: 0.06145414828998435),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'teAeawIbp3Six89z5fD2',
        outcome: BinaryYesBetOutcome(probAfter: 0.0560178550922468),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'MJAhviByGQh66XFLQT6w',
        outcome: BinaryYesBetOutcome(probAfter: 0.05727542577835379),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'Z6dpQEpVRUERf76Vo8bd',
        outcome: BinaryYesBetOutcome(probAfter: 0.07591095529827792),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'ARPCZkhtn4nuamec88L0',
        outcome: BinaryYesBetOutcome(probAfter: 0.01765559264488716),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'vhZzpyuCPN0VBXsZlz5q',
        outcome: BinaryYesBetOutcome(probAfter: 0.03239850254082514),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'vlMC3XHUF26yobhPRyPm',
        outcome: BinaryYesBetOutcome(probAfter: 0.041476742180232645),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'nFj4SHRX0uPx8ZqsyEOn',
        outcome: BinaryYesBetOutcome(probAfter: 0.10981202367082148),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '7vNJdRhwLIK2vgmk1XNS',
        outcome: BinaryYesBetOutcome(probAfter: 0.08260932576901112),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'cLvxuXRx3FShUIyXWVMl',
        outcome: BinaryYesBetOutcome(probAfter: 0.07962127641908154),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'hdQoC4BXkjZMQc8GYvHr',
        outcome: BinaryYesBetOutcome(probAfter: 0.09048322975939081),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'S2GiBli7Hxf30egKX79j',
        outcome: BinaryYesBetOutcome(probAfter: 0.09873555572683543),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '5kW8ptmJlI0IRxBEhkox',
        outcome: BinaryYesBetOutcome(probAfter: 1),
        updatedTime: DateTime.parse('2024-05-16T21:30:04.000'),
        market: Market(
            id: 'LUfHod2UsrGClj9T3ziA', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '18LtC3phGxCZYQCWBaIo',
        outcome: BinaryYesBetOutcome(probAfter: 0.05054039922764153),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'QgVOKfEdbIRIHBZ7RYhc',
        outcome: BinaryYesBetOutcome(probAfter: 0.046196234331600645),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'iiA4LleG27nyquqZyo9t',
        outcome: BinaryYesBetOutcome(probAfter: 0.12086666454526061),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'XdMzZVuIhnjezx5cb0C5',
        outcome: BinaryYesBetOutcome(probAfter: 0.14363596416329977),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '6ZCePnm2iPGAR4KSuJwj',
        outcome: BinaryYesBetOutcome(probAfter: 0.2118882365592569),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'sjbkgwec0dNmmIBDSt8c',
        outcome: BinaryYesBetOutcome(probAfter: 0.24966283527999594),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'cAkeKncvZd3qYHbrqr0y',
        outcome: BinaryYesBetOutcome(probAfter: 0.027397466511661996),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'NFAV2szL7cxVLPri6CXp',
        outcome: BinaryYesBetOutcome(probAfter: 0.145340784161423),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'oeBkWWyQLh3XcTQqbTpC',
        outcome: BinaryYesBetOutcome(probAfter: 0.060307739979124086),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'siHuVu8LpM9ykL4nyiS9',
        outcome: BinaryYesBetOutcome(probAfter: 0.16893947187928662),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '846UIYIhnOERpIwgf8BQ',
        outcome: BinaryYesBetOutcome(probAfter: 0.9311577205561232),
        updatedTime: DateTime.parse('2023-04-14T13:10:34.000'),
        market: Market(
            id: 'Q6DLW8JovFCmTeLgHzij', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'fF1jhJr59cS08uTSjoca',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '55WFulCDBy8lk6sB4i2X',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'S5DhJNpd4f6PZ5DTopYl',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'T5MMZZr0X04xmrrlhqqk',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'M8vihjcYvSWiEGw7CqQk',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'Pkk2Z7RiQPpjcSBA6t9i',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '2QE0ha3Q0sEVrPjMxDVc',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '7hQrdMvWSGWv3qiu6PiW',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '228dRYNdJhDPRtnq1ZG4',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'vNj5QNkNpwn4T2sxsTNM',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '0dTfiJmYCMWq4K7Hgjg5',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'eXSJc8s9Hrk1rP4VVUWZ',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '3kDRqXJsy6BL28cc3iK3',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'JuW2lz9fFi3dGOyZQLmQ',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'MZJ87BNmCZq3B09vDbb9',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'Vyk49qYD9R9VESc9entE',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'Xris9l3ANm0jEzu9FLxw',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'Zi8f6pG5bg5f8q5TEBpG',
        outcome: BinaryYesBetOutcome(probAfter: 0.05555555555555555),
        updatedTime: DateTime.parse('2024-05-16T21:30:06.000'),
        market: Market(
            id: '0GswU1qy80Sk1UogWuKR', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'SyQgt0AQLqwMYZln3bdt',
        outcome: BinaryYesBetOutcome(probAfter: 0.4348193402560626),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '3x29Xr4f2QGzQ7Gpjhq5',
        outcome: BinaryYesBetOutcome(probAfter: 0.05878266252796621),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'YjpfR1kENL553brwHuFC',
        outcome: BinaryYesBetOutcome(probAfter: 0.061919750716991115),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'hjmaq59ONAcPVrLeEW08',
        outcome: BinaryYesBetOutcome(probAfter: 0.09124844673990198),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'iZnEhtrnj9iAbMCJ6KSJ',
        outcome: BinaryYesBetOutcome(probAfter: 0.12260551537281958),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'pcQTLLeBvSZ2jYAiRiVf',
        outcome: BinaryYesBetOutcome(probAfter: 0.15530119689356073),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'AYKDlG4SY7c9kI1nJspN',
        outcome: BinaryYesBetOutcome(probAfter: 0.22785352990344865),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'QVgxZZDLSTh4TPkQPIbM',
        outcome: BinaryYesBetOutcome(probAfter: 0.22666217438198014),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'cf9z7bacJgh6JQwztZF1',
        outcome: BinaryYesBetOutcome(probAfter: 0.283191487264298),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'Q06t9eq1fAk7zJMxRW7T',
        outcome: BinaryYesBetOutcome(probAfter: 0.28145507913373846),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'ibojb5YeeBJ4DZrS3cup',
        outcome: BinaryYesBetOutcome(probAfter: 0.3344857723531165),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '7EKlyd2DDdoYrxAbJDrM',
        outcome: BinaryYesBetOutcome(probAfter: 0.2955894966001928),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'VvpD5Z76iMc7Cc0LOHkv',
        outcome: BinaryYesBetOutcome(probAfter: 0.353741366582892),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'poBNbfW5qntYA3f5J0Os',
        outcome: BinaryYesBetOutcome(probAfter: 0.2819021539959854),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'uP9Nkq18m6xHXm0eJ2t2',
        outcome: BinaryYesBetOutcome(probAfter: 0.26434411041071765),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'u7fdNyHpjx65y22XDZBA',
        outcome: BinaryYesBetOutcome(probAfter: 0.3478359186320487),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'pPQm53YnwwJBJhtAv5lp',
        outcome: BinaryYesBetOutcome(probAfter: 0.2990552729291547),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'iulZ3GPhRR39d9hEcgCt',
        outcome: BinaryYesBetOutcome(probAfter: 0.2534804844925619),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'rZDT2wRHHyhBevilgLzW',
        outcome: BinaryYesBetOutcome(probAfter: 0.17052451464431695),
        updatedTime: DateTime.parse('2024-05-16T21:30:00.000'),
        market: Market(
            id: 'd7TRl5aRU5jumgSc2g2L', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: 'joFf8H5ENxNPJE6lmte7',
        outcome: BinaryYesBetOutcome(probAfter: 0.6269101345456366),
        updatedTime: DateTime.parse('2023-04-14T13:11:23.000'),
        market: Market(
            id: 'Q6DLW8JovFCmTeLgHzij', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: '72UGUrvErfTtNhaxDCyP',
        outcome: BinaryYesBetOutcome(probAfter: 0.6101766056330534),
        updatedTime: DateTime.parse('2023-04-14T13:10:32.000'),
        market: Market(
            id: 'Q6DLW8JovFCmTeLgHzij', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: '4o9jY2rKqvajMmQtZ20v',
        outcome: BinaryYesBetOutcome(probAfter: 0.8350515463917526),
        updatedTime: DateTime.parse('2023-04-14T04:56:12.000'),
        market: Market(
            id: 'I21LyMwBX3ndBr7y6N7E', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'dOQKxN4qUbyJE0HEidA5',
        outcome: BinaryYesBetOutcome(probAfter: 0.19999999999999993),
        updatedTime: DateTime.parse('2023-04-14T04:56:17.000'),
        market: Market(
            id: 'I21LyMwBX3ndBr7y6N7E', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: '20VJ9wjiVuFwh64s2MCz',
        outcome: BinaryYesBetOutcome(probAfter: 0.9969809728384359),
        updatedTime: DateTime.parse('2023-04-14T06:03:51.000'),
        market: Market(
            id: 'JDfGjIs9lvr34GktKsHz', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'VWyTLpkVoJCe5p9jcKP0',
        outcome: BinaryYesBetOutcome(probAfter: 0.5596568779381278),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'YREnvVjBXi5qQFCQhzSv', outcome: null),
      ),
      Bet(
        id: 'wIOpN02rbnYrHW1Iep59',
        outcome: BinaryNoBetOutcome(probAfter: 0.7246749079008585),
        updatedTime: DateTime.parse('2023-09-11T10:05:10.000'),
        market: Market(
            id: 'iHlUrH04wMnAC02aQXXc', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'iuF6GwnDDy2jw4taXFii',
        outcome: BinaryNoBetOutcome(probAfter: 0.1834672596433977),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(
            id: 'gArLtRBFWyNxIoPvrI1i', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: '3tTcdtOclFEMPFaU58uj',
        outcome: BinaryNoBetOutcome(probAfter: 0.16100104324892048),
        updatedTime: DateTime.parse('2023-08-03T10:13:57.000'),
        market: Market(
            id: 'ScCXu88f2NtXQkGY3oUC', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'O1hJIAWYzaxYktv15eve',
        outcome: BinaryNoBetOutcome(probAfter: 0.2480874811618384),
        updatedTime: DateTime.parse('2024-04-21T21:35:26.000'),
        market: Market(id: 'zg7xJ5ZkJJ4wJPJDPjWO', outcome: null),
      ),
      Bet(
        id: '2YWiqG027eTzsbjbcPyB',
        outcome: BinaryNoBetOutcome(probAfter: 0.29377579542319915),
        updatedTime: DateTime.parse('2024-01-01T10:10:43.000'),
        market: Market(
            id: 'ayFOpfyFEGNGnnHN516b', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'RAfP9IZmx86TnvxmIZFc',
        outcome: BinaryNoBetOutcome(probAfter: 0.09805629886807858),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'f76RFW7kbrWTjmWtJJGm', outcome: null),
      ),
      Bet(
        id: 'wJYz1GTUa0Sd8SmV1HrD',
        outcome: BinaryYesBetOutcome(probAfter: 0.22999999999999984),
        updatedTime: DateTime.parse('2023-04-15T14:25:12.000'),
        market: Market(id: 'mZoOercJWPMFPM6XxKfI', outcome: null),
      ),
      Bet(
        id: 'ZmimMk1mTOantTDIinT1',
        outcome: BinaryNoBetOutcome(probAfter: 0.6150408546238905),
        updatedTime: DateTime.parse('2024-01-01T10:10:43.000'),
        market: Market(id: 'YwDaKnx2QUU1P1ogMx7l', outcome: null),
      ),
      Bet(
        id: 'x7DNiuTvz4tPihSWNS5V',
        outcome: BinaryYesBetOutcome(probAfter: 0.28),
        updatedTime: DateTime.parse('2023-04-15T14:25:17.000'),
        market: Market(id: 'mZoOercJWPMFPM6XxKfI', outcome: null),
      ),
      Bet(
        id: 'eWy53naNu6XMnP8NhhbD',
        outcome: BinaryYesBetOutcome(probAfter: 0.2999999999999999),
        updatedTime: DateTime.parse('2023-04-15T14:23:45.000'),
        market: Market(id: 'mZoOercJWPMFPM6XxKfI', outcome: null),
      ),
      Bet(
        id: 'K7UQ476DmUBMzVmkHMzE',
        outcome: BinaryYesBetOutcome(probAfter: 0.29000000000000004),
        updatedTime: DateTime.parse('2023-04-15T14:22:02.000'),
        market: Market(id: 'mZoOercJWPMFPM6XxKfI', outcome: null),
      ),
      Bet(
        id: 'quba1nAU72L9jnG8wHQS',
        outcome: BinaryYesBetOutcome(probAfter: 0.6014549432079975),
        updatedTime: DateTime.parse('2023-05-21T04:55:11.000'),
        market: Market(
            id: '437s2V6XzgWANVdaAT6k', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'PSVCc1F49oGbU8Bnh9Ye',
        outcome: BinaryYesBetOutcome(probAfter: 0.8364373487835515),
        updatedTime: DateTime.parse('2023-04-15T10:34:09.000'),
        market: Market(
            id: 'irkFRPe43yefZqy49pBG', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'OJ6S9mmnrDNwBjBI99MF',
        outcome: BinaryNoBetOutcome(probAfter: 0.39343488473069793),
        updatedTime: DateTime.parse('2024-04-21T21:35:26.000'),
        market: Market(id: 'WDTbFd6CPJezD1j41U5s', outcome: null),
      ),
      Bet(
        id: 'YGLr6uaIUNN98i11FD0r',
        outcome: BinaryNoBetOutcome(probAfter: 0.3229481897469091),
        updatedTime: DateTime.parse('2023-04-14T10:16:33.000'),
        market: Market(id: 'NPkvmjiyXxrRGx6rmvQE', outcome: null),
      ),
      Bet(
        id: 'ajkFHRmQFBSToIfGSGrl',
        outcome: BinaryNoBetOutcome(probAfter: 0.3273917788286651),
        updatedTime: DateTime.parse('2023-04-14T10:16:33.000'),
        market: Market(id: 'NPkvmjiyXxrRGx6rmvQE', outcome: null),
      ),
      Bet(
        id: 'iSSr0aGI4F9Ey6QD4FEo',
        outcome: BinaryNoBetOutcome(probAfter: 0.4999999999999997),
        updatedTime: DateTime.parse('2023-04-16T00:42:50.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: 'sKZEUpWFVqbdkmUntI5M',
        outcome: BinaryNoBetOutcome(probAfter: 0.24276699475103877),
        updatedTime: DateTime.parse('2023-04-14T18:08:33.000'),
        market: Market(
            id: 'UZXomv3feuQaLwpF2yAw', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'ljlM5oX16A19oYCiNZpe',
        outcome: BinaryNoBetOutcome(probAfter: 0.25736918758744803),
        updatedTime: DateTime.parse('2023-04-16T00:54:43.000'),
        market: Market(
            id: 'xTMnUHNSZF0pxDIsE5Se', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'LUvHLIzl5ZUMrUIU4EyQ',
        outcome: BinaryYesBetOutcome(probAfter: 0.1536),
        updatedTime: DateTime.parse('2024-05-16T03:00:28.000'),
        market: Market(
            id: 'xl270rYFJdjUmmcK8mKq', outcome: UnimplementedMarketOutcome()),
      ),
      Bet(
        id: '1MFRexYO2JMvRqzJQMXv',
        outcome: BinaryNoBetOutcome(probAfter: 0.2764304862954628),
        updatedTime: DateTime.parse('2023-05-21T04:55:11.000'),
        market: Market(
            id: '3pnNgkp2iki7P1QudunV', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'qETrZLLdMlY1k7a5sjvy',
        outcome: BinaryNoBetOutcome(probAfter: 0.15275761347068972),
        updatedTime: DateTime.parse('2023-10-13T10:08:12.000'),
        market: Market(id: 'wvqnH8ivlqY2CysEd2Sr', outcome: null),
      ),
      Bet(
        id: 'EIk9dJuNjvfzRKbzQX3F',
        outcome: BinaryNoBetOutcome(probAfter: 0.1292758262669885),
        updatedTime: DateTime.parse('2023-09-11T10:05:10.000'),
        market: Market(id: 'SlJATHYKS01uxYVye81t', outcome: null),
      ),
      Bet(
        id: 'WmnVn1P2h01uxeMTJAvt',
        outcome: BinaryNoBetOutcome(probAfter: 0.34000000000000014),
        updatedTime: DateTime.parse('2023-04-16T00:53:37.000'),
        market: Market(
            id: 'xTMnUHNSZF0pxDIsE5Se', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'QLeA3tABOHPyDUhhIuRB',
        outcome: BinaryNoBetOutcome(probAfter: 0.16713412085371812),
        updatedTime: DateTime.parse('2023-09-11T10:05:09.000'),
        market: Market(id: 'LCqGYaBLA03Bqf19i2Wo', outcome: null),
      ),
      Bet(
        id: 'Anw35xlFIfNvK6gOLIrd',
        outcome: BinaryYesBetOutcome(probAfter: 0.5402627611798525),
        updatedTime: DateTime.parse('2023-04-15T10:34:02.000'),
        market: Market(
            id: 'irkFRPe43yefZqy49pBG', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'd556XQjZFBVOrd0NvSh2',
        outcome: BinaryYesBetOutcome(probAfter: 0.48948556055862136),
        updatedTime: DateTime.parse('2023-04-15T10:34:16.000'),
        market: Market(
            id: 'irkFRPe43yefZqy49pBG', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'NRNcYSUwPDu9IaQjK3QK',
        outcome: BinaryNoBetOutcome(probAfter: 0.22062090817684593),
        updatedTime: DateTime.parse('2023-04-15T14:01:28.000'),
        market: Market(id: 'm7OILDcraebaYaieTcx7', outcome: null),
      ),
      Bet(
        id: 'kPDgGXafkkSeDwZpzFDT',
        outcome: BinaryYesBetOutcome(probAfter: 0.15),
        updatedTime: DateTime.parse('2023-08-08T22:51:43.000'),
        market: Market(id: 'm7OILDcraebaYaieTcx7', outcome: null),
      ),
      Bet(
        id: 'W0SYaNarnpJImkyOYLxh',
        outcome: BinaryNoBetOutcome(probAfter: 0.1620587141827185),
        updatedTime: DateTime.parse('2023-04-15T14:01:29.000'),
        market: Market(id: 'm7OILDcraebaYaieTcx7', outcome: null),
      ),
      Bet(
        id: 'E950uNI1YTU4aWHFhS2z',
        outcome: BinaryNoBetOutcome(probAfter: 0.28089887640449446),
        updatedTime: DateTime.parse('2023-08-23T10:19:12.000'),
        market: Market(id: 'm7OILDcraebaYaieTcx7', outcome: null),
      ),
      Bet(
        id: 'JnUyPuLgbWI6C8Q3uJki',
        outcome: BinaryYesBetOutcome(probAfter: 0.6389271664594383),
        updatedTime: DateTime.parse('2023-11-04T09:15:35.000'),
        market: Market(id: 'zykLH07uEk40QjZ2n3QE', outcome: null),
      ),
      Bet(
        id: 'uhQbAbi0jJxE3ZkEWkS9',
        outcome: BinaryNoBetOutcome(probAfter: 0.12933283336989368),
        updatedTime: DateTime.parse('2024-01-01T10:10:43.000'),
        market: Market(
            id: 'I1sZ9gWCqN3q1YQeGm1t', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'ipmQOwOKDtgF4N9vuFKF',
        outcome: BinaryNoBetOutcome(probAfter: 0.05207694987025743),
        updatedTime: DateTime.parse('2023-08-08T22:52:08.000'),
        market: Market(id: 'tOyhRQOXbx6FanI5FFHj', outcome: null),
      ),
      Bet(
        id: 'VsWSS6Ad9fLXhxk69fdy',
        outcome: BinaryNoBetOutcome(probAfter: 0.05207694987025743),
        updatedTime: DateTime.parse('2023-08-08T22:52:08.000'),
        market: Market(id: 'tOyhRQOXbx6FanI5FFHj', outcome: null),
      ),
      Bet(
        id: 'hnPn4ZipHsJiqScxL0NA',
        outcome: BinaryYesBetOutcome(probAfter: 0.65),
        updatedTime: DateTime.parse('2023-09-11T10:05:09.000'),
        market: Market(id: 'mZoOercJWPMFPM6XxKfI', outcome: null),
      ),
      Bet(
        id: 'jGpCNaN2qowF7DmWOe2U',
        outcome: BinaryNoBetOutcome(probAfter: 0.5000000000000001),
        updatedTime: DateTime.parse('2023-04-15T03:00:11.000'),
        market: Market(
            id: 'cFty7whEQlKdWxFMTXRA', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'U9cOdoKNGw47ODd9mR9K',
        outcome: BinaryNoBetOutcome(probAfter: 0.48357586504593286),
        updatedTime: DateTime.parse('2023-04-15T03:00:10.000'),
        market: Market(
            id: 'cFty7whEQlKdWxFMTXRA', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'WzHs6qY1CFjaLgcZKiNw',
        outcome: BinaryNoBetOutcome(probAfter: 0.11637176545380432),
        updatedTime: DateTime.parse('2024-01-01T10:10:43.000'),
        market: Market(
            id: 'bqQHHI4BwGspgqvLMqHp', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'cuehLmVVmZBGQAelPxog',
        outcome: BinaryNoBetOutcome(probAfter: 0.4174502822037105),
        updatedTime: DateTime.parse('2024-01-01T10:10:43.000'),
        market: Market(
            id: '6dXuwlg3D1cZzgjrx3R7', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'ofasniTYA7VWaM5OuXgQ',
        outcome: BinaryNoBetOutcome(probAfter: 0.03511509158056989),
        updatedTime: DateTime.parse('2023-04-14T15:09:45.000'),
        market: Market(
            id: 'S4vX0HkG12LH8zCm4S9c', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'n8vdA53YdXPowRENGE7N',
        outcome: BinaryNoBetOutcome(probAfter: 0.32249893053314954),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(
            id: 'xTMnUHNSZF0pxDIsE5Se', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'OqLpdyAQIXbEKdPpZHTj',
        outcome: BinaryNoBetOutcome(probAfter: 0.04753609001588101),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'yGflJpHakYNkxGhSB5Zi', outcome: null),
      ),
      Bet(
        id: 'BgKKcOOC81T1rBllHSC0',
        outcome: BinaryNoBetOutcome(probAfter: 0.058147729705001615),
        updatedTime: DateTime.parse('2023-04-15T21:01:21.000'),
        market: Market(id: 'tOyhRQOXbx6FanI5FFHj', outcome: null),
      ),
      Bet(
        id: 'syZZZ2947t3ZvMWvk7Wz',
        outcome: BinaryNoBetOutcome(probAfter: 0.058889225449048704),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'tOyhRQOXbx6FanI5FFHj', outcome: null),
      ),
      Bet(
        id: 'whVWv6xRXSsutWwQqGg9',
        outcome: BinaryNoBetOutcome(probAfter: 0.15176993609916392),
        updatedTime: DateTime.parse('2023-04-15T22:13:35.000'),
        market: Market(id: 'ubwd4HRwIKt7ms34BhtW', outcome: null),
      ),
      Bet(
        id: 'TZPMZDyAfOAb35mHHSA4',
        outcome: BinaryNoBetOutcome(probAfter: 0.1446289117315155),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: '8bI2j2k6gEOcBmjQzJX9', outcome: null),
      ),
      Bet(
        id: 'v38MqopZDh1VjAcR5vJp',
        outcome: BinaryNoBetOutcome(probAfter: 0.22889865266106688),
        updatedTime: DateTime.parse('2023-04-15T22:13:35.000'),
        market: Market(id: 'ubwd4HRwIKt7ms34BhtW', outcome: null),
      ),
      Bet(
        id: 'ploASBRSSQWKUmzeh2Fh',
        outcome: BinaryYesBetOutcome(probAfter: 0.6574833476946466),
        updatedTime: DateTime.parse('2024-05-12T15:52:45.000'),
        market: Market(id: 'kKQRbp0oXzVnVfN8yntc', outcome: null),
      ),
      Bet(
        id: 'weMOm6qSCnIPR9eOc6KG',
        outcome: BinaryNoBetOutcome(probAfter: 0.3404724727622842),
        updatedTime: DateTime.parse('2023-09-11T10:05:09.000'),
        market: Market(id: 'irJsLpSIZzuiBtZy0YFb', outcome: null),
      ),
      Bet(
        id: 'aC2aRLcC7Kyij6ppPS3l',
        outcome: BinaryNoBetOutcome(probAfter: 0.1000000000000001),
        updatedTime: DateTime.parse('2024-01-22T16:31:05.000'),
        market: Market(id: 'ubwd4HRwIKt7ms34BhtW', outcome: null),
      ),
      Bet(
        id: 'Ji0NwmhpGdBkhjG6jIqV',
        outcome: BinaryYesBetOutcome(probAfter: 0.9340650622909962),
        updatedTime: DateTime.parse('2023-04-14T11:19:30.000'),
        market: Market(
            id: 'O6QQn45TRM7jzGw0pS8K', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'PqmLgQaaNrqs4Cl6W1yW',
        outcome: BinaryNoBetOutcome(probAfter: 0.04895258058400249),
        updatedTime: DateTime.parse('2023-04-14T15:09:23.000'),
        market: Market(
            id: 'S4vX0HkG12LH8zCm4S9c', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'DdxNgbLHGYAIqh5CO7Ts',
        outcome: BinaryNoBetOutcome(probAfter: 0.7),
        updatedTime: DateTime.parse('2023-11-18T10:08:59.000'),
        market: Market(id: 'xJMhW9EEyhHShyRXTp3G', outcome: null),
      ),
      Bet(
        id: '4P4Wvu0n1JrWIhNHcCqw',
        outcome: BinaryYesBetOutcome(probAfter: 0.8274593935167115),
        updatedTime: DateTime.parse('2023-04-14T11:19:30.000'),
        market: Market(
            id: 'O6QQn45TRM7jzGw0pS8K', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'lDNndcIK9AQmjEfGciR0',
        outcome: BinaryNoBetOutcome(probAfter: 0.04415501568811763),
        updatedTime: DateTime.parse('2023-04-15T15:33:13.000'),
        market: Market(id: 'nWRKbjalLDbiTqzmvQvv', outcome: null),
      ),
      Bet(
        id: 'c0UjUEYCAkKhISUeGfh0',
        outcome: BinaryNoBetOutcome(probAfter: 0.04933537297315848),
        updatedTime: DateTime.parse('2023-04-14T15:09:34.000'),
        market: Market(
            id: 'S4vX0HkG12LH8zCm4S9c', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'pfzFWdn3zyDirXSHjjHO',
        outcome: BinaryNoBetOutcome(probAfter: 0.05012002918442192),
        updatedTime: DateTime.parse('2023-04-14T15:09:45.000'),
        market: Market(
            id: 'S4vX0HkG12LH8zCm4S9c', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: '7VnXp0Oha3b52rsAFtX6',
        outcome: BinaryNoBetOutcome(probAfter: 0.110463487976325),
        updatedTime: DateTime.parse('2023-04-14T15:09:07.000'),
        market: Market(
            id: 'S4vX0HkG12LH8zCm4S9c', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'dXVM7VOCGKq9nxQqvRhS',
        outcome: BinaryYesBetOutcome(probAfter: 0.3447299415917093),
        updatedTime: DateTime.parse('2023-04-13T17:48:51.000'),
        market: Market(
            id: 'AOloQ1ekIlygIzGQbOck', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: '4RHoB355fpl830oH69z9',
        outcome: BinaryNoBetOutcome(probAfter: 0.6807206022509562),
        updatedTime: DateTime.parse('2023-04-15T14:35:52.000'),
        market: Market(
            id: 'mbMNbpystSUb3iwXslMj', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'YQPFuhuzidEXfUavwpzQ',
        outcome: BinaryYesBetOutcome(probAfter: 0.33023698048242156),
        updatedTime: DateTime.parse('2023-04-13T17:48:44.000'),
        market: Market(
            id: 'AOloQ1ekIlygIzGQbOck', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'rkQFp2xb6gGyruWPLoUO',
        outcome: BinaryYesBetOutcome(probAfter: 0.27758042769878377),
        updatedTime: DateTime.parse('2023-04-13T17:49:20.000'),
        market: Market(
            id: 'AOloQ1ekIlygIzGQbOck', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'c6nrmBpF9DrnBCchTOLh',
        outcome: BinaryNoBetOutcome(probAfter: 0.3939306375331265),
        updatedTime: DateTime.parse('2023-08-23T10:19:12.000'),
        market: Market(
            id: 'S4vX0HkG12LH8zCm4S9c', outcome: BinaryNoMarketOutcome()),
      ),
      Bet(
        id: 'safAR0N0AaDrmjLPk5xs',
        outcome: BinaryYesBetOutcome(probAfter: 0.85745031296169),
        updatedTime: DateTime.parse('2023-04-14T15:38:27.000'),
        market: Market(
            id: 'Sb4nfJ3Txa9D1X0ikBFU', outcome: BinaryYesMarketOutcome()),
      ),
      Bet(
        id: 'zVSXSkNVdr3AwQZaumLD',
        outcome: BinaryNoBetOutcome(probAfter: 0.3502729837957733),
        updatedTime: DateTime.parse('2023-04-14T04:35:28.000'),
        market: Market(id: 'Hb1ObYB1ONHzFFNLacMR', outcome: null),
      ),
      Bet(
        id: 'IbGkqQQjHOgehJxvqPC4',
        outcome: BinaryNoBetOutcome(probAfter: 0.2903709337323554),
        updatedTime: DateTime.parse('2023-04-14T04:34:09.000'),
        market: Market(id: 'Hb1ObYB1ONHzFFNLacMR', outcome: null),
      ),
      Bet(
        id: 'tdsQJ4Dbsz9EtWiLZSfn',
        outcome: BinaryNoBetOutcome(probAfter: 0.24615384615384614),
        updatedTime: DateTime.parse('2023-09-11T10:05:09.000'),
        market: Market(id: 'Hb1ObYB1ONHzFFNLacMR', outcome: null),
      ),
    ];
  }
}
