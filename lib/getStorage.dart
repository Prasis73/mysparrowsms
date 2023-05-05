// ignore_for_file: file_names, non_constant_identifier_names

import 'package:get_storage/get_storage.dart';

class GetSetStorage {
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

  static String getFrom() {
    final box = GetStorage();
    return box.read("FROM") ?? "";
  }

  static setFrom(String FROM) {
    final box = GetStorage();
    box.write("FROM", FROM);
  }

  static String getTo() {
    final box = GetStorage();
    return box.read("TO") ?? "";
  }

  static setTo(String TO) {
    final box = GetStorage();
    box.write("TO", TO);
  }
}
