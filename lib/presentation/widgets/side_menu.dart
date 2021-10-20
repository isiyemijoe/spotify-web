import 'package:flutter/material.dart';
import 'package:flutter_web_desktop/utils/constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  "$IMAGE_PATH/spotify_logo.png",
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _SideMenuTile(
            icon: Icons.home,
            title: "Home",
            onTap: () {},
          ),
          _SideMenuTile(
            icon: Icons.search,
            title: "Search",
            onTap: () {},
          ),
          _SideMenuTile(
            icon: Icons.audiotrack,
            title: "Radio",
            onTap: () {},
          ),
          SizedBox(height: 12.0),
          LibraryPlaylist()
        ],
      ),
    );
  }
}

class LibraryPlaylist extends StatefulWidget {
  const LibraryPlaylist({
    Key? key,
  }) : super(key: key);

  @override
  _LibraryPlaylistState createState() => _LibraryPlaylistState();
}

class _LibraryPlaylistState extends State<LibraryPlaylist> {
  late ScrollController _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(vertical: 12),
            physics: const ClampingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      "YOUR LIBRARY",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  ...yourLibrary
                      .map((e) => ListTile(
                            hoverColor:
                                Theme.of(context).accentColor.withOpacity(0.80),
                            dense: true,
                            title: Text(
                              e,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            onTap: () {},
                          ))
                      .toList()
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      "PLAYLISTS",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  ...playlists
                      .map((e) => ListTile(
                            hoverColor:
                                Theme.of(context).accentColor.withOpacity(0.80),
                            dense: true,
                            title: Text(
                              e,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            onTap: () {},
                          ))
                      .toList()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
}

class _SideMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const _SideMenuTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        hoverColor: Theme.of(context).accentColor,
        leading: Icon(
          icon,
          color: Theme.of(context).iconTheme.color,
          size: 28,
        ),
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        onTap: onTap,
      ),
    );
  }
}
