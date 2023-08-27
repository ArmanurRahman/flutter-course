import 'package:expense_management/model/Expense.dart';
import 'package:expense_management/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  ExpenseList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemoveExpense(
            expenses[index],
          );
        },
        child: ExpenseItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}
