import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputPhoneNumber extends StatefulWidget {
  const InputPhoneNumber({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _InputPhoneNumberState();
}

class _InputPhoneNumberState extends State<InputPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 14,
                  left: 16,
                ),
                child: SvgPicture.asset("assets/vectors/ic_arrow_left.svg"),
              ),
              const SizedBox(height: 98),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                ),
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
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
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 36,
                        decoration: 
                        BoxDecoration(
                            borderRadius: BorderRadius.circular(4)
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                           vertical: 4),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "Phone number",
                            hintStyle: 
                            TextStyle(
                              color: Color(0xFFADB5DD),
                              fontSize: 12
                              ),
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
}
