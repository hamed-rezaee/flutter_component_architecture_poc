import 'package:flutter/material.dart';

import 'package:example/features/tick_stream/presentation/tick_stream_entity.dart';

class TickStreamWidget extends StatelessWidget {
  const TickStreamWidget({required this.entity, super.key});

  final TickStreamEntity entity;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Row(
            children: <Widget>[const Text('Symbol: '), Text(entity.symbol)],
          ),
          Row(
            children: <Widget>[const Text('Quote: '), Text('${entity.quote}')],
          ),
          Row(
            children: <Widget>[const Text('Epoch: '), Text('${entity.epoch}')],
          ),
          Row(
            children: <Widget>[const Text('Id: '), Text(entity.id)],
          ),
        ],
      );
}
