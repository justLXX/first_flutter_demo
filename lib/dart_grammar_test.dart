class DartTest {
  void testFuture() async {
    for (int index = 0; index < 4; index++) {
      print('index = $index');
      // var value = await getFuture(index)
      //     .catchError((msg) => print('catchError  msg = $msg'));
      // print('value = $value ');

      getFuture(index)
          .then((value) => print('value = $value'))
          .catchError((msg) => print('catchError  msg = $msg'));

      // try {
      //   var value = await getFuture(index);
      //   print('value = $value');
      // } catch (e) {
      //   print('catch  e = $e');
      // }
    }
    print('testFuture   结束');
  }

  Future<String> getFuture(int index) {
    if (index % 2 == 0) {
      return Future.delayed(Duration(milliseconds: 200), () => "$index");
    }
    // return Future.delayed(Duration(milliseconds: 200), () => "$index");
    throw 'index 不满足条件';
  }
}
