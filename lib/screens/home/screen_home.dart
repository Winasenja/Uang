import 'package:flutter/material.dart';
import 'package:sendiri/db/category/category_db.dart';
import 'package:sendiri/models/category/category_model.dart';
import 'package:sendiri/screens/add_transaction/screen_add_transaction.dart';
import 'package:sendiri/screens/category/category_add_popup.dart';
import 'package:sendiri/screens/category/screen_category.dart';
import 'package:sendiri/screens/home/widgets/bottom_navigation.dart';
import 'package:sendiri/screens/transaction/screen_transaction.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = const [
    ScreenTransaction(),
    ScreenCategory(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 238, 230),
      appBar: AppBar(
        title: const Text('MONEY MANAGER'),
        centerTitle: true,
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('add transaction');
            Navigator.of(context).pushNamed(ScreenaddTransaction.routeName);
          } else {
            print('add category');

            showCategoryAddPopup(context);
            //final _sample = CategoryModel(
            //id: DateTime.now().millisecondsSinceEpoch.toString(),
            //name: 'Travel',
            //type: CategoryType.expense,
            //);
            //CategoryDB().insertCategory(_sample);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
