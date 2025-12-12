/// Static data for Cart Screen
/// Contains all mock data for addresses, cart items, and summary
class CartData {
  CartData._();

  // ============================================
  // Screen Constants
  // ============================================
  static const String screenTitle = 'Carrito';
  static const String checkoutButtonText = 'Realizar compra';

  // ============================================
  // Address Data
  // ============================================
  static const List<Map<String, dynamic>> addresses = [
    {
      'id': '1',
      'title': 'Mi casa',
      'subtitle': 'Dirección de ejemplo',
      'isActive': true,
    },
    {
      'id': '2',
      'title': 'Mi Trabajo',
      'subtitle': 'Dirección de ejemplo',
      'isActive': false,
    },
  ];

  // ============================================
  // Cart Items Data
  // ============================================
  static const List<Map<String, dynamic>> cartItems = [
    {
      'id': '1',
      'name': 'Big Burger Queso',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi, atque eaque elus',
      'imagePath': 'assets/images/burger-1.png',
      'price': 20.0,
      'quantity': 2,
    },
    {
      'id': '2',
      'name': 'Big Burger',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi,',
      'imagePath': 'assets/images/burger-2.png',
      'price': 20.0,
      'quantity': 1,
    },
  ];

  // ============================================
  // Summary Data
  // ============================================
  static const double subtotal = 85.00;
  static const String shipping = 'Gratis';
  static const double total = 85.00;

  // ============================================
  // Labels
  // ============================================
  static const String subtotalLabel = 'SubTotal:';
  static const String shippingLabel = 'Envío:';
  static const String totalLabel = 'Total:';
}
