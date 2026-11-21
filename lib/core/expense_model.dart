class ExpenseModel {
  final int? id;
  final String title;
  final double amount;

  ExpenseModel({this.id, required this.title, required this.amount});

  // convert to map. save in database
  Map<String, dynamic> toMap() {
    return {if (id != null) 'id': id, 'title': title, 'amount': amount};
  }

  // expense object from map
  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'] as int?,
      title: map['title'],
      amount: (map['amount'] as num).toDouble(),
    );
  }
}

List<ExpenseModel> demoExpenses = [
  ExpenseModel(id: 1, title: 'Lunch', amount: 150.00),
  ExpenseModel(id: 2, title: 'Bus Fare', amount: 40.00),
  ExpenseModel(id: 3, title: 'Groceries', amount: 500.00),
  ExpenseModel(id: 4, title: 'Coffee', amount: 60.00),
  ExpenseModel(id: 5, title: 'Internet Bill', amount: 500.00),
  ExpenseModel(id: 6, title: 'Snacks', amount: 85.00),
  ExpenseModel(id: 7, title: 'Rickshaw Fare', amount: 30.00),
];
