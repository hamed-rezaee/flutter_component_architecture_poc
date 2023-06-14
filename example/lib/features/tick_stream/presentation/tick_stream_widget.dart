import 'package:flutter/material.dart';

import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';
import 'package:example/features/tick_stream/presentation/enums/tick_state.dart';
import 'package:example/features/tick_stream/presentation/helpers/helpers.dart';

class TickStreamWidget extends StatefulWidget {
  const TickStreamWidget({required this.entity, super.key});

  final TickStreamEntity entity;

  @override
  State<TickStreamWidget> createState() => _TickStreamWidgetState();
}

class _TickStreamWidgetState extends State<TickStreamWidget> {
  TickState _status = TickState.none;

  @override
  void didUpdateWidget(TickStreamWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.entity != widget.entity) {
      widget.entity.quote == oldWidget.entity.quote
          ? _status = TickState.none
          : widget.entity.quote > oldWidget.entity.quote
              ? _status = TickState.up
              : _status = TickState.down;
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Text(
                'Symbol: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.entity.symbol),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: <Widget>[
              const Text(
                'Quote: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '${widget.entity.quote}',
                    style: TextStyle(color: getColor(_status)),
                  ),
                  Icon(
                    _status == TickState.up
                        ? Icons.arrow_drop_up_rounded
                        : _status == TickState.down
                            ? Icons.arrow_drop_down_rounded
                            : Icons.commit_rounded,
                    color: getColor(_status),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: <Widget>[
              const Text(
                'Epoch: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${getFormattedDateTime(widget.entity.epoch)}'),
            ],
          ),
        ],
      );
}
