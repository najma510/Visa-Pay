import 'package:VisaPay/screens/card_screen.dart';
import 'package:VisaPay/screens/merchant/merchant_screen.dart';
import 'package:VisaPay/screens/merchant/link_screen.dart';
import 'package:VisaPay/screens/merchant/qrcode_screen.dart';
import 'package:VisaPay/screens/merchant/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:VisaPay/screens/login_screen.dart';
import 'package:VisaPay/screens/registration_screen.dart';
import 'package:VisaPay/screens/root_screen.dart';
import 'package:VisaPay/screens/consumer/consumer_screen.dart';
import 'package:VisaPay/screens/consumer/locate_merchant.dart';
import 'package:VisaPay/screens/consumer/order_history.dart';
import 'package:VisaPay/screens/consumer/place_order.dart';
import 'package:VisaPay/screens/consumer/payment_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: 'root_screen',
      routes: {
        'root_screen': (context) => IntroScreen(),
        'login_screen': (context) => LoginScreen(),
        'registration_screen': (context) => RegistrationScreen(),
        'merchant_screen': (context) => MerchantScreen(),
        'card_screen': (context) => CardScreen(),
        'transaction_screen': (context) => TransactionScreen(),
        'link_screen': (context) => PaymentLinkScreen(),
        'qrcode_screen': (context) => QRcodeScreen(),
        'consumer_screen': (context) => ConsumerScreen(),
        'locate_merchant': (context) => LocateMerchantScreen(),
        'order_history': (context) => OrderHistoryScreen(),
        'place_order': (context) => PlaceOrderScreen(),
        'payment_screen': (context) => PaymentScreen(),
      },
    );
  }
}
