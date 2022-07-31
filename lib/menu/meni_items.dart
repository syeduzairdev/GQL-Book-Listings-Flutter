import 'package:flutter/material.dart';
import 'package:gql_flutter_todo/menu/menu_item.dart';

class MenuItems {
  static const List<MenuItem> FirstItems = [
    // itemAdd,
    itemEdit,
  ];
  static const List<MenuItem> SecondItem = [
    itemDelete,
  ];
  // Add New Books
  // static const itemAdd = MenuItem(
  //   text: 'Add',
  //   icon: Icons.add,
  // );
  //update the books
  static const itemEdit = MenuItem(
    text: 'Edit',
    icon: Icons.edit,
  );
  //delete the books
  static const itemDelete = MenuItem(
    text: 'Delete',
    icon: Icons.delete,
  );
}
