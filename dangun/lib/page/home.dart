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
  late int _currentPageIndex;
  @override
  void initState() {
    //data 초기화
    super.initState();
    _currentPageIndex = 0;
    datas = [
      {
        "image": "speaker.jpg",
        "title": "jBL.사운드바",
        "location": "역삼동",
        "price": "145000",
        "likes": "6",
      },
      {
        "image": "s.jpg",
        "title": "jBL.사운드바",
        "location": "역삼동",
        "price": "145000",
        "likes": "6",
      }, //더 추가하고 싶으면 ,{} 로 추가
    ];
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print("click");
        },
        child: Row(
          children: [
            Text("대치2동"),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
      ],
    );
  }

  /*String calcStringToWon(String priceString){
    return "원";
  } */ //price 표시

  Widget _bodyWidget() {
    return ListView.separated(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      itemBuilder: (BuildContext _context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(9)),
              child: Image.asset(
                datas[index]["image"] ?? '',
                width: 100,
                height: 100,
              ),
            ),
            Expanded(
              child: Container(
                  height: 100,
                  padding:
                      const EdgeInsets.only(left: 20), //space bt pic and text
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        datas[index]["title"] ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 5), //for space bt each text info
                      Text(datas[index]["location"] ?? '',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity((0.4)),
                          )),
                      SizedBox(height: 5), //for space bt each text info
                      Text(datas[index]["price"] ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end, //오른쪽
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 14,
                            ),
                            Padding(
                              //for the space b/t heart and num
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(datas[index]["likes"] ?? ''),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            )
            //image asset 말고 단일로 넣기
          ]),
        );
      },
      itemCount: 1,
      separatorBuilder: (BuildContext _context, int index) {
        return Container(height: 1, color: Colors.black.withOpacity(0.4));
      },
    );
  }
  /*BottomNavigationBarItem _bottomNavigationBarItem(String iconName,String label){
    return BottomNavigationBarItem(
      icon:Icon(Icons.iconName),
      label:label,
      );
  }*/

  Widget _bottomNavigationWidget() {
    return BottomNavigationBar(
      onTap: (int index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      selectedFontSize: 12,
      currentIndex: _currentPageIndex,
      selectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(color: Colors.black),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "홈",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.filter_none),
          label: "동네생활",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label: "내 근처",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline_rounded),
          label: "채팅",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity),
          label: "나의 당근",
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationWidget(),
    );
  }
}
