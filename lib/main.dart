import 'package:VisaPay/screens/card_screen.dart';
import 'package:VisaPay/screens/merchant_screen.dart';
import 'package:VisaPay/screens/link_screen.dart';
import 'package:VisaPay/screens/qrcode_screen.dart';
import 'package:VisaPay/screens/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:VisaPay/screens/login_screen.dart';
import 'package:VisaPay/screens/registration_screen.dart';
import 'package:VisaPay/screens/root_screen.dart';

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
        'root_screen':(context)=> IntroScreen(),
        'login_screen':(context)=> LoginScreen(),
        'registration_screen':(context)=> RegistrationScreen(),
        'merchant_screen':(context)=> MerchantScreen(),
        'card_screen':(context)=> CardScreen(),
        'transaction_screen':(context)=> TransactionScreen(),
        'link_screen':(context)=> PaymentLinkScreen(),
        'qrcode_screen':(context)=> QRcodeScreen(),
      },
    );
  }
}
