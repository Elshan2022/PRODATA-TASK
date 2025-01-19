import 'package:flutter/material.dart';
import 'package:flutter_prodata_task/presentation/theme/app_colors.dart';

class CustomChip extends StatelessWidget {
  const CustomChip(
      {super.key,
      required this.label,
      required this.isSelected,
      required this.onPressed});

  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onPressed,
      backgroundColor: isSelected ? AppColors.black : AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      label: Text(label),
      labelStyle: TextStyle(
        color: isSelected ? AppColors.white : AppColors.black,
      ),
    );
  }
}
