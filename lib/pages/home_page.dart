import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("38-Dars"),
        ),
        body:
            // GridView(
            //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(),
            // ),
            // GridView.extent(maxCrossAxisExtent: maxCrossAxisExtent)
            GridView.count(
          crossAxisCount: 2,
          children: [
            GridTile(
              header: GridTileBar(
                backgroundColor: Colors.blue,
                leading: Icon(Icons.star),
                title: Text("Salom"),
              ),
              footer: const GridTileBar(
                leading: Icon(Icons.star),
                title: Text("Salom"),
                subtitle: Text("Salom "),
              ),
              child: Image.network(
                "https://wallpapertag.com/wallpaper/full/6/6/d/550105-vertical-tropical-island-desktop-wallpaper-1920x1080.jpg",
                fit: BoxFit.cover,
              ),
            ),
            GridTile(
              header: const GridTileBar(
                leading: Icon(Icons.star),
                title: Text("Salom"),
                subtitle: Text("Salom "),
              ),
              footer: const GridTileBar(
                leading: Icon(Icons.star),
                title: Text("Salom"),
                subtitle: Text("Salom "),
              ),
              child: Image.network(
                "https://wallpapertag.com/wallpaper/full/6/6/d/550105-vertical-tropical-island-desktop-wallpaper-1920x1080.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ));
  }
}
