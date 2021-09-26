import 'package:ecommerce/models/cart.dart';

class AddItemAction {
  final CartItem item;

  AddItemAction(this.item);
}

class EditItemAction {
  final CartItem item;

  EditItemAction(this.item);
}

class AddQuantityAction {
  final CartItem item;

  AddQuantityAction(this.item);
}

class MinusQuantityAction {
  final CartItem item;

  MinusQuantityAction(this.item);
}

class RemoveItemAction {
  final CartItem item;

  RemoveItemAction(this.item);
}

class RemoveAllAction {
  RemoveAllAction();
}
