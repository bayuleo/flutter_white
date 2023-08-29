import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter_new/app/data/model/example_list_data.dart';
import 'package:flutter_new/app/data/source/data_source.dart';
import 'package:flutter_new/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ListExampleController extends GetxController {
  final _dataSource = DataSource();
  List<ExampleListData> data = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    onGetData();
    super.onReady();
  }

  void onGetData() async {
    var result = await _dataSource.getListData();
    data = result.data;
    update();
  }

  void onDeleteData(String id) async {
    if (await confirm(Get.context!)) {
      var result = await _dataSource.deleteData(id);
      data = result.data;
      update();
      print('OK $id');
    } else {
      print("Cancel");
    }
  }

  void onClickAdd() async {
    bool result = await Get.toNamed(Routes.ADD_FORM);
    if (result) {
      onGetData();
    }
  }

  void onClickEdit(String id) async {
    bool result = await Get.toNamed(Routes.ADD_FORM, arguments: id);
    if (result) {
      onGetData();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
