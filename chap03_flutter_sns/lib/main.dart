import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          'https://gratisography.com/wp-content/uploads/2024/01/gratisography-cyber-kitty-1170x780.jpg',
          //이미지 높이
          height: 400,
          //위젯의 너비를 가능한 최대로 설정
          width: double.infinity,
          //전체 프레임을 채우기 위해 사진을 확대하거나 축소함
          //사진이 프레임보다 작아도, 사진의 모양을 유지하면서 프레임의 모든 공간을 채우려고 자동으로 맞춤              fit: BoxFit.cover,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.heart),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.chat_bubble),
              color: Colors.black,
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.bookmark),
              color: Colors.black,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '3 likes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '네온과 고양이, 최고의 조합',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'March 6',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
