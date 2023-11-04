import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/home_screen_2/home_screen2.dart';
import 'package:flutter_tutorial/input_phone_number.dart';
import 'package:flutter_tutorial/service/isar_service.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: "Home Page",
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    _initialPage();
    super.initState();
  }

  void _initialPage() async {
    await Future.delayed(const Duration(seconds: 3));
    final isarService = IsarService();
    final phones = await isarService.getAllPhoneNumbers();
    if (phones.isNotEmpty) {
      if (context.mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomeScreen2(),
          ),
        );
      }
    } else {
      if (context.mounted) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const InputPhoneNumber(),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 20),
              child: Image.asset('assets/images/img_background.png')),
          Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.0),
            child: Text(
              "Connect easily with your family "
              "and friends over countries",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F1828),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          const Text(
            "Terms & Privacy Policy",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0F1828),
            ),
          ),
          InkWell(
            onTap: () async {
              final isarService = IsarService();
              final phones = await isarService.getAllPhoneNumbers();
              if (phones.isNotEmpty) {
                if (context.mounted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen2(),
                    ),
                  );
                }
              } else {
                if (context.mounted) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const InputPhoneNumber(),
                  ));
                }
              }
            },
            child: Container(
              margin: const EdgeInsets.only(
                top: 11,
                bottom: 10,
              ),
              height: 52,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xFF002DE3),
              ),
              child: const Center(
                child: Text(
                  "Start Messaging",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
