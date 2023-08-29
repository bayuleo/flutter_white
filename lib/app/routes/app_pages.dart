import 'package:get/get.dart';

import '../modules/add_form/bindings/add_form_binding.dart';
import '../modules/add_form/views/add_form_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list_example/bindings/list_example_binding.dart';
import '../modules/list_example/views/list_example_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LIST_EXAMPLE,
      page: () => const ListExampleView(),
      binding: ListExampleBinding(),
    ),
    GetPage(
      name: _Paths.ADD_FORM,
      page: () => const AddFormView(),
      binding: AddFormBinding(),
    ),
  ];
}
