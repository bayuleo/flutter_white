import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class ExampleListData {

  const ExampleListData({
    required this.nama,
  });

  final String nama;

  factory ExampleListData.fromJson(Map<String,dynamic> json) => ExampleListData(
    nama: json['nama'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'nama': nama
  };

  ExampleListData clone() => ExampleListData(
    nama: nama
  );


  ExampleListData copyWith({
    String? nama
  }) => ExampleListData(
    nama: nama ?? this.nama,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ExampleListData && nama == other.nama;

  @override
  int get hashCode => nama.hashCode;
}
