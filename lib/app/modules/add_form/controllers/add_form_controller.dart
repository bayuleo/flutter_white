import 'package:flutter/material.dart';
import 'package:flutter_new/app/data/model/index.dart';
import 'package:flutter_new/app/data/source/data_source.dart';
import 'package:get/get.dart';

class AddFormController extends GetxController {
  final _dataSource = DataSource();
  final textEditingController = TextEditingController();

  String? id;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    var args = Get.arguments;
    if (args != null) {
      id = args;
      textEditingController.text = args;
    }
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onClickPost() async {
    await _dataSource.postData(
      ExampleRequestModel(
        username: textEditingController.text.trim(),
      ),
    );
    Get.back(result: true);
  }
}
