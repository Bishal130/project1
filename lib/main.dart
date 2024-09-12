import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/provider/firebase_provider.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:flutter_application_1/provider/student_provider.dart';
import 'package:flutter_application_1/view/page1.dart';
import 'package:flutter_application_1/view/page2.dart';
import 'package:flutter_application_1/view/studentform.dart';
import 'package:flutter_application_1/view/user_details.dart';
import 'package:flutter_application_1/view/userform.dart';
import 'package:provider/provider.dart';

void main()async {

WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>StudentProvider(),),
        ChangeNotifierProvider(create: (context)=>ProductProvider(),),
      ChangeNotifierProvider(create: (context)=>FireBaseProvider(),),
      ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: RestaurantDetailPage()
      ),
    );
  }
}