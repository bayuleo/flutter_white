import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/app/data/model/example_list_data.dart';
import 'package:flutter_new/app/data/model/example_request_list.dart';
import 'package:flutter_new/app/data/source/data_source.dart';
import 'package:flutter_new/app/routes/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ListExampleController extends GetxController {
  final _dataSource = DataSource();
  List<ExampleListData> data = [];
  late ScrollController scrollController;

  //pagination
  int page = 1;
  int perPage = 20;
  bool isEnd = false;
  bool onBusy = false;

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(_onScrollListener);
    super.onInit();
  }

  @override
  void onReady() {
    onGetData();
    super.onReady();
  }

  void _onScrollListener() async {
    if (scrollController.offset == scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange &&
        !isEnd &&
        !onBusy) {
      onGetData();
      Fluttertoast.showToast(msg: "load more");
    }
  }

  void onGetData([isRefresh = false]) async {
    var result = await _dataSource.getListData(
      ExampleRequestList(
        page: page,
        perPage: perPage,
      ),
    );
    if (isRefresh) {
      data.clear();
    }
    page++;
    data.addAll(result.data);
    update();
  }

  void onDeleteData(String id) async {
    if (await confirm(Get.context!)) {
      var result = await _dataSource.deleteData(id);
      data = result.data;
      update();
    } else {}
  }

  void onClickAdd() async {
    var result = await Get.toNamed(Routes.ADD_FORM);
    if (result != null && result) {
      onGetData(true);
    }
  }

  void onClickEdit(String id) async {
    var result = await Get.toNamed(Routes.ADD_FORM, arguments: id);
    if (result != null && result) {
      onGetData(true);
    }
  }
}
