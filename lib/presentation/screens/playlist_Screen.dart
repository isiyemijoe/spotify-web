import 'package:flutter/material.dart';
import 'package:flutter_web_desktop/domain/model/playlist.dart';
import 'package:flutter_web_desktop/presentation/widgets/widgets.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;
  PlaylistScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 140,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: const Icon(Icons.chevron_left),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: const Icon(Icons.chevron_right),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(
                  primary: Theme.of(context).iconTheme.color),
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle_outlined,
                size: 30,
              ),
              label: const Text("Joseph Isiyemi")),
          SizedBox(
            width: 8.0,
          ),
          IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 30,
              ),
              onPressed: () {}),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [0.0, 0.3],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xffAF1018),
                  Theme.of(context).backgroundColor
                ])),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 10),
              child: PlaylistHeader(playlist: widget.playlist),
            ),
            Expanded(
              child: Scrollbar(
                  isAlwaysShown: true,
                  controller: _scrollController,
                  child: ListView(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10.0),
                    children: [TrackList(tracks: widget.playlist.songs)],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
