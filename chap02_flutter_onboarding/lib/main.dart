import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

//SharedPreferences 인스턴스를 어디서든 접근 가능하도록 전역 변수로 선언
// late : 나중에 꼭 값을 할당해준다는 의미
late SharedPreferences prefs;

void main() async {
  // main() 함수에서 async를 쓰려면 필요
  WidgetsFlutterBinding.ensureInitialized();

  //Shared_preferences 인스턴스 생성
  prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    bool isOnboarded = prefs.getBool('isOnboarded') ?? false;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'BagelFatOne'),
      title: 'Who Am I',
      home: isOnboarded ? HomePage() : TestScreen(),
    );
  }
}

class TestScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: '현재의 나',
      titleTextStyle: TextStyle(
          color: Colors.purple,
          fontSize: 35,
          fontFamily: 'BagelFatOne',
          fontWeight: FontWeight.w100),
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/images/현재.jpg',
    ),
    Introduction(
      title: '수료 후의 나',
      titleTextStyle: TextStyle(
          color: Colors.purple,
          fontSize: 35,
          fontFamily: 'Dongle',
          fontWeight: FontWeight.w100),
      subTitle: 'Your order will be immediately collected and',
      imageUrl: 'assets/images/수료.jpg',
    ),
    Introduction(
      title: '10년 후의 나',
      titleTextStyle: TextStyle(
          color: Colors.purple,
          fontSize: 35,
          fontFamily: 'NanumBrushScript',
          fontWeight: FontWeight.w100),
      subTitle: 'Pick up delivery at your door and enjoy groceries',
      imageUrl: 'assets/images/10년.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
        prefs.setBool('isOnboarded', true);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ), //MaterialPageRoute
        );
      },
      // foregroundColor: Colors.red,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'), centerTitle: true, actions: [
        IconButton(
          onPressed: () {
            prefs.clear();
          },
          icon: Icon(Icons.delete),
        )
      ]),
      body: Center(
        child: Text(
          'Welcome to Home Page!',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
