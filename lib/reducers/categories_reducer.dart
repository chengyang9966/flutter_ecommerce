import 'package:ecommerce/models/categories.dart';
import 'package:redux/redux.dart';

import 'actions/categories_actions.dart';

List<Categories> categoriesReducers(
    List<Categories> categories, dynamic action) {
  if (action is SelectedAction) {
    return selectCategory(categories, action);
  }

  return categories;
}

List<Categories> selectCategory(
    List<Categories> categories, SelectedAction action) {
  List<Categories> tempCategories = [];
  for (var element in categories) {
    if (element.value == action.category.value) {
      tempCategories.add(action.category);
    } else {
      tempCategories.add(Categories(
          title: element.title, value: element.value, selected: false));
    }
  }
  ;
  if (tempCategories.isNotEmpty) {
    return tempCategories;
  }
  return List.from(categories);
}
