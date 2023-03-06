import 'package:ample_app3/models/Track.dart';
import 'package:ample_app3/routes/app_routes.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final items = List<String>.generate(10, (i) => "Item $i");

  final Track track = Track("hoge", "track1", "artist1");

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
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  // TODO 押した感を出したい
                  onTap: () {
                    debugPrint("onTap：$index");
                    Navigator.pushNamed(context, AppRoutes.player,
                        arguments: track);
                  },
                  child: SizedBox(
                    width: 160,
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(15),
                            color: index.isEven ? Colors.blue : Colors.yellow,
                          ),
                        ),
                        ListTile(
                          title: Text(items[index]),
                          subtitle: const Text("subtitle."),
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
                childAspectRatio: 0.7,
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
