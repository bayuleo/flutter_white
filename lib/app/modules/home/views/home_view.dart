import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'HomeView is working',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                controller: controller.textEditingController,
                decoration: InputDecoration(hintText: 'Input Value'),
              ),
              ElevatedButton(
                onPressed: controller.onClickGet,
                child: const Text('GET'),
              ),
              ElevatedButton(
                onPressed: controller.onClickPost,
                child: const Text('POST'),
              ),
              ElevatedButton(
                onPressed: controller.onClickPatch,
                child: const Text('PATCH'),
              ),
              Text(
                'Result : ${controller.result?.name ?? ''}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
