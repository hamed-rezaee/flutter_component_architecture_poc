import 'package:flutter/material.dart';

import 'package:example/features/active_symbol/presentation/active_symbol_entity.dart';

class ActiveSymbolWidget extends StatelessWidget {
  const ActiveSymbolWidget({
    required this.activeSymbols,
    this.selectedActiveSymbol,
    this.onChanged,
    super.key,
  });

  final List<ActiveSymbolEntity> activeSymbols;
  final ActiveSymbolEntity? selectedActiveSymbol;
  final void Function(ActiveSymbolEntity entity)? onChanged;

  @override
  Widget build(BuildContext context) => DropdownButton<ActiveSymbolEntity>(
        value: selectedActiveSymbol,
        items: activeSymbols
            .map(
              (ActiveSymbolEntity activeSymbol) =>
                  DropdownMenuItem<ActiveSymbolEntity>(
                value: activeSymbol,
                child: Text(activeSymbol.symbolDisplayName),
              ),
            )
            .toList(),
        onChanged: (ActiveSymbolEntity? entity) => onChanged?.call(entity!),
      );
}
