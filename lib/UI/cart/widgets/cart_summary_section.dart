import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartSummarySection extends StatelessWidget {
  final double subtotal;
  final String shipping;
  final double total;
  final String buttonText;
  final VoidCallback? onCheckout;

  const CartSummarySection({
    super.key,
    required this.subtotal,
    required this.shipping,
    required this.total,
    required this.buttonText,
    this.onCheckout,
  });

  static final double _containerPadding = 24.w;
  static final double _containerTopRadius = 32.r;

  static final double _shadowBlurRadius = 25.r;
  static const Offset _shadowOffset = Offset(0, -8);

  static final double _rowSpacing = 10.h;
  static final double _totalRowTopSpacing = 16.h;
  static final double _buttonTopSpacing = 24.h;

  static final double _buttonHeight = 56.h;
  static final double _buttonBorderRadius = 20.r;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(_containerPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_containerTopRadius),
          topRight: Radius.circular(_containerTopRadius),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: _shadowBlurRadius,
            offset: _shadowOffset,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPriceRow(
            label: 'SubTotal:',
            value: '\$${subtotal.toStringAsFixed(2)} usd',
            isTotal: false,
            style: AppTextStyles.categoryElements,
          ),
          SizedBox(height: _rowSpacing),
          _buildPriceRow(
            label: 'Envío:',
            value: shipping,
            isTotal: false,
            isShipping: true,
            style: AppTextStyles.categoryElements,
          ),
          SizedBox(height: _totalRowTopSpacing),
          _buildPriceRow(
            label: 'Total:',
            value: '\$${total.toStringAsFixed(2)} usd',
            isTotal: true,
            style: AppTextStyles.sectionTitle,
          ),
          SizedBox(height: _buttonTopSpacing),
          _buildCheckoutButton(),
        ],
      ),
    );
  }

  Widget _buildPriceRow({
    required String label,
    required String value,
    required bool isTotal,
    bool isShipping = false,
    required TextStyle style,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(value, style: style),
      ],
    );
  }

  Widget _buildCheckoutButton() {
    return GestureDetector(
      onTap: onCheckout,
      child: Container(
        width: double.infinity,
        height: _buttonHeight,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColors.gradientFirstColor,
              AppColors.gradientSecondColor,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(_buttonBorderRadius),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: AppTextStyles.buttonTitle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
