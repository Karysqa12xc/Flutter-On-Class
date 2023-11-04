import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/home_screen_2/home_screen2.dart';
import 'package:flutter_tutorial/input_phone_number.dart';
import 'package:flutter_tutorial/models/phone_number_entity.dart';
import 'package:flutter_tutorial/service/isar_service.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            final isarService = IsarService();
            final phones = await isarService.getAllPhoneNumbers();
            if (phones.isNotEmpty) {
              final result = await isarService.deletePhoneNumber(phones[0]);
              if (result) {
                if (context.mounted) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const InputPhoneNumber(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                }
              } else {
                if (context.mounted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen2(),
                    ),
                    
                  );
                }
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
                "Đăng xuất",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
