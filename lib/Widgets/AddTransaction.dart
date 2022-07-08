import 'package:budgettrack/Widgets/BottomNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key, required this.itemtoAdd}) : super(key: key);

  final Function(TransactionItem) itemtoAdd;
  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController amountEditingContoller = TextEditingController();
  bool isExpenseController = true;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black38, Colors.white.withOpacity(0.4)]),
        ),
        width: MediaQuery.of(context).size.width / 1.3,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Text(
                'Add Expense',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(hintText: 'Expense here'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: amountEditingContoller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Amount  here'),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text('IS EXPENSIVE ? '),
                  const Spacer(),
                  Switch.adaptive(
                      activeColor: Colors.red.shade400,
                      value: isExpenseController,
                      onChanged: (b) {
                        setState(() {
                          isExpenseController = b;
                        });
                      }),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.white38),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.white)))),
                  onPressed: () {
                    if (amountEditingContoller.text.isNotEmpty &&
                        textEditingController.text.isNotEmpty) {
                      widget.itemtoAdd(
                        TransactionItem(
                            isExpense: isExpenseController,
                            amount: double.parse(amountEditingContoller.text),
                            itemTitle: textEditingController.text),
                      );
                    }
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.add, color: Colors.white.withOpacity(0.8)))
            ],
          ),
        ),
      ),
    );
  }
}

class AddBudget extends StatefulWidget {
  final Function(double) addBudget;
  AddBudget({Key? key, required this.addBudget}) : super(key: key);

  @override
  State<AddBudget> createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudget> {
  TextEditingController budgetCOntroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.black38, Colors.white.withOpacity(0.4)]),
      ),
      child: Column(
        children: [
          (TextField(
            controller: budgetCOntroller,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(hintText: 'Budget here'),
          )),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                if (budgetCOntroller.text.isNotEmpty) {
                  widget.addBudget(double.parse(budgetCOntroller.text));
                  Navigator.pop(context);
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white38),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.white)))),
              child: Icon(Icons.add, color: Colors.white.withOpacity(0.8)))
        ],
      ),
    ));
  }
}
 