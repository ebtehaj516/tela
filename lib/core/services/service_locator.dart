import 'package:get_it/get_it.dart';
import '../database/cash/cache_helper.dart';
//object of getIt package
final getIt = GetIt.instance;
//function to increase performance fore CashHelper
void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());

}