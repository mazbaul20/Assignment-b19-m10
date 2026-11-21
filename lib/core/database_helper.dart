import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'expense_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  // database variable
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  } //end method

  Future<Database> _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'Expenses.db');
    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {
    return await db.execute('''
      CREATE TABLE expenses(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        amount INTEGER NOT NULL
      )
      ''');
  } // end method

  Future<List<ExpenseModel>> getAllExpenses() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('expenses');

    return maps.map((map) => ExpenseModel.fromMap(map)).toList();
  } // end get all contacts

  //create expense
  Future<int> createExpense(ExpenseModel expenseModel) async {
    final db = await database;
    return await db.insert('expenses', expenseModel.toMap());
  } //end method

  Future<int> deleteExpense(ExpenseModel expenseModel) async {
    final db = await database;

    return await db.delete(
      'expenses',
      where: 'id = ?',
      whereArgs: [expenseModel.id],
    );
  }

  Future<double> getTotalExpense() async {
    final db = await database;

    final result = await db.query(
      'expenses',
      columns: ['SUM(amount) as total'],
    );

    var total = result.first['total'];

    if (total == null) {
      return 0.0;
    }

    return double.parse(total.toString());
  }
}
