import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// import 'app/data/services/fb_user_service.dart';
import 'app/routes/app_pages.dart';

void main() async{
  await GetStorage.init();
  // Get.put(FbUserService());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}



class SimpleController extends GetxController {
  int counter = 0;
  void increase() {
    counter++;
    update();
  }
}


class ReactiveController extends GetxController {
  
  static ReactiveController get to => Get.find();
  RxInt counter = 0.obs;
  @override
  void onInit() {
    once(counter, (_) {
      print('once : $_이 처음으로 변경되었습니다.');
    });

    ever(counter, (_) {
      print('ever : $_이 변경되었습니다.');
    });

    debounce(
      counter,
          (_) {
        print('debounce : $_가 마지막으로 변경된 이후, 1초간 변경이 없습니다.');
      },
      time: Duration(seconds: 1),
    );

    interval(
      counter,
          (_) {
        print('interval $_가 변경되는 중입니다.(1초마다 호출)');
      },

      time: Duration(seconds: 1),
    );
    super.onInit();
  }

  void increase() {
    counter++;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    Get.put(SimpleController());
    Get.put(ReactiveController());
    return Scaffold(
      appBar: AppBar(
        title : const Text("단순 상태관리")
      ),
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<SimpleController>( // 실시간 렌더링
              builder: (controller) {
                return ElevatedButton(
                  child: Text(
                    '단순 현재 숫자1: ${controller.counter}',
                  ),
                  onPressed: () {
                    controller.increase();
                    // Get.find<SimpleController>().increase();
                  },
                );
              },
            ),
            GetX<ReactiveController>( // 반응형 상태관리 - 1
              builder: (controller) {
                return ElevatedButton(
                  child: Text(
                    '반응형 1 / 현재 숫자: ${controller.counter.value}', // .value 로 접근
                  ),
                  onPressed: () {
                    controller.increase();
                    // Get.find<ReactiveController>().increase();
                  },
                );
              },
            ),
          ],
        ),
      ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
