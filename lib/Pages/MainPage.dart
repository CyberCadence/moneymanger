import 'package:budgettrack/Pages/HomePage.dart';
import 'package:budgettrack/Services/BudgetService.dart';
import 'package:budgettrack/Services/themeService.dart';
import 'package:budgettrack/Pages/ProfilePage.dart';
import 'package:budgettrack/Widgets/AddTransaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<BottomNavigationBarItem> bottomNav = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
  ];
  List<Widget> pages = const [HomePage(), ProfilePage()];
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                themeService.darkTheme = !themeService.darkTheme;
              },
              icon:
                  Icon(themeService.darkTheme ? Icons.sunny : Icons.dark_mode)),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (context) => AddBudget(addBudget: (budget) {
                              final budgetService = Provider.of<BudgetService>(
                                  context,
                                  listen: false);
                              budgetService.budget = budget;
                          
                            }));
                  });
                },
                icon: const Icon(Icons.money))
          ],
          title: const Center(
              child: Text(
            'Budget Tracker',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        body: pages[currentPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPageIndex,
          items: bottomNav,
          onTap: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ));
  }
}
