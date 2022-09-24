import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomePage> {
  List<Map<String, String>> datas = [];

  @override
  void initState() {
    super.initState();
    datas={
      "image":"speaker.jpg",
      "title":"jBL.사운드바",
      "location":"역삼동",
      "price":"145000",
      "likes":"6",
    }


    
  }

  Widget _appbarWidget() {
    return AppBar(
      title: Row(
        children: [
          Text("대치2동"),
          Icon(Icons.arrow_drop_down),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
        IconButton(onPressed: () {}, icon: Icon(Icons.add_alert)),
      ],
    );
  }

  Widget _bodyWidget(){
    return ListView.separated(
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder, 
      itemCount: itemCount)

    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}
