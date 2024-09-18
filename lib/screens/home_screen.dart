import 'package:CodinGoat_flutter/main.dart';
import 'package:CodinGoat_flutter/screens/MessageScreen.dart';
import 'package:CodinGoat_flutter/screens/custom_appbar.dart';
import 'package:CodinGoat_flutter/screens/dashboard_screen.dart';
import 'package:CodinGoat_flutter/screens/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class HomeScreen extends StatefulWidget {
    static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  int currentPageIndex = 0;

  late AnimationController _loadingController;
static const headerAniInterval = Interval(.1, .3, curve: Curves.easeOut);

@override
void initState() {
  super.initState();
  _loadingController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1250),
  );
  final MultiSelectController _multiselectController = MultiSelectController();

}

@override
void dispose() {
  _loadingController.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(loadingController: _loadingController,headerAniInterval: headerAniInterval),
      bottomNavigationBar: NavigationBar(
        backgroundColor: theme.primaryColor.withOpacity(.1),
        
        onDestinationSelected: (int index) {
          setState(() { 
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Messages',
          ),
        ],
      ),
      body: <Widget>[
        DashboardScreen(),
        /// Notifications page
        NotificationsScreen(),

        /// Messages page
        Messagescreen(),
      ]
      [currentPageIndex],
    );
  }
  }
