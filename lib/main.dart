import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Images Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  Future<void> checkInternetConnection() async {
    try {
      final response = await http.get(Uri.parse('http://www.google.com'));
      setState(() {
        _isConnected = response.statusCode == 200;
      });
    } catch (e) {
      setState(() {
        _isConnected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Images Demo'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _isConnected ? 'Connected to Internet' : 'Disconnected from Internet',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              _isConnected
                  ? Image.network('https://www.meme-arsenal.com/memes/6aa042b030a8417e9b3e23d083e2eef4.jpg')
                  : Image.asset('assets/cat-cats.gif'),
              SizedBox(height: 20),
              _isConnected
                  ? Image.network('https://zagony.ru/admin_new/foto/2023-1-19/1674117781/zabavnye-koty-21-foto_1.jpg')
                  : Image.asset('assets/кот-моргает.gif'),
              SizedBox(height: 20),
              _isConnected
                  ? Image.network('https://lh3.googleusercontent.com/proxy/g0BAIh7Gt39KdWFtepkep36MJQiIhj4IVM-joLfwXb4TY6GHUNUEEL3HVfivAtoxfXnshHJfwCfS3Ngq41cDbabBqyiJaHHNIwjX461YIQ8')
                  : Image.asset('assets/komaru.gif'),
              SizedBox(height: 20),
              _isConnected
                  ? Image.network('data:image/jpeg;base64,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')
                  : Image.asset('assets/chipichipichapachapa.gif'),
              SizedBox(height: 20),
              _isConnected
                  ? Image.network('https://avatars.dzeninfra.ru/get-zen_doc/1671806/pub_5e0e064fddfef600b0937786_5e0e067bdf944400b120fa1a/scale_1200')
                  : Image.asset('assets/умныйогурчик-кот.gif'),
            ],
          ),
        ),
      ),
    );
  }
}
