import 'package:flutter/material.dart';
import 'package:flutter_web_desktop/domain/controller/current_track_controller.dart';
import 'package:flutter_web_desktop/domain/model/songs.dart';
import 'package:get/get.dart';

class TrackList extends StatefulWidget {
  final List<Song> tracks;

  const TrackList({Key? key, required this.tracks}) : super(key: key);
  @override
  _TrackListState createState() => _TrackListState();
}

class _TrackListState extends State<TrackList> {
  @override
  Widget build(BuildContext context) {
    return GetX<CurrentSongController>(builder: (controller) {
      return DataTable(
        showCheckboxColumn: false,
        dataRowHeight: 54.0,
        headingTextStyle:
            Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
        columns: const [
          DataColumn(label: Text("TITLE")),
          DataColumn(label: Text("ARTIST")),
          DataColumn(label: Text("ALBUM")),
          DataColumn(label: Icon(Icons.access_time)),
        ],
        rows: widget.tracks.map((e) {
          final selected = controller.selectedSong.id == null
              ? false
              : controller.selectedSong.id == e.id;
          final textStyle = TextStyle(
              color: selected
                  ? Theme.of(context).accentColor
                  : Theme.of(context).iconTheme.color);
          return DataRow(cells: [
            DataCell(Text(e.title!, style: textStyle)),
            DataCell(Text(e.artist!, style: textStyle)),
            DataCell(Text(e.album!, style: textStyle)),
            DataCell(Text(e.duration!, style: textStyle)),
          ], onSelectChanged: (_) => controller.selectedSong = e);
        }).toList(),
      );
    });
  }
}
