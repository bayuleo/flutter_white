import 'package:flutter/cupertino.dart';
import 'package:flutter_new/app/data/model/example_model.dart';
import 'package:flutter_new/app/data/model/example_request_model.dart';
import 'package:flutter_new/app/data/source/data_source.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ExampleModel? result;
  final _dataSource = DataSource();
  final textEditingController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  void onClickGet() async {
    result = await _dataSource.getData();
    update();
  }

  void onClickPost() async {
    result = await _dataSource.postData(
      ExampleRequestModel(
        username: textEditingController.text.trim(),
      ),
    );
    update();
  }

  void onClickPatch() async {
    result = await _dataSource.patchData(
      ExampleRequestModel(
        username: textEditingController.text.trim(),
      ),
    );
    update();
  }
}
