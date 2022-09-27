import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  PreferredSizeWidget _appBarWidget() {
    return AppBar(
        leading: Image.asset("assets/images/trenbe_logo.png"),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.enhanced_encryption_outlined,
                  color: Colors.black)),
        ]);
  }

  Container _myExpandedContain(String label) {
    return Container(
      alignment: Alignment.center,
      child: Text("$label"),
    );
  }

  Widget _bodyWidget() {
    return Column(
      children: [
        Container(
          height:
              MediaQuery.of(context).copyWith().size.height, //width, height 조정
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: (Colors.grey.withOpacity(0.4)),
                      labelText: "트렌비X삼성전자 최대 20% 쿠폰!",
                      suffixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(children: [
                      Expanded(
                        child: _myExpandedContain("Home"),
                        flex: 1,
                      ),
                      Expanded(
                        child: _myExpandedContain("기획전"),
                        flex: 1,
                      ),
                      Expanded(child: _myExpandedContain("Ranking"), flex: 1),
                      Expanded(
                        child: _myExpandedContain("Brand"),
                        flex: 1,
                      ),
                      Expanded(
                        child: _myExpandedContain("IT:EM"),
                        flex: 1,
                      ),
                      Expanded(
                        child: _myExpandedContain("Magazine"),
                        flex: 1,
                      ),

                      /*GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Home",
                              style: TextStyle(color: Colors.black),
                           ))*/
                    ]),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/images/mainpage.png"),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  child: Icon(Icons.search),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  child: Icon(Icons.favorite),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ],
            //expanded 총 6개
          ),
        ),
      ],
    );
  }
  //FloatingActionButton);

  /*Widget _bodyWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:10,vertical:10),
      margin:EdgeInsets.symmetric(horizontal:10,vertical:10),
      color:Colors.grey,
      child:Row(
        children:[
          width:300,
          icon:Icon(Icons.search),
      ],
      )
     
                
        );
  }

   Widget _bottomNavigatorBar() {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.grid_view_rounded),
        label: "카테고리",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.redeem_sharp),
        label: "이벤트",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: "홈",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.local_mall_outlined),
        label: "뉴 시즌",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.perm_identity_outlined),
        label: "마이",
      )
    ]);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: _bodyWidget(),
      //bottomNavigationBar:_BottomNavigationBar(),
    );
  }
}
