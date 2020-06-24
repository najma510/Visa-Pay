import 'package:VisaPay/screens/card_details.dart';
import 'package:VisaPay/screens/merchant_details.dart';
import 'package:VisaPay/screens/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:VisaPay/screens/welcome_screen.dart';
import 'package:VisaPay/screens/login_screen.dart';
import 'package:VisaPay/screens/registration_screen.dart';

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
      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen':(context)=> WelcomeScreen(),
        'login_screen':(context)=> LoginScreen(),
        'registration_screen':(context)=> RegistrationScreen(),
        'merchant_details':(context)=> MerchantScreen(),
        'card_details':(context)=> CardScreen(),
        'transaction_screen':(context)=> TransactionScreen(),
      },
    );
  }
}
