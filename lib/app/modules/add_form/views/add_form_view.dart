import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_form_controller.dart';

class AddFormView extends GetView<AddFormController> {
  const AddFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddFormView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                'AddFormView is working',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                controller: controller.textEditingController,
                decoration: const InputDecoration(hintText: 'Input Value'),
              ),
              ElevatedButton(
                onPressed: controller.onClickPost,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
