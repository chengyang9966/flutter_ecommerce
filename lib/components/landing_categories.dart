import 'package:ecommerce/models/categories.dart';
import 'package:ecommerce/reducers/actions/categories_actions.dart';
import 'package:ecommerce/reducers/app_reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../constants.dart';

// We need satefull widget for our categories

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({Key? key}) : super(key: key);

  @override
  _CategoriesTabState createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  // By default our first item will be selected
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: StoreConnector<AppState, List<Categories>>(
          converter: (Store<AppState> store) => store.state.categories,
          builder: (context, List<Categories> categoryList) {
            return SizedBox(
              height: 25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) =>
                    buildCategory(categoryList[index], index),
              ),
            );
          }),
    );
  }

  Widget buildCategory(Categories category, int index) {
    return GestureDetector(
      onTap: () {
        StoreProvider.of<AppState>(context).dispatch(SelectedAction(Categories(
            selected: !category.selected,
            title: category.title,
            value: category.value)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              category.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: category.selected ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: kDefaultPaddin / 4), //top padding 5
              height: 2,
              width: category.title.length * 8,
              color: category.selected ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
