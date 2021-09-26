import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/categories.dart';
import 'package:ecommerce/models/profile.dart';
import 'package:ecommerce/reducers/cart_reducer.dart';
import 'package:ecommerce/reducers/categories_reducer.dart';
import 'package:ecommerce/reducers/profile_reducer.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

@immutable
class AppState {
  final List<CartItem> cartItem;
  final List<Categories> categories;
  final Profile profile;

  const AppState(
      {required this.cartItem,
      required this.categories,
      required this.profile});

  AppState copyWith(
      {required List<CartItem> cartItem,
      required List<Categories> categories,
      required Profile profile}) {
    return AppState(
        cartItem: cartItem, categories: categories, profile: profile);
  }
}

AppState appReducers(AppState state, dynamic action) {
  return AppState(
      categories: categoriesReducers(state.categories, action),
      cartItem: cartReducer(state.cartItem, action),
      profile: profileReducer(state.profile, action)
      // loginState: loginReducer(state.loginState, action),
      );
}

Future<Store<AppState>> createStore() async {
  final List<Categories> categoriesInitial = [];
  final List<CartItem> cartItemInitial = [];
  Profile profileInitial = Profile(
    email: '',
    lastName: '',
    firstName: '',
    id: 1,
    phoneNumber: '',
  );
  categoriesInitial
      .add(Categories(title: 'Mobile Phones', value: 1, selected: true));
  categoriesInitial
      .add(Categories(title: 'Tablets', value: 2, selected: false));
  categoriesInitial
      .add(Categories(title: 'Computer', value: 3, selected: false));
  // categoriesInitial.add(Categories(title: 'Others', value: 4, selected: false));

  return Store<AppState>(
    appReducers,
    initialState: AppState(
        categories: categoriesInitial,
        cartItem: cartItemInitial,
        profile: profileInitial),
  );
}
