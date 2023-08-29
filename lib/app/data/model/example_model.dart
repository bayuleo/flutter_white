import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class ExampleModel {

  const ExampleModel({
    required this.name,
    required this.age,
  });

  final String name;
  final int age;

  factory ExampleModel.fromJson(Map<String,dynamic> json) => ExampleModel(
    name: json['name'].toString(),
    age: json['age'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'age': age
  };

  ExampleModel clone() => ExampleModel(
    name: name,
    age: age
  );


  ExampleModel copyWith({
    String? name,
    int? age
  }) => ExampleModel(
    name: name ?? this.name,
    age: age ?? this.age,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ExampleModel && name == other.name && age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}
