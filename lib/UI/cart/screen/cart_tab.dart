import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:delivery_app/UI/cart/data/cart_data.dart';
import 'package:delivery_app/UI/cart/widgets/add_address_button.dart';
import 'package:delivery_app/UI/cart/widgets/address_tab.dart';
import 'package:delivery_app/UI/cart/widgets/cart_item_card.dart';
import 'package:delivery_app/UI/cart/widgets/cart_summary_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  static final double _horizontalPadding = 24.w;
  static final double _addressSectionTopSpacing = 24.h;
  static final double _cartItemsTopSpacing = 24.h;
  static final double _addressTabSpacing = 12.w;
  static final double _cartItemSpacing = 16.w;
  static final double _cartItemListHeight = 350.h;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTitle(),
                SizedBox(height: _addressSectionTopSpacing),
                _buildAddressTabs(),
                SizedBox(height: _cartItemsTopSpacing),
                _buildCartItems(),
              ],
            ),
          ),
        ),
        CartSummarySection(
          subtotal: CartData.subtotal,
          shipping: CartData.shipping,
          total: CartData.total,
          buttonText: CartData.checkoutButtonText,
          onCheckout: () {},
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(CartData.screenTitle, style: AppTextStyles.title);
  }

  Widget _buildAddressTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: Row(
        children: [
          AddressTab(
            title: CartData.addresses[0]['title'] as String,
            subtitle: CartData.addresses[0]['subtitle'] as String,
            isActive: CartData.addresses[0]['isActive'] as bool,
            iconPath: 'assets/icons/Home.svg',
          ),
          SizedBox(width: _addressTabSpacing),
          AddressTab(
            title: CartData.addresses[1]['title'] as String,
            subtitle: CartData.addresses[1]['subtitle'] as String,
            isActive: CartData.addresses[1]['isActive'] as bool,
            iconPath: 'assets/icons/Home.svg',
          ),
          SizedBox(width: _addressTabSpacing),
          const AddAddressButton(),
        ],
      ),
    );
  }

  Widget _buildCartItems() {
    return SizedBox(
      height: _cartItemListHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        padding: EdgeInsets.only(
          left: _horizontalPadding,
          right: _horizontalPadding,
          top: 16.h,
        ),
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
            ),
          );
        },
      ),
    );
  }
}
