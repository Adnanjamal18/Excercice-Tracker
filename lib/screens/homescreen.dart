//import 'package:crud_app/excercisemodal/modal.dart';
import 'package:crud_app/screens/newexcercise.dart';
import 'package:crud_app/screens/profilepage.dart';
import 'package:crud_app/widgets/excercise_list/Excerciselist.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
 final List<Widget> screens = [
  ExcerciseItem(),
  ProfileScreen(),
]; 
 void _additem(){
  Navigator.of(context).push(MaterialPageRoute(builder:(context) => AddExcercise(),));
 }
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      
      appBar: AppBar(title: Text('Workout Tracker',style: TextStyle(fontWeight: FontWeight.bold),),
      actions: [IconButton(onPressed: (){}, icon: Icon(Icons.settings,color: Colors.black,))],
      backgroundColor:
       const Color.fromARGB(255, 58, 56, 56),
       shadowColor: const Color.fromARGB(255, 255, 255, 255),
       centerTitle: false,
       ),
      body: screens[_selectedIndex],
        backgroundColor: Colors.grey,
        floatingActionButton:
         _selectedIndex == 0 ? IconButton(
          onPressed: (){
            _additem();
           },
           icon: Icon(Icons.add),):null,
        bottomNavigationBar: GNav(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor:const Color.fromARGB(255, 0, 0, 0),
          tabBackgroundColor: const Color.fromARGB(255, 129, 167, 162),
          color: Colors.white,
          activeColor: const Color.fromARGB(255, 255, 255, 255),
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
           setState(() {
               _selectedIndex =index ;
            });
          },
          tabs: [
          GButton(icon: Icons.home,text: 'home',),
          GButton(icon: Icons.person,text: 'profile',)
        ] 
        ),
    );
  }
}