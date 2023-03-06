import 'package:ample_app3/models/Track.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  // 再生時間
  late Duration playtime;
  Duration currentPlayTime = const Duration(minutes: 0, seconds: 0);
  //  スライダーの値
  double _value = 0.0;
  // double _startValue = 0.0;
  // double _endValue = 0.0;
  //  スライダーの値を変更時
  void _changeSlider(double e) => setState(() {
        debugPrint("_changeSlider");
        _value = e;
        debugPrint("_value:$_value");
        currentPlayTime = const Duration(minutes: 1, seconds: 0);
      });
  // void _startSlider(double e) => setState(() {
  //       debugPrint("_startSlider");
  //       _startValue = e;
  //     });
  // void _endSlider(double e) => setState(() {
  //       debugPrint("_endSlider");
  //       _endValue = e;
  //     });

  // 再生状態
  bool _isPlaying = false;

  // 再生状態を切り替え
  void _playPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 引数からtrackを取得
    final Track track = ModalRoute.of(context)?.settings.arguments as Track;
    playtime = track.playtime;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 350,
            width: 350,
            child: Image.network(
              track.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            track.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            track.artist,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          // スライダー
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 8,
              thumbColor: Colors.white,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
              activeTrackColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              inactiveTickMarkColor: Colors.grey,
            ),
            child: Slider(
              value: _value,
              min: 0,
              max: 60,
              divisions: 5,
              onChanged: _changeSlider,
              // onChangeStart: _startSlider,
              // onChangeEnd: _endSlider,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentPlayTime.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  playtime.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.skip_previous,
                ),
                iconSize: 70,
                onPressed: () => {},
              ),
              IconButton(
                icon: Icon(
                  _isPlaying ? Icons.play_circle : Icons.pause_circle,
                ),
                iconSize: 100,
                onPressed: _playPause,
              ),
              IconButton(
                icon: const Icon(
                  Icons.skip_next,
                ),
                iconSize: 70,
                onPressed: () => {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
