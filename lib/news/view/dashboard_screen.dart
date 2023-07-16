import 'package:flutter/material.dart';
import 'package:flutter_news/news/view/widgets/get_screen.dart';
import 'package:flutter_news/news/view/widgets/home_drawer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {
  int selectedIndex = 0;
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey, // Assign the GlobalKey to the Scaffold
          bottomNavigationBar: bottomNavigationBar(),
          body: getScreen(selectedIndex),
          endDrawer: const HomeDrawer()),
    );
  }

  bottomNavigationBar() {
    const Color bottomNavigationBarColor = Color(0xFF598BDE);
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: bottomNavigationBarColor,
      onTap: (index) {
        debugPrint("$index");

        if (index == 3) {
          _scaffoldKey.currentState
              ?.openEndDrawer(); // Open the drawer using the GlobalKey
        } else {
          setState(() {
            selectedIndex = index;
          });
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Padding(
              padding: EdgeInsets.only(top: 9.0),
              child: Icon(Icons.calendar_today)),
          label: "News",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
        BottomNavigationBarItem(
            icon: Icon(Icons.sports_cricket), label: "Sports"),
        BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward_sharp), label: "More News"),
      ],
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
    );
  }

  newsDrawer() {
    return const HomeDrawer();
  }
}
