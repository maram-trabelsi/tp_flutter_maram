import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
    
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLiked = false;
  int _selectedIndex = 0;
  String _display = "Home";

  void _likethis() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _display = "Home";
          break;
        case 1:
          _display = "Account";
          break;
        case 2:
          _display = "Settings";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Icon _heart = Icon(
      _isLiked ? Icons.favorite : Icons.favorite_border,
      color: _isLiked ? Colors.red : Colors.white,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            onPressed: _likethis,
            icon: _heart,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _display,
              style: const TextStyle(
                color: Colors.indigoAccent,
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _likethis,
        backgroundColor: Colors.indigoAccent,
        child: _heart,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigoAccent,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "settings",
          ),
        ],
      ),
    );
  }
}
