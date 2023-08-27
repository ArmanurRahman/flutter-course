import 'package:expense_management/model/Expense.dart';
import 'package:expense_management/widgets/chart/chart_bar.dart';
import 'package:expense_management/widgets/expense_list.dart';
import 'package:expense_management/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpense = [];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerExpense.add(expense);
    });
  }

  void onRemoveExpense(Expense expense) {
    final expenseIndex = _registerExpense.indexOf(expense);
    setState(() {
      _registerExpense.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found, try to add one'),
    );
    if (_registerExpense.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registerExpense,
        onRemoveExpense: onRemoveExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skyblue Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Chart(expenses: _registerExpense),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
