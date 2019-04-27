const isRelease = false;

void log(String message) {
  if (!isRelease) {
    print('时间:${DateTime.now()} $message');
  }
}