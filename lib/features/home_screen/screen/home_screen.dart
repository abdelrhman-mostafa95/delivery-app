import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:delivery_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:delivery_app/features/home_screen/data/home_data.dart';
import 'package:delivery_app/features/home_screen/widgets/app_bar.dart';
import 'package:delivery_app/features/home_screen/widgets/bottom_navbar/custom_bottom_navbar.dart';
import 'package:delivery_app/features/home_screen/widgets/category_item.dart';
import 'package:delivery_app/features/home_screen/widgets/populars_item.dart';
import 'package:delivery_app/features/home_screen/widgets/recomendados_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(title: "Inicio"),
      backgroundColor: Colors.white,
      extendBody: true,
      bottomNavigationBar: CustomBottomNavbar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        onCartPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 39.h),
            Text("Explorar categorias", style: AppTextStyles.sectionTitle),
            SizedBox(height: 14.h),
            SizedBox(
              height: 96.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: HomeData.categoryTitles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 28.w),
                    child: CategoryItem(
                      title: HomeData.categoryTitles[index],
                      imagePath: HomeData.categoryImages[index],
                      backgroundColor: HomeData.categoryColors[index],
                      width: 64.w,
                      height: 64.h,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30.h),
            Text("Productos populares", style: AppTextStyles.sectionTitle),
            SizedBox(height: 13.h),
            SizedBox(
              height: 214.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: HomeData.popularsImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: PopularsItem(
                      imagePath: HomeData.popularsImages[index],
                      title: HomeData.popularsTitles[index],
                      description: HomeData.popularsDescriptions[index],
                      price: HomeData.popularsPrices[index],
                      isFavorite: false,
                      onFavoritePressed: () =>
                          print("Favorite toggled for $index"),
                      onTap: () => print("Card tapped: $index"),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 33.h),
            Text("Recomendados", style: AppTextStyles.sectionTitle),
            SizedBox(height: 13.h),
            SizedBox(
              height: 120.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: HomeData.recomendadosImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: RecomendadosItem(
                      imagePath: HomeData.recomendadosImages[index],
                      title: HomeData.recomendadosTitles[index],
                      description: HomeData.recomendadosDescriptions[index],
                      price: HomeData.popularsPrices[index],
                      isFavorite: false,
                      onFavoritePressed: () =>
                          print("Favorite toggled for $index"),
                      onTap: () => print("Card tapped: $index"),
                      category: 'Naturales',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
