// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, id;
  final Color color;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Iphone 12 Mini",
      price: 4500,
      description: dummyText,
      image: "assets/images/iphone_12_mini_blue.png",
      color: const Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Samsung 20 Ultra",
      price: 4000,
      description: dummyText,
      image: "assets/images/samsung_ultra_20.png",
      color: const Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Haiwei p30",
      price: 4000,
      description: dummyText,
      image: "assets/images/huawei_p30.png",
      color: const Color(0xFF989493)),
  Product(
      id: 4,
      title: "Xiao Mi 11 Pro",
      price: 3500,
      description: dummyText,
      image: "assets/images/xiao_mi_11_pro.png",
      color: const Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Google Pixel 6",
      price: 4600,
      description: dummyText,
      image: "assets/images/google_pixel_6.png",
      color: const Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "ROG Phone 5",
    price: 4500,
    description: dummyText,
    image: "assets/images/rog_phone_5.png",
    color: const Color(0xFFAEAEAE),
  ),
];

List<Product> tablets = [
  Product(
      id: 11,
      title: "Ipad",
      price: 2149,
      description: dummyText,
      image: "assets/images/ipad.png",
      color: const Color(0xFF3D82AE)),
  Product(
      id: 12,
      title: "Samsung Galaxy Tab 7S",
      price: 4000,
      description: dummyText,
      image: "assets/images/samsung_galaxy.png",
      color: const Color(0xFFD3A984)),
  Product(
      id: 13,
      title: "MatePad t8",
      price: 2500,
      description: dummyText,
      image: "assets/images/matepad_t8.png",
      color: const Color(0xFF989493)),
  Product(
      id: 14,
      title: "Mi Pad 4 plus",
      price: 3000,
      description: dummyText,
      image: "assets/images/mi_pad_4_plus1.png",
      color: const Color(0xFFE6B398)),
  Product(
      id: 15,
      title: "Google Pixel Slate",
      price: 3800,
      description: dummyText,
      image: "assets/images/pixel_slate.png",
      color: const Color(0xFFFB7883)),
  Product(
    id: 16,
    title: "Zen Pad 10",
    price: 3500,
    description: dummyText,
    image: "assets/images/zenpad_10.png",
    color: const Color(0xFFAEAEAE),
  ),
];
List<Product> computer = [
  Product(
      id: 21,
      title: "Macbook Pro",
      price: 6000,
      description: dummyText,
      image: "assets/images/macbook_pro.png",
      color: const Color(0xFF3D82AE)),
  Product(
      id: 22,
      title: "NoteBook Plus 2",
      price: 4500,
      description: dummyText,
      image: "assets/images/samsung_notebook_plus_2.png",
      color: const Color(0xFFD3A984)),
  Product(
      id: 23,
      title: "MateBook X pro",
      price: 6000,
      description: dummyText,
      image: "assets/images/MateBook_x_pro.png",
      color: const Color(0xFF989493)),
  Product(
      id: 24,
      title: "MSI GF 63 Thin",
      price: 7000,
      description: dummyText,
      image: "assets/images/msi_GF63.png",
      color: const Color(0xFFE6B398)),
  Product(
      id: 25,
      title: "Dell Inspiron 5593",
      price: 4000,
      description: dummyText,
      image: "assets/images/inspiron_5593.png",
      color: const Color(0xFFFB7883)),
  Product(
    id: 26,
    title: "Rog Zephyrus",
    price: 7000,
    description: dummyText,
    image: "assets/images/rog_zephyrus.png",
    color: const Color(0xFFAEAEAE),
  ),
];
List<Product> other = [
  Product(
      id: 31,
      title: "Macbook Pro",
      price: 6000,
      description: dummyText,
      image: "assets/images/macbook_pro.png",
      color: const Color(0xFF3D82AE)),
  Product(
      id: 32,
      title: "NoteBook Plus 2",
      price: 4500,
      description: dummyText,
      image: "assets/images/samsung_notebook_plus_2.png",
      color: const Color(0xFFD3A984)),
  Product(
      id: 33,
      title: "MateBook X pro",
      price: 6000,
      description: dummyText,
      image: "assets/images/MateBook_x_pro.png",
      color: const Color(0xFF989493)),
  Product(
      id: 34,
      title: "MSI GF 63 Thin",
      price: 7000,
      description: dummyText,
      image: "assets/images/msi_GF63.png",
      color: const Color(0xFFE6B398)),
  Product(
      id: 35,
      title: "Dell Inspiron 5593",
      price: 4000,
      description: dummyText,
      image: "assets/images/inspiron_5593.png",
      color: const Color(0xFFFB7883)),
  Product(
    id: 36,
    title: "Rog Zephyrus",
    price: 7000,
    description: dummyText,
    image: "assets/images/rog_zephyrus.png",
    color: const Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
