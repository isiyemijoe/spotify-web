import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_desktop/domain/controller/current_track_controller.dart';
import 'package:flutter_web_desktop/theme.dart';
import 'package:flutter_web_desktop/utils/constants.dart';
import 'package:get/get.dart';

import 'presentation/screens/playlist_Screen.dart';
import 'presentation/widgets/side_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows))
    await DesktopWindow.setMinWindowSize(const Size(600, 800));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify',
      theme: theme,
      home: MyHomePage(title: 'Spotify Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = Get.put(CurrentSongController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: Row(
          children: [
            if (MediaQuery.of(context).size.width > 800) SideMenu(),
            Expanded(
                child: PlaylistScreen(
              playlist: lofihiphopPlaylist,
            ))
          ],
        )),
        Container(
            height: 86.0,
            width: double.infinity,
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Material(
                color: Colors.transparent,
                child: Row(
                  children: [
                    _TrackInfo(),
                    const Spacer(),
                    _PlayerControls(),
                    const Spacer(),
                    if (MediaQuery.of(context).size.width > 800) _MoreControls()
                  ],
                ),
              ),
            ))
      ],
    )

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class _TrackInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CurrentSongController>(builder: (controller) {
      if (controller.selectedSong.id == null) return const SizedBox.shrink();
      return Row(
        children: [
          Image.asset(
            "$IMAGE_PATH/lofigirl.jpg",
            height: 60.0,
            width: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.selectedSong.title ?? "",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                controller.selectedSong.artist ?? "",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.grey.shade200, fontSize: 12.0),
              ),
            ],
          ),
          const SizedBox(
            width: 12.0,
          ),
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {})
        ],
      );
    });
  }
}

class _PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CurrentSongController>(builder: (controller) {
      return Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.shuffle),
                onPressed: () {},
                padding: EdgeInsets.only(),
                iconSize: 20.0,
              ),
              IconButton(
                icon: const Icon(Icons.skip_previous_outlined),
                onPressed: () {},
                padding: EdgeInsets.only(),
                iconSize: 20.0,
              ),
              IconButton(
                icon: const Icon(Icons.play_circle_outline),
                onPressed: () {},
                padding: EdgeInsets.only(),
                iconSize: 34.0,
              ),
              IconButton(
                icon: const Icon(Icons.skip_next_outlined),
                onPressed: () {},
                padding: EdgeInsets.only(),
                iconSize: 20.0,
              ),
              IconButton(
                icon: const Icon(Icons.repeat),
                onPressed: () {},
                padding: EdgeInsets.only(),
                iconSize: 20.0,
              )
            ],
          ),
          const SizedBox(
            height: 4.0,
          ),
          Row(
            children: [
              Text(
                "0.00",
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Container(
                  height: 5.0,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2.5))),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                controller.selectedSong.duration ?? "0.00",
                style: Theme.of(context).textTheme.caption,
              )
            ],
          )
        ],
      );
    });
  }
}

class _MoreControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.devices_outlined),
          onPressed: () {},
          iconSize: 20,
        ),
        Row(
          children: [
            IconButton(
                icon: const Icon(Icons.volume_up_outlined), onPressed: () {}),
            Container(
              height: 5.0,
              width: 70.0,
              decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(2.5)),
            )
          ],
        ),
        IconButton(
          icon: Icon(Icons.fullscreen_outlined),
          onPressed: () {},
          //  iconSize: 20,
        ),
      ],
    );
  }
}
