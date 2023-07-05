import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();

}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.yellow[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Park Jung Hoon',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '21900304',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          const FavoriteWidget(),
        ],
      ),
    );
    Color color = Colors.black;

    Widget buttonSection = Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButtonColumn(color, Icons.call, 'CALL'),
            _buildButtonColumn(color, Icons.message, 'MESSAGE'),
            _buildButtonColumn(color, Icons.email, 'EMAIL'),
            _buildButtonColumn(color, Icons.share, 'SHARE'),
            _buildButtonColumn(color, Icons.description, 'ETC'),
          ],
        )

    );

    Widget textSection =  Padding(
      padding: EdgeInsets.all(32),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Icon(
                Icons.message,
                size: 40),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*2*/
                  Container(
                    padding: const EdgeInsets.fromLTRB(10,0,10,0),
                    child: const Text(
                      'Recent Message',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10,0,10,0),
                    child: Text(
                      'long time no see!',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ),

                ]
            )
          ]
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        body: ListView(
          children: [
            Image.asset('lib/images/du.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,),


            titleSection,
            Divider(
                height: 1.0,
                color: Colors.black
            ),
            buttonSection,
            Divider(
                height: 1.0,
                color: Colors.black
            ),
            textSection,
          ],
        ),
      ),
    );
  }
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}