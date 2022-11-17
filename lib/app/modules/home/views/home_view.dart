import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(builder: (_) {
        return Center(
          child: Container(
            height: 400,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _.localUser.name ?? '',
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      width: 100,
                        child: TextField(controller: controller.nameController,)),
                    MaterialButton(
                        child: Text('edit'), onPressed: controller.editName),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_.localUser.position ?? ''),
                    Container(
                      width: 100,
                        child: TextField(controller: controller.posiController,)),
                    MaterialButton(
                        child: Text('edit'), onPressed: controller.editName),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_.localUser.department ?? ''),
                    Container(
                        width: 100,
                        child: TextField(controller: controller.departController,)),
                    MaterialButton(
                        child: Text('edit'), onPressed: controller.editName),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
