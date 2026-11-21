class AppStrings {
  AppStrings._();

  // General App Strings
  static const String appTitle = "Expense Tracker";

  // Home Screen Strings
  static const String totalExpenses = "Total Expenses:";
  static const String recentExpenses = "Recent Expenses";
  static const String noExpensesFound = "No expenses added yet!";

  // Add Expense Screen Strings
  static const String addExpenseTitle = "Add New Expense";
  static const String expenseTitleLabel = "Expense Title";
  static const String expenseTitleHint = "e.g., Lunch, Bus Fare";
  static const String amountLabel = "Amount";
  static const String amountHint = "e.g., 200";
  static const String saveButton = "Save Expense";

  // Validation & Error Messages
  static const String emptyFieldError = "Please fill in this field";
  static const String invalidAmountError = "Amount must be greater than zero";

  // Success Messages
  static const String expenseAddedSuccess = "Expense added successfully!";
  static const String expenseDeleteSuccess = "Expense Deleted successfully!";
  static const String expenseDeletedSuccess = "Expense deleted successfully!";
}
