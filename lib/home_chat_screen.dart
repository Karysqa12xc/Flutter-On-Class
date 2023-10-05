// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomeChatScreen extends StatefulWidget {
  const HomeChatScreen({Key? key}) : super(key: key);

  @override
  State<HomeChatScreen> createState() => _HomeChatScreenState();
}

class _HomeChatScreenState extends State<HomeChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: ListView.separated(
          itemCount: users.length,
          padding: const EdgeInsets.only(top: 5),
          separatorBuilder: (context, index){
            return Container(
              color: Colors.grey,
              height: 1,
              margin: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 24,
              ),
            );
          },
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 4,
                left: 24,
                right: 24,
                top: 2,
              ),
              
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 12,
                    ),
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Center(
                          child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage("${users[index].avatar}"),
                          ),
                        ),
                      )),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('${users[index].userName}'),
                      Padding(padding: EdgeInsets.only(top: 4)),
                      Text('${users[index].status}', 
                      style: const TextStyle(
                          color: Color.fromARGB(255, 236, 226, 201),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                      ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

//* ListView: Đưa các phần tử on có cấu trúc khác nhau vào và có thể
//* cuộn được
//* ListView.builder: gen ra 1 danh sách các phần tử giống nhau
//* ListView.separated: gen ra 1 danh sánh các phần tử giônhs nhau
//* và có thể setting thêm khoảng cách giữa các phần tử
class UserEntity {
  final String? avatar;
  final String? userName;
  final String? status;
  UserEntity({
    this.avatar,
    this.userName,
    this.status,
  });
}

List<UserEntity> users = [
  UserEntity(
      avatar:
          "https://static.vecteezy.com/system/resources/previews/011/459/669/original/people-avatar-icon-png.png",
      userName: "Nam Hoang",
      status: "Online"),
  UserEntity(
      avatar:
          "https://cdn.icon-icons.com/icons2/2643/PNG/512/avatar_female_woman_person_people_white_tone_icon_159360.png",
      userName: "Long Toc Do",
      status: "Online"),
  UserEntity(
      avatar:
          "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/avatar-icon.png",
      userName: "Tan Hoang",
      status: "Online"),
];
