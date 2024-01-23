import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_player/enum/bottom_nav_item.dart';
import 'package:mock_player/models/track_model.dart';
import 'package:mock_player/widgets/tab_navigator.dart';

import '../models/playlist_model.dart';

class PlayingTrackCard extends StatelessWidget {
  PlayingTrackCard({
    super.key,
    required this.track,
  });

  final Track track;

  final Map<BottomNavItem, GlobalKey<NavigatorState>> navigatorKeys = {
    BottomNavItem.one: GlobalKey<NavigatorState>(),
    BottomNavItem.two: GlobalKey<NavigatorState>(),
    BottomNavItem.three: GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/track', arguments: track);
        // TabNavigator(
        //   navigatorKey:navigatorKeys[BottomNavItem.three]!,
        //   item: BottomNavItem.three,
        // );
      },
      child: Container(
        height: 75,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade800.withOpacity(0.6),
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(35.0),
              child: Image.network(
                track.artwork,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    track.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    track.artist_name,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.centerRight,
                //alignment:new Alignment(x, y)
                children: <Widget>[
                  const CircularProgressIndicator(),
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
    );
  }
}
