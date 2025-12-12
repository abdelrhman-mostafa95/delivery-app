import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeData {
  static const List<Color> categoryColors = [
    AppColors.categoryGreen,
    AppColors.categoryLightGreen,
    AppColors.categoryYellow,
    AppColors.categoryPink,
    AppColors.categoryPurple,
  ];

  static const List<String> categoryImages = [
    "assets/images/category-1.png",
    "assets/images/category-2.png",
    "assets/images/category-3.png",
    "assets/images/category-4.png",
    "assets/images/category-5.png",
  ];

  static const List<String> categoryTitles = [
    "Tacos",
    "Frias",
    "Burger",
    "Pizza",
    "Burritos",
  ];

  static const List<String> popularsImages = [
    "assets/images/popular-1.png",
    "assets/images/popular-2.png",
    "assets/images/popular-3.png",
  ];

  static const List<String> popularsTitles = [
    "Pizza Clásica",
    "Hamburguesa mix",
    "Pasta Alfredo",
  ];

  static const List<String> popularsDescriptions = [
    "Salsa clásica de la casa",
    "Doble carne con queso",
    "Crema y queso parmesano",
  ];

  static const List<String> popularsPrices = ["12.58", "12.58", "14.20"];

  static const List<String> recomendadosImages = [
    "assets/images/recomendados-1.png",
    "assets/images/recomendados-2.png",
  ];

  static const List<String> recomendadosTitles = [
    "Malteadas tropicales",
    "Malteadas tropicales",
  ];

  static const List<String> recomendadosDescriptions = [
    "Elaborado con jugos naturales",
    "Salsa clásica de la casa",
  ];
}
