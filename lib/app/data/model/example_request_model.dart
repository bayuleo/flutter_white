import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class ExampleRequestModel {

  const ExampleRequestModel({
    required this.username,
  });

  final String username;

  factory ExampleRequestModel.fromJson(Map<String,dynamic> json) => ExampleRequestModel(
    username: json['username'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'username': username
  };

  ExampleRequestModel clone() => ExampleRequestModel(
    username: username
  );


  ExampleRequestModel copyWith({
    String? username
  }) => ExampleRequestModel(
    username: username ?? this.username,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ExampleRequestModel && username == other.username;

  @override
  int get hashCode => username.hashCode;
}
