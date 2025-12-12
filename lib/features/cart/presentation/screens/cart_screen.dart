import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:delivery_app/features/cart/data/cart_data.dart';
import 'package:delivery_app/features/cart/presentation/widgets/add_address_button.dart';
import 'package:delivery_app/features/cart/presentation/widgets/address_tab.dart';
import 'package:delivery_app/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:delivery_app/features/cart/presentation/widgets/cart_summary_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Main Cart Screen
/// Contains only the Scaffold, AppBar, and body layout
/// All UI components are extracted into separate widgets
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  // ============================================
  // Screen Constants
  // ============================================
  static final double _horizontalPadding = 24.w;
  static final double _progressBarHeight = 6.h;
  static final double _progressBarTopPadding = 16.h;
  static final double _progressBarHorizontalPadding = 24.w;
  static final double _titleTopSpacing = 20.h;
  static final double _addressSectionTopSpacing = 24.h;
  static final double _cartItemsTopSpacing = 24.h;
  static final double _addressTabSpacing = 12.w;
  static final double _cartItemSpacing = 16.w;
  static final double _cartItemListHeight = 280.h;

  // ============================================
  // Colors
  // ============================================
  static const Color _backgroundColor = Color(0xFFF8F8F8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Progress bar
            _buildProgressBar(),
            SizedBox(height: _titleTopSpacing),
            // Screen title
            _buildTitle(),
            SizedBox(height: _addressSectionTopSpacing),
            // Address selection tabs
            _buildAddressTabs(),
            SizedBox(height: _cartItemsTopSpacing),
            // Cart items horizontal list
            _buildCartItems(),
          ],
        ),
      ),
      // Bottom checkout section
      bottomNavigationBar: CartSummarySection(
        subtotal: CartData.subtotal,
        shipping: CartData.shipping,
        total: CartData.total,
        buttonText: CartData.checkoutButtonText,
        onCheckout: () {
          // TODO: Implement checkout logic
        },
      ),
    );
  }

  /// Builds the gradient progress bar at the top
  Widget _buildProgressBar() {
    return Padding(
      padding: EdgeInsets.only(
        left: _progressBarHorizontalPadding,
        right: _progressBarHorizontalPadding,
        top: _progressBarTopPadding,
      ),
      child: Container(
        height: _progressBarHeight,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColors.gradientFirstColor,
              AppColors.gradientSecondColor,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(3.r),
        ),
      ),
    );
  }

  /// Builds the screen title
  Widget _buildTitle() {
    return Text(
      CartData.screenTitle,
      style: AppTextStyles.title.copyWith(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  /// Builds the address selection tabs row
  Widget _buildAddressTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: Row(
        children: [
          // First address (active)
          AddressTab(
            title: CartData.addresses[0]['title'] as String,
            subtitle: CartData.addresses[0]['subtitle'] as String,
            isActive: CartData.addresses[0]['isActive'] as bool,
            icon: Icons.home_outlined,
          ),
          SizedBox(width: _addressTabSpacing),
          // Second address (inactive)
          AddressTab(
            title: CartData.addresses[1]['title'] as String,
            subtitle: CartData.addresses[1]['subtitle'] as String,
            isActive: CartData.addresses[1]['isActive'] as bool,
            icon: Icons.work_outline,
          ),
          SizedBox(width: _addressTabSpacing),
          // Add address button
          const AddAddressButton(),
        ],
      ),
    );
  }

  /// Builds the horizontal scrollable cart items list
  Widget _buildCartItems() {
    return SizedBox(
      height: _cartItemListHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        itemCount: CartData.cartItems.length,
        itemBuilder: (context, index) {
          final item = CartData.cartItems[index];
          return Padding(
            padding: EdgeInsets.only(
              right: index < CartData.cartItems.length - 1
                  ? _cartItemSpacing
                  : 0,
            ),
            child: CartItemCard(
              imagePath: item['imagePath'] as String,
              name: item['name'] as String,
              description: item['description'] as String,
              price: item['price'] as double,
              quantity: item['quantity'] as int,
              onDelete: () {
                // TODO: Implement delete logic
              },
              onIncrement: () {
                // TODO: Implement increment logic
              },
              onDecrement: () {
                // TODO: Implement decrement logic
              },
            ),
          );
        },
      ),
    );
  }
}
