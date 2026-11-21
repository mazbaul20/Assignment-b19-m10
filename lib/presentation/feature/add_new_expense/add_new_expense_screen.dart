import 'package:assignment_b19_m10/core/database_helper.dart';
import 'package:assignment_b19_m10/core/expense_model.dart';
import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_snackbar.dart';
import '../../../core/app_strings.dart';

class AddNewExpenseScreen extends StatefulWidget {
  const AddNewExpenseScreen({super.key});

  @override
  State<AddNewExpenseScreen> createState() => _AddNewExpenseScreenState();
}

class _AddNewExpenseScreenState extends State<AddNewExpenseScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final DatabaseHelper _db = DatabaseHelper();

  Future<void> addExpense() async {
    final expense = ExpenseModel(
      title: _titleController.text.trim(),
      amount: double.parse(_amountController.text.trim()),
    );

    await _db.createExpense(expense);

    _titleController.clear();
    _amountController.clear();
    if (!mounted) return;

    AppSnackbar.show(
      context,
      message: AppStrings.expenseAddedSuccess,
      backgroundColor: AppColors.success,
    );
    Navigator.pop(context, true);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await addExpense();
                    }
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
