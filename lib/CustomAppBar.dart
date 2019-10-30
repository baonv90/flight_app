import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];
  final bottomNavigationBarStyle = TextStyle(fontSize: 11, color: Colors.black);

  CustomAppBar() {
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.home, color: Colors.black,),
        title: Text('Explore', style: bottomNavigationBarStyle)
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite, color: Colors.black,),
        title: Text('WatchList', style: bottomNavigationBarStyle)
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.local_offer, color: Colors.black,),
        title: Text('Deals', style: bottomNavigationBarStyle)
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications, color: Colors.black,),
        title: Text('Notifications', style: bottomNavigationBarStyle)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: bottomBarItems,
      type: BottomNavigationBarType.fixed,
    );
  }
}