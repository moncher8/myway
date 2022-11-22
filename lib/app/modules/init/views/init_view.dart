import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../routes/app_pages.dart';
import '../controllers/init_controller.dart';

class InitView extends GetView<InitController>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('initview'),
        centerTitle: true,
      ),
      body : Column(
      children: [
        MaterialButton(
            onPressed: (() => {
              Get.toNamed(Routes.HOME)
            }),
            child: Text('안녕'),
          )
        ],
      )    
    );  
  }
}