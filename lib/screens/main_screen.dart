
import 'package:flutter/material.dart';
import 'package:mock_player/enum/bottom_nav_item.dart';
import 'package:mock_player/models/track_model.dart';
import 'package:mock_player/widgets/tab_navigator.dart';
import 'package:get/get.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();

}

class MainScreenState extends State<MainScreen> {
  BottomNavItem selectedItem = BottomNavItem.one;

  final Map<BottomNavItem, GlobalKey<NavigatorState>> navigatorKeys = {
    BottomNavItem.one: GlobalKey<NavigatorState>(),
    BottomNavItem.two: GlobalKey<NavigatorState>(),
    BottomNavItem.three: GlobalKey<NavigatorState>(),
  };

  final Map<BottomNavItem, IconData> items = const {
    BottomNavItem.one: Icons.home,
    BottomNavItem.two: Icons.search,
    BottomNavItem.three: Icons.play_circle_outline,
  };

  List<Track> songs = Track.trackStatic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const CustomAppBar(),
      body: WillPopScope(
        onWillPop: () async {
          // This is when you want to remove all the pages from the
          // stack for the specific BottomNav item.
          navigatorKeys[selectedItem]
              ?.currentState
              ?.popUntil((route) => route.isFirst);

          return false;
        },
        child: Stack(
          children: items
              .map(
                (item, _) => MapEntry(
                  item,
                  _buildOffstageNavigator(item, item == selectedItem),
                ),
              )
              .values
              .toList(),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed('/track', arguments: songs[0]);
        },
        backgroundColor: Colors.deepPurple.shade800,
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0, top: 10.0, bottom: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        songs[0].artwork,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          songs[0].name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          songs[0].artist_name,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 100),
            GestureDetector(
              onTap: () {
              },
              child: Stack(
                alignment: Alignment.centerRight,
                //alignment:new Alignment(x, y)
                children: <Widget>[
                  //const CircularProgressIndicator(),
                  Positioned(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xff293942),
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.deepPurple.shade400,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: BottomNavItem.values.indexOf(selectedItem),
          onTap: (index) {
            final currentSelectedItem = BottomNavItem.values[index];
            if (selectedItem == currentSelectedItem) {
              navigatorKeys[selectedItem]
                  ?.currentState
                  ?.popUntil((route) => route.isFirst);
            }
            setState(() {
              selectedItem = currentSelectedItem;
            });
          },
          items: items
              .map((item, icon) => MapEntry(
                  item.toString(),
                  BottomNavigationBarItem(
                      label: '',
                      icon: Icon(
                        icon,
                        size: 30.0,
                      ))))
              .values
              .toList(),
          type: BottomNavigationBarType.fixed),
    );
  }

  Widget _buildOffstageNavigator(BottomNavItem currentItem, bool isSelected) {
    return Offstage(
      offstage: !isSelected,
      child: TabNavigator(
        navigatorKey: navigatorKeys[currentItem]!,
        item: currentItem,
      ),
    );
  }
}


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff293942),
      elevation: 0,
      title: const Text("RadioHead"),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1576525865260-9f0e7cfb02b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80"),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}