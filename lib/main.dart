import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sendiri/db/category/category_db.dart';
import 'package:sendiri/models/category/category_model.dart';
import 'package:sendiri/models/transaction/transaction_model.dart';
import 'package:sendiri/screens/add_transaction/screen_add_transaction.dart';
import 'package:sendiri/screens/transaction/screen_transaction.dart';

import 'screens/home/screen_home.dart';

Future<void> main() async {
  final obj1 = CategoryDB();
  final obj2 = CategoryDB();
  //print('Objects comparing');
  //print(obj1 == obj2);

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Manager',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(20, 6, 44, 1)),
        useMaterial3: true,
      ),
      home: const ScreenHome(),
      routes: {
        ScreenaddTransaction.routeName: (ctx) => const ScreenaddTransaction(),
      },
    );
  }
}
