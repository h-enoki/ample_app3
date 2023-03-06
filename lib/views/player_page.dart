import 'package:ample_app3/models/Track.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});
  @override
  Widget build(BuildContext context) {
    // 引数からtrackを取得
    final Track track = ModalRoute.of(context)?.settings.arguments as Track;
    debugPrint("image：${track.image}");
    debugPrint("track：${track.title}");
    debugPrint("artist：${track.artist}");

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Text(track.title),
    );
  }
}
