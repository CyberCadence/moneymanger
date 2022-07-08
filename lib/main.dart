 
import 'package:budgettrack/Services/BudgetService.dart';
import 'package:budgettrack/Services/themeService.dart';
import 'package:budgettrack/Pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [ChangeNotifierProvider<ThemeService>(create: (_)=>ThemeService(),),
 ChangeNotifierProvider<BudgetService>(create: (__ )=>BudgetService())],
   
    child: Builder(builder: (context) {
      final themeService = Provider.of<ThemeService>(context);
      return MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.red,
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.indigo, brightness: themeService.darkTheme?Brightness.dark:Brightness.light),
         ) ,home:const  MainPage());
    }),
  ));
}
