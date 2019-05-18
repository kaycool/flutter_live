import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tabController;
  List<Tab> tabs = <Tab>[
    new Tab(text: "全部"),
    new Tab(text: "推荐"),
    new Tab(text: "LOL"),
    new Tab(text: "王者荣耀"),
    new Tab(text: "刺激战场"),
    new Tab(text: "绝地求生"),
    new Tab(text: "星秀"),
    new Tab(text: "一起看"),
    new Tab(text: "户外"),
    new Tab(text: "CF"),
    new Tab(text: "主机"),
    new Tab(text: "颜值"),
    new Tab(text: "二次元"),
    new Tab(text: "暴雪")
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "flutter demo",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.black,
          unselectedLabelStyle: TextStyle(fontSize: 14),
          labelColor: Colors.yellow,
          labelStyle: TextStyle(fontSize: 18),
          tabs: tabs,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e.text, textScaleFactor: 5),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("home")),
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text("chat")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("user")),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
