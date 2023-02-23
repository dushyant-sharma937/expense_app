import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: constraint.maxHeight * 0.15,
            width: 100,
            child: FittedBox(
              child: Text(
                '₹${spendingAmount.toStringAsFixed(0)}',
                style: const TextStyle(
                    color: Color.fromARGB(255, 229, 255, 255),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
            ),
          ),
          Container(
            height: constraint.maxHeight * 0.05,
          ),
          SizedBox(
            height: constraint.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error.withOpacity(1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: constraint.maxHeight * 0.05,
          ),
          Container(
              height: constraint.maxHeight * 0.15,
              child: Text(
                label,
                style: const TextStyle(
                    color: Color.fromARGB(255, 229, 255, 255),
                    fontWeight: FontWeight.bold),
              )),
        ],
      );
    });
  }
}
