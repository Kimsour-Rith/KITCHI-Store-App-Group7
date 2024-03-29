import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:multi_store_app/auth/customer_login.dart';
import 'package:multi_store_app/auth/customer_sigup.dart';
import 'package:multi_store_app/auth/supplier_login.dart';
import 'package:multi_store_app/auth/supplier_signup.dart';
import 'package:multi_store_app/providers/stripe_id.dart';
import 'package:multi_store_app/screens/main_screens/customer_home.dart';
import 'package:multi_store_app/screens/main_screens/welcom_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:multi_store_app/providers/cart_provider.dart';
import 'package:multi_store_app/providers/whistlist_provider.dart';
import 'package:provider/provider.dart';
import 'screens/main_screens/supplier_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Cart()),
    ChangeNotifierProvider(create: (_) => Wish()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen': ((context) => const WelcomeScreen()),
        '/customer_home': ((context) => const CustomerHomeScreen()),
        '/supplier_home': ((context) => const SupplierHomeScreen()),
        '/customer_signup': ((context) => const CustomerRegister()),
        '/customer_login': ((context) => const CustomerLogin()),
        '/supplier_signup': ((context) => const SupplierRegister()),
        '/supplier_login': ((context) => const SupplierLogin()),
      },
    );
  }
}
