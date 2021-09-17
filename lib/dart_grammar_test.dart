class DartTest {
  Future<String> testFuture() async {
    var list = [1, 2, 3, 4];

    Future.forEach(
        list,
        (element) => Future.delayed(Duration(seconds: 1), () {
              print('${currentTimeMillis()}  element = $element');
            }));

    Future.delayed(Duration(seconds: 2), () {
      print('delay');
    });
    //
    // list.forEach((element) async {
    //   print('我是delay 之前 $element');
    //   await Future.delayed(Duration(seconds: 1));
    //   print('我是delay 之后 $element');
    // });
  }

  Future<String> getFutrue1() async {
    String msg = 'defaultMsg';

    var resutl0 = await getFuture(0);

    msg = resutl0;

    print('result0 = $resutl0');

    String result1 = await getFuture(1);

    if (msg == resutl0) {
      if (result1.isEmpty) msg = result1;
    }

    return Future.value(msg);
  }

  Future<String> getFuture(int index) {
    if (index % 2 == 0) {
      return Future.delayed(Duration(milliseconds: 200), () => "$index");
    }
    // return Future.delayed(Duration(milliseconds: 200), () => "$index");
    Future.delayed(Duration(milliseconds: 200), () {
      throw 'index 不满足条件';
      return "error $index";
    });
  }

  Future<String> getFutureStr() async {
    return Future.value('dafda');
  }
}

void forEach(void action(int element)) {}

int currentTimeMillis() {
  return new DateTime.now().millisecondsSinceEpoch;
}
