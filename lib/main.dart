import 'package:flutter/material.dart';
import 'package:task_managment/ProjectsPage/ProjectsPage.dart';
import 'package:task_managment/TasksPage/TasksPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onIndexChange(int index) {
    setState(() {
      this._selectedIndex = index;
    });
  }

  final List<Widget> _Pages = [
    ProjectsPage(),
    TasksPage(
      Goback: (int index) {
        print(index);
      },
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._Pages.elementAt(this._selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 1,
        type: BottomNavigationBarType.shifting,
        iconSize: 25,
        selectedItemColor: Color.fromARGB(255, 123, 0, 245),
        unselectedItemColor: Colors.grey.shade400,
        currentIndex: this._selectedIndex,
        onTap: this._onIndexChange,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_rounded), label: "Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_outlined),
              label: "Notifcation"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded), label: "Search"),
        ],
      ),
    );
  }
}
