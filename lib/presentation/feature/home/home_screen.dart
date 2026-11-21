import 'package:assignment_b19_m10/core/database_helper.dart';
import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_strings.dart';
import '../../../core/expense_model.dart';
import '../add_new_expense/add_new_expense_screen.dart';
import 'widget/expense_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ExpenseModel> _expenses = [];

  final DatabaseHelper _db = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  Future<void> _loadExpenses() async {
    final expenses = await _db.getAllExpenses();
    setState(() {
      _expenses = expenses;
    });
  }

  Future<void> _goToAddNewExpensePage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddNewExpenseScreen()),
    );

    if (result == true) {
      await _loadExpenses();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.appTitle,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${AppStrings.totalExpenses} ",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: .normal,
                        color: AppColors.textOnPrimary,
                      ),
                    ),
                    Text(
                      "৳ 1200.00",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: .w700,
                        color: AppColors.textOnPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              _expenses.isEmpty
                  ? Text("")
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        AppStrings.recentExpenses,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: .bold,
                          fontSize: 16,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: _expenses.isEmpty
                      ? const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.receipt_long_outlined,
                                size: 48,
                                color: AppColors.textSecondary,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'No expenses yet',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: _expenses.length,
                          itemBuilder: (context, index) {
                            var expense = _expenses[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: ExpenseCard(
                                expense: expense,
                                onTap: () {},
                                index: index,
                              ),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _goToAddNewExpensePage();
        },
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.background,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
