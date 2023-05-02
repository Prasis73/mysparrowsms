// ignore_for_file: file_names

import 'package:get_storage/get_storage.dart';

class LoginGetStorage {
  static String getAPI() {
    final box = GetStorage();
    return box.read("API") ?? "";
  }

  static setAPI(String API) {
    final box = GetStorage();
    box.write("API", API);
  }

  static bool getOnboard() {
    final box = GetStorage();
    return box.read("ONBOARD") ?? true;
  }

  static setOnboard(bool ONBOARD) {
    final box = GetStorage();
    box.write("ONBOARD", ONBOARD);
  }
}
