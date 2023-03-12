import 'package:flutter/material.dart';
import 'package:untitled/screens/chats.dart';
import 'package:untitled/screens/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          titleTextStyle: Theme.of(context)
              .textTheme
              .apply(
                  bodyColor: Colors.green.shade50,
                  displayColor: Colors.green.shade50)
              .headline6,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.green,
          selectedItemColor: Colors.green.shade50,
          unselectedItemColor: Colors.green.shade900,
        ),
        bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.green),
        cardColor: Colors.green,
        scaffoldBackgroundColor: Colors.green.shade100,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.green.shade50,
              displayColor: Colors.green.shade50,
            ),
        textSelectionTheme: TextSelectionThemeData(
            selectionColor: Colors.green.shade200,
            selectionHandleColor: Colors.green.shade200
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;
  final pages = [const ChatsScreen(), const ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(pageIndex == 0 ? "Chats" : "Profile")),
        body: pages[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          enableFeedback: false,
          onTap: (int selection) {
            setState(() {
              pageIndex = selection;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ],
        ));
  }
}
