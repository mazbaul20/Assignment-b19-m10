class Expense {
  final int? id;
  final String title;
  final double amount;

  Expense({this.id, required this.title, required this.amount});

  // convert to map. save in database
  Map<String, dynamic> toMap() {
    return {if (id != null) 'id': id, 'title': title, 'amount': amount};
  }

  // contact object from map
  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'] as int?,
      title: map['title'],
      amount: map['amount'],
    );
  }
}

List<Expense> demoExpenses = [
  Expense(id: 1, title: 'Lunch', amount: 150.00),
  Expense(id: 2, title: 'Bus Fare', amount: 40.00),
  Expense(id: 3, title: 'Groceries', amount: 500.00),
  Expense(id: 4, title: 'Coffee', amount: 60.00),
  Expense(id: 5, title: 'Internet Bill', amount: 500.00),
  Expense(id: 6, title: 'Snacks', amount: 85.00),
  Expense(id: 7, title: 'Rickshaw Fare', amount: 30.00),
];
