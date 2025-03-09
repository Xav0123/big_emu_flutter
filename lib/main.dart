import 'package:flutter/material.dart';
import 'games.dart';
import 'dashboard.dart';

void main() {
  runApp(const ConsoleSelction());
}


class ConsoleSelction extends StatefulWidget {
  const ConsoleSelction({super.key});

  @override
  State<ConsoleSelction> createState() => _ConsoleSelctionState();
}

class _ConsoleSelctionState extends State<ConsoleSelction> {

int _currentPageIndex = 0;

  final List<Widget> _pages = [Dashboard(allGames.where((e) => e.name.contains(RegExp(r'.nes|.sfc'))).toList()), Dashboard(allGames.where((e) => e.name.contains(RegExp(r'.z64'))).toList()),
   Dashboard(allGames.where((e) => e.name.contains(RegExp(r'.gb'))).toList()), Dashboard(allGames.where((e) => e.name.contains(RegExp(r'.nds'))).toList())];
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_currentPageIndex], // Display the selected page
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.red,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentPageIndex,
          onTap: (index) {
            setState(() {
              _currentPageIndex = index; // Update the selected page index
            });
          },
          items:  [
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/snes_icon.png", width: 40, height: 40,),
              label: 'Nes/Snes',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/nintendo64_icon3.png", width: 40, height: 40,),
              label: 'N64',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/gba_icon.png", width: 40, height: 40,),
              label: 'GBA',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/nintendods_icon2.png", width: 50, height: 50,),
              label: 'DS',
            ),
          ],
        ),
      ),
    );
  }
}


/*class MyApp extends StatefulWidget { // Currently not used, in the future it could be used to navigate to other pages
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _currentPageIndex = 0;

  final List<Widget> _pages = [const Dashboard()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_currentPageIndex], // Display the selected page
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.amber,
          unselectedItemColor: Colors.blue[700],
          currentIndex: _currentPageIndex,
          onTap: (index) {
            setState(() {
              _currentPageIndex = index; // Update the selected page index
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            )
          ],
        ),
      ),
    );
  }
}
*/