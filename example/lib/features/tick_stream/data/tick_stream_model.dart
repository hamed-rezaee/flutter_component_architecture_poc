import 'package:example/core/contracts/data/base_model.dart';

class TickStreamModel extends BaseModel {
  TickStreamModel({
    required this.ask,
    required this.bid,
    required this.epoch,
    required this.id,
    required this.pipSize,
    required this.quote,
    required this.symbol,
  });

  factory TickStreamModel.fromJson(Map<String, dynamic> json) =>
      TickStreamModel(
        ask: json['ask'] as double,
        bid: json['bid'] as double,
        epoch: json['epoch'] as int,
        id: json['id'] as String,
        pipSize: json['pip_size'] as int,
        quote: json['quote'] as double,
        symbol: json['symbol'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'ask': ask,
        'bid': bid,
        'epoch': epoch,
        'id': id,
        'pip_size': pipSize,
        'quote': quote,
        'symbol': symbol,
      };

  final double ask;
  final double bid;
  final int epoch;
  final String id;
  final int pipSize;
  final double quote;
  final String symbol;
}
