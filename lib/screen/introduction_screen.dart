import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
  
  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'Hello World!!!!!!',
      body: 'งอมแล้ว งอมอีก งอมต่อ by java',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('Here We Go Again'),
        ),
      ),
      image: Image.network(
          'https://media.makeameme.org/created/looking-for-java.jpg'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'อะจ๊ะเอ๋ตัวเอง',
      body:
          'วันนี้เป็นไงบ้างละสบายดีมั้ยออกไปเข้าวัดธรรมะแท้ไม่มีคำปลอบใจอะจุ๊กกรู๊',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('จารย์แดง'),
        ),
      ),
      image: Image.network(
          'https://cdn.blerp.com/thumbnails/10132e40-218a-11ee-8c08-5128a26885f3'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'เราทุกคนเป็นลิง',
      body: 'อุอะ อุอะ อุอะ อุอะ อุอะ อุอะ อุอะ อุอะ อุอะ อุอะ อะจ๊ากก',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('ลิงจั๊กๆ ลักขโมยนะ'),
        ),
      ),
      image: Image.network(
          'https://media.istockphoto.com/id/119838172/photo/close-up-of-mixed-breed-monkey-between-chimpanzee-and-bonobo-smiling.jpg?s=612x612&w=0&k=20&c=k48IdB7w0kJHFhtWcYIlKQxqxENXJwZ66qAcX_BuBjg='),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On boat ding'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: pages,
        showSkipButton: true,
        skip: const Text('Skip'),
        showDoneButton: true,
        done: const Text('Done'),
        showNextButton: true,
        next: const Icon(Icons.arrow_forward, size: 25),
        onDone: () => onDone(context),
        curve: Curves.bounceOut,
        dotsDecorator: const DotsDecorator(
          size: Size(15, 15),
          color: Colors.purpleAccent,
          activeColor: Colors.greenAccent,
          activeSize: Size.square(20),
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}
