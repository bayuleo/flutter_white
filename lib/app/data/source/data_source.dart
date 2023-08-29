import 'dart:convert';

import 'package:flutter_new/app/data/model/example_model.dart';
import 'package:flutter_new/app/data/model/example_request_model.dart';
import 'package:flutter_new/network/dio_config.dart';

class DataSource {
  Future<ExampleModel> getData() async {
    final response = await DioConfig.createDio().get('example');
    return ExampleModel.fromJson(response.data);
  }

  Future<ExampleModel> postData(ExampleRequestModel requestModel) async {
    final response = await DioConfig.createDio().post(
      'example',
      data: jsonEncode(
        requestModel.toJson(),
      ),
    );
    return ExampleModel.fromJson(response.data);
  }

  Future<ExampleModel> patchData(ExampleRequestModel requestModel) async {
    final response = await DioConfig.createDio().patch(
      'example',
      data: jsonEncode(
        requestModel.toJson(),
      ),
    );
    return ExampleModel.fromJson(response.data);
  }
}
