import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/init/bindings/init_binding.dart';
import '../modules/init/views/init_view.dart';
part 'app_routes.dart';



class AppPages {
  AppPages._();

  static const INITIAL = Routes.INIT;

  static final routes = [
    GetPage(
      name: _Paths.INIT,
      page: () => InitView(),
      binding: InitBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
