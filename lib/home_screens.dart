import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/ContactScreen.dart';
import 'package:flutter_tutorial/chat_screen.dart';
import 'package:flutter_tutorial/dot_widget.dart';
import 'package:flutter_tutorial/home_chat_screen.dart';
import 'package:flutter_tutorial/more_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController controller = PageController();
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const <Widget>[
          HomeChatScreen(),
          ChatScrenn(),
          MoreScreen(),
        ],

      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/vectors/ic_contact.svg"),
                activeIcon: const Column(
                  children: [
                    Text("Contacts", 
                    style: TextStyle(fontSize: 14, 
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F1828)
                    )
                    ,),
                    SizedBox(height: 8),
                    DotWidget(),
                  ],
                ),
                label: ''
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/vectors/ic_chat.svg"),
              activeIcon: const Column(
                  children: [
                    Text("Chats", 
                    style: TextStyle(fontSize: 14, 
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F1828)
                    )
                    ,),
                    SizedBox(height: 8),
                    DotWidget(),
                  ],
                ),
                label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/vectors/ic_more.svg"),
              activeIcon: const Column(
                  children: [
                    Text("More", 
                    style: TextStyle(fontSize: 14, 
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F1828)
                    )
                    ,),
                    SizedBox(height: 8),
                    DotWidget(),
                  ],
                ),
              label: '',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: (index){
            print("Hi nam");
            setState(() {
              _selectedIndex = index;
              controller.jumpToPage(index);
            });
          },
          elevation: 5
      ),
    );
  }

}

