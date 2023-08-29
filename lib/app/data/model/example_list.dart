import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class ExampleList {

  const ExampleList({
    required this.data,
  });

  final List<ExampleListData> data;

  factory ExampleList.fromJson(Map<String,dynamic> json) => ExampleList(
    data: (json['data'] as List? ?? []).map((e) => ExampleListData.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'data': data.map((e) => e.toJson()).toList()
  };

  ExampleList clone() => ExampleList(
    data: data.map((e) => e.clone()).toList()
  );


  ExampleList copyWith({
    List<ExampleListData>? data
  }) => ExampleList(
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ExampleList && data == other.data;

  @override
  int get hashCode => data.hashCode;
}
