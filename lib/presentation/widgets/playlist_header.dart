import 'package:flutter/material.dart';
import 'package:flutter_web_desktop/domain/model/playlist.dart';
import 'package:flutter_web_desktop/utils/constants.dart';

class PlaylistHeader extends StatefulWidget {
  final Playlist playlist;
  PlaylistHeader({Key? key, required this.playlist}) : super(key: key);

  @override
  _PlaylistHeaderState createState() => _PlaylistHeaderState();
}

class _PlaylistHeaderState extends State<PlaylistHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              widget.playlist.imageURL,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Playlist",
                    style: Theme.of(context)
                        .textTheme
                        .overline!
                        .copyWith(fontSize: 12.0)),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  widget.playlist.name,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  widget.playlist.description,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Created by ${widget.playlist.creator} • ${widget.playlist.songs.length} songs, ${widget.playlist.duration},",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ))
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        PlaylistButttons(followers: widget.playlist.followers)
      ],
    );
  }
}

class PlaylistButttons extends StatelessWidget {
  final String followers;
  const PlaylistButttons({Key? key, required this.followers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          TextButton(
            onPressed: () {},
            child: Text("Play"),
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                backgroundColor: Theme.of(context).accentColor,
                primary: Theme.of(context).iconTheme.color,
                textStyle: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(fontSize: 12.0, letterSpacing: 2.0)),
          ),
          IconButton(
              icon: const Icon(
                Icons.favorite_border,
              ),
              iconSize: 30,
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.more_horiz),
              iconSize: 30,
              onPressed: () {}),
          const Spacer(),
          Text(
            "Followers\n$followers",
            textAlign: TextAlign.right,
            style:
                Theme.of(context).textTheme.caption!.copyWith(fontSize: 12.0),
          )
        ],
      ),
    );
  }
}
