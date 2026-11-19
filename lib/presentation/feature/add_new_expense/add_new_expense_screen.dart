import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_strings.dart';

class AddNewExpenseScreen extends StatefulWidget {
  const AddNewExpenseScreen({super.key});

  @override
  State<AddNewExpenseScreen> createState() => _AddNewExpenseScreenState();
}

class _AddNewExpenseScreenState extends State<AddNewExpenseScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.addExpenseTitle,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Expense Title',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),

              TextFormField(
                controller: _titleController,
                textInputAction: TextInputAction.next,
                style: const TextStyle(color: AppColors.textPrimary),
                decoration: const InputDecoration(
                  hintText: 'e.g., Lunch',
                  hintStyle: TextStyle(color: AppColors.textSecondary),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter an expense title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              const Text(
                'Amount',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),

              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                textInputAction: TextInputAction.done,
                style: const TextStyle(color: AppColors.textPrimary),
                decoration: const InputDecoration(
                  hintText: 'e.g., 200',
                  hintStyle: TextStyle(color: AppColors.textSecondary),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter an amount';
                  }
                  final parsedAmount = double.tryParse(value.trim());
                  if (parsedAmount == null || parsedAmount <= 0) {
                    return 'Amount must be greater than 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textOnPrimary,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Save Expense',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
