import 'package:flutter/material.dart';

import 'package:example/features/tick_stream/presentation/tick_stream_entity.dart';

class TickStreamWidget extends StatelessWidget {
  const TickStreamWidget({required this.entity, super.key});

  final TickStreamEntity entity;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Text(
                'Symbol: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(entity.symbol)
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: <Widget>[
              const Text(
                'Quote: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${entity.quote}')
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: <Widget>[
              const Text(
                'Epoch: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${entity.epoch}')
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: <Widget>[
              const Text(
                'Id: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(entity.id)
            ],
          ),
        ],
      );
}
