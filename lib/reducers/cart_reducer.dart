import 'package:ecommerce/models/cart.dart';
import 'package:redux/redux.dart';

import 'actions/add_to_cart_actions.dart';

List<CartItem> cartReducer(List<CartItem> items, dynamic action) {
  if (action is AddItemAction) {
    return addItem(items, action);
  } else if (action is AddQuantityAction) {
    return addItemQuantity(items, action);
  } else if (action is MinusQuantityAction) {
    return minusItemQuantity(items, action);
  } else if (action is RemoveItemAction) {
    return removeItem(items, action);
  } else if (action is RemoveAllAction) {
    return removeAllItem();
  }
  return items;
}

List<CartItem> addItem(List<CartItem> items, AddItemAction action) {
  List<CartItem> temp = [];
  if (items.indexWhere(
          (element) => element.productId == action.item.productId) >=
      0) {
    items[items.indexWhere(
            (element) => element.productId == action.item.productId)]
        .quantity++;
    return List.from(items);
  }
  if (temp.isNotEmpty) {
    return temp;
  } else {
    return List.from(items)..add(action.item);
  }
}

List<CartItem> addItemQuantity(List<CartItem> items, AddQuantityAction action) {
  if (items.indexWhere(
          (element) => element.productId == action.item.productId) >=
      0) {
    items[items.indexWhere(
            (element) => element.productId == action.item.productId)]
        .quantity++;
    return List.from(items);
  }
  return items;
}

List<CartItem> minusItemQuantity(
    List<CartItem> items, MinusQuantityAction action) {
  if (items.indexWhere(
          (element) => element.productId == action.item.productId) >=
      0) {
    items[items.indexWhere(
            (element) => element.productId == action.item.productId)]
        .quantity--;
    return List.from(items);
  }
  return items;
}

List<CartItem> removeItem(List<CartItem> items, RemoveItemAction action) {
  items.removeWhere((item) => item.id == action.item.id);
  return List.from(items);
}

List<CartItem> removeAllItem() {
  return [];
}
