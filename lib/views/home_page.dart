import 'package:ample_app3/models/Track.dart';
import 'package:ample_app3/routes/app_routes.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = List<String>.generate(10, (i) => "Item $i");

  final List<Track> tracks = [
    Track("https://picsum.photos/id/1/200/200", "track1", "artist1",
        const Duration(minutes: 6, seconds: 30)),
    Track("https://picsum.photos/id/2/200/200", "track2", "artist2",
        const Duration(minutes: 5, seconds: 30)),
    Track("https://picsum.photos/id/3/200/200", "track3", "artist3",
        const Duration(minutes: 5, seconds: 30)),
    Track("https://picsum.photos/id/4/200/200", "track4", "artist4",
        const Duration(minutes: 5, seconds: 30)),
  ];

  var _selectIndex = 0;

  void _onTapItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ホーム"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
            onPressed: () => {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex, //選択中のインデックス
        onTap: _onTapItem, //タップで選択中のインデックスを変更
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // あなたへのおすすめタイトル部分
          const TitleContainer(title: "あなたへのおすすめ"),
          // あなたへのおすすめList部分
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tracks.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  // TODO 押した感を出したい
                  onTap: () {
                    debugPrint("onTap：$index");
                    // 画面遷移、引数としてtrackを渡す
                    Navigator.pushNamed(context, AppRoutes.player,
                        arguments: tracks[index]);
                  },
                  child: SizedBox(
                    width: 160,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              tracks[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(tracks[index].title),
                          subtitle: Text(tracks[index].artist),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // カテゴリータイトル部分
          const TitleContainer(title: "カテゴリー"),
          // カテゴリーGrid部分
          SizedBox(
            height: 230,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                // 縦に並べる数
                crossAxisCount: 2,
                // グリッドの縦横比
                childAspectRatio: 2 / 3,
                // グリッド間のスペース
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(15),
                    color: index.isEven ? Colors.blue : Colors.yellow,
                  ),
                  child: Center(
                    child: Text(items[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TitleContainer extends StatelessWidget {
  const TitleContainer({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ],
      ),
    );
  }
}
