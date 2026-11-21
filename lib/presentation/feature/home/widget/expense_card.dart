import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/expense_model.dart';
import 'delete_confirmation.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
    required this.expense,
    required this.index,
    required this.onDelete,
  });

  final ExpenseModel expense;
  final VoidCallback onDelete;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.3),
          width: 1.0,
        ),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${index + 1}. ${expense.title}',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            "৳ ${expense.amount}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {
              DeleteConfirmDialog.show(
                context: context,
                title: 'Delete Expense?',
                message: 'Are you sure you want to delete "${expense.title}"?',
                onConfirm: () {
                  onDelete();
                },
              );
            },
            icon: const Icon(Icons.delete, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
