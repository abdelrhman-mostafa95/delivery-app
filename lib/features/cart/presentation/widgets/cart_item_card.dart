import 'package:delivery_app/core/theme/app_colors.dart';
import 'package:delivery_app/core/theme/app_text_styles.dart';
import 'package:delivery_app/features/cart/presentation/widgets/quantity_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Cart item card widget displaying product details
/// Matches the design with circular dark image background,
/// delete button, product info, quantity controls, and price
class CartItemCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final VoidCallback? onDelete;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const CartItemCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    this.onDelete,
    this.onIncrement,
    this.onDecrement,
  });

  // ============================================
  // Card Constants
  // ============================================
  static final double _cardWidth = 200.w;
  static final double _cardPadding = 16.w;
  static final double _cardBorderRadius = 20.r;

  // ============================================
  // Image Constants
  // ============================================
  static final double _imageContainerSize = 100.w;
  static final double _imageSize = 90.w;
  static const Color _imageBackgroundColor = Color(0xFF2D2D2D);

  // ============================================
  // Delete Button Constants
  // ============================================
  static final double _deleteButtonSize = 32.w;
  static final double _deleteIconSize = 18.sp;
  static final double _deleteButtonTopOffset = -8.h;
  static final double _deleteButtonRightOffset = 30.w;

  // ============================================
  // Spacing Constants
  // ============================================
  static final double _spacingAfterImage = 16.h;
  static final double _spacingAfterName = 6.h;
  static final double _spacingAfterDescription = 16.h;

  // ============================================
  // Shadow Constants
  // ============================================
  static final double _shadowBlurRadius = 15.r;
  static final double _shadowSpreadRadius = 2.r;
  static const Offset _shadowOffset = Offset(0, 4);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _cardWidth,
      padding: EdgeInsets.all(_cardPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_cardBorderRadius),
        border: Border.all(
          color: AppColors.gradientSecondColor.withOpacity(0.3),
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: _shadowBlurRadius,
            spreadRadius: _shadowSpreadRadius,
            offset: _shadowOffset,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildImageSection(),
          SizedBox(height: _spacingAfterImage),
          _buildProductName(),
          SizedBox(height: _spacingAfterName),
          _buildDescription(),
          SizedBox(height: _spacingAfterDescription),
          _buildBottomSection(),
        ],
      ),
    );
  }

  /// Builds the image section with circular dark background and delete button
  Widget _buildImageSection() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // Dark circular background with product image
        Container(
          width: _imageContainerSize,
          height: _imageContainerSize,
          decoration: const BoxDecoration(
            color: _imageBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Center(
              child: Image.asset(
                imagePath,
                width: _imageSize,
                height: _imageSize,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.fastfood, size: 40.sp, color: Colors.white),
              ),
            ),
          ),
        ),
        // Delete button positioned top-right
        Positioned(
          top: _deleteButtonTopOffset,
          right: _deleteButtonRightOffset,
          child: GestureDetector(
            onTap: onDelete,
            child: Container(
              width: _deleteButtonSize,
              height: _deleteButtonSize,
              decoration: const BoxDecoration(
                color: AppColors.buttonRedColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.delete_outline,
                color: Colors.white,
                size: _deleteIconSize,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the product name text
  Widget _buildProductName() {
    return Text(
      name,
      style: AppTextStyles.sectionTitle.copyWith(
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Builds the product description text
  Widget _buildDescription() {
    return Text(
      description,
      style: AppTextStyles.popularSecondaryElement.copyWith(
        fontSize: 8.sp,
        height: 1.3,
      ),
      textAlign: TextAlign.center,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Builds the bottom section with quantity controls and price
  Widget _buildBottomSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        QuantityControl(
          quantity: quantity,
          onDecrement: onDecrement,
          onIncrement: onIncrement,
        ),
        Text(
          '\$${price.toInt()}',
          style: AppTextStyles.sectionsPrice.copyWith(
            color: AppColors.gradientSecondColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
