import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/home_screen_2/home_screen2.dart';
import 'package:flutter_tutorial/home_screens.dart';
import 'package:flutter_tutorial/models/phone_number.dart';
import 'package:flutter_tutorial/models/phone_number_entity.dart';
import 'package:flutter_tutorial/service/fire_storage_service.dart';
import 'package:flutter_tutorial/service/isar_service.dart';

class InputPhoneNumber extends StatefulWidget {
  const InputPhoneNumber({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _InputPhoneNumberState();
}

class _InputPhoneNumberState extends State<InputPhoneNumber> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.pop(context); //Chọn 1 trong 2
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  child: SvgPicture.asset(
                    "assets/vectors/ic_arrow_left.svg",
                  ),
                ),
              ),
              const SizedBox(height: 98),
              const Center(
                child: Text(
                  "Enter Your Phone Number",
                  style: TextStyle(
                    color: Color(0xFF0F1828),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 36,
                      width: 74,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.yellow, // Color(0xFFF7F7FC),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),

                    ///Bật bàn phím trên máy ảo: Ctrl + K
                    Expanded(
                      child: Container(
                        height: 36,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F7FC),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: TextStyle(
                              color: Color(0xFFADB5BD),
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () async {
                  //* Use isar
                  // final isarService = IsarService();
                  // final newPhone = PhoneNumberEntity(
                  //   phoneNumber: controller.text,
                  // );
                  // final result = await isarService.createPhoneNumber(newPhone);
                  // if (result) {
                  //   if (context.mounted) {
                  //     Navigator.of(context).pushAndRemoveUntil(
                  //       MaterialPageRoute(
                  //         builder: (context) => const HomeScreen2(),
                  //       ),
                  //       (Route<dynamic> route) => false,
                  //     );
                  //   }
                  // }
                  //* Use firebase
                  try {
                    final fireStorageService = FireStorageService();
                    final newPhone = PhoneNumber(
                      phone: controller.text,
                    );
                    await fireStorageService.createPhoneNumber(newPhone);
                    if (context.mounted) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen2(),
                          ),
                          (Route<dynamic> route) => false);
                    }
                  } catch (e) {
                    print("Loi them data");
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 18,
                    bottom: 20,
                    left: 24,
                    right: 24,
                  ),
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFF002ED3),
                  ),
                  child: const Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () => {
                Navigator.of(context).pop(),
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SvgPicture.asset("assets/vectors/ic_arrow_left.svg"),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.yellow,
                    child: const Text(
                      "Enter your Phone Number",
                      style: TextStyle(
                          color: Color(0xFF0F1829),
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(),
                    child: Text(
                      "Please confirm your country code "
                      "and enter your phone number",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        color: Color(0xFF0F1829),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(4)),
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Phone number",
                          hintStyle:
                              TextStyle(color: Color(0xFFADB5DD), fontSize: 12),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
