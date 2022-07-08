import 'dart:ui';

import 'package:budgettrack/Pages/MOdels/transactionitem.dart';
import 'package:budgettrack/Pages/transactioncard.dart';
import 'package:budgettrack/Services/BudgetService.dart';
import 'package:budgettrack/Widgets/AddTransaction.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TransactionItem> items = [];


  @override
  Widget build(BuildContext context) {
    final budgetService=Provider.of<BudgetService>(context);
   
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: screenSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: CircularPercentIndicator(
                    radius: screenSize.width / 2,
                    lineWidth: 10.0,
                    percent: .5,
                    backgroundColor: Colors.white,
                    center: Column(
                      mainAxisSize: MainAxisSize.min,
                      children:   [
                       const Text(
                          "\₹ 0",
                          style: TextStyle(
                              fontSize: 48, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Balance",
                          style: TextStyle(fontSize: 18),
                        ),
                   Text ('Budget: ₹' + budgetService.budget.toString(),style:const TextStyle(fontSize: 10),) ],
                    ),
                    progressColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  "Items",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                ...List.generate(
                    items.length,
                    (index) => TransactionCard(
                          item: items[index],
                        )),
              ],
            ),
          ),
        ),
      ),
     floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showDialog(
                context: context,
                builder: (context) => AddTransaction(itemtoAdd: (transactionitem) {}));
          });
        },
        child: const Icon(Icons.add),
      ));
  }
}
