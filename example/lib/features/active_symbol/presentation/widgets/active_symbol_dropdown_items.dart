import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';
import 'package:flutter/material.dart';

class ActiveSymbolDropdownItems extends StatelessWidget {
  const ActiveSymbolDropdownItems({
    required this.item,
    required this.isSelected,
    super.key,
  });

  final ActiveSymbolEntity item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          item.symbolDisplayName,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
}
