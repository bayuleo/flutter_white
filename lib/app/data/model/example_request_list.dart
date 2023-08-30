import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class ExampleRequestList {

  const ExampleRequestList({
    required this.page,
    required this.perPage,
  });

  final int page;
  final int perPage;

  factory ExampleRequestList.fromJson(Map<String,dynamic> json) => ExampleRequestList(
    page: json['page'] as int,
    perPage: json['perPage'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'page': page,
    'perPage': perPage
  };

  ExampleRequestList clone() => ExampleRequestList(
    page: page,
    perPage: perPage
  );


  ExampleRequestList copyWith({
    int? page,
    int? perPage
  }) => ExampleRequestList(
    page: page ?? this.page,
    perPage: perPage ?? this.perPage,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ExampleRequestList && page == other.page && perPage == other.perPage;

  @override
  int get hashCode => page.hashCode ^ perPage.hashCode;
}
