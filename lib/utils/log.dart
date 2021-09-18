void printLog(String log) {
  print(getCurrentDisplayTime() + "====>>>>" + log);
}

String getCurrentDisplayTime() => DateTime.now().toIso8601String();
