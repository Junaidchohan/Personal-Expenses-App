import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final String spendingAmount;
  final String spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    double maxBarHeightFactor = 1.0;

    double amount =
        double.parse(spendingAmount); // Convert spendingAmount to a double

    double adjustedHeightFactor = double.parse(spendingPctOfTotal);
    if (adjustedHeightFactor > maxBarHeightFactor) {
      adjustedHeightFactor = maxBarHeightFactor;
    }

    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                  child: Text(
                    '\$${amount.toStringAsFixed(2)}', // Apply toStringAsFixed to the double
                    style: TextStyle(fontSize: 12,color: Colors.white),
                  ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: const Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: adjustedHeightFactor,
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Theme.of(context).primaryColor,
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 12,color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
