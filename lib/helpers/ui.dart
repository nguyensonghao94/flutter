import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoading() {
  EasyLoading.show(status: 'loading...');
}

void hideLoading() {
  EasyLoading.dismiss();
}