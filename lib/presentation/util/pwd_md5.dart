import 'package:crypto/crypto.dart';

getPwd(data) {
  var a = data;
  var b = '\x8f\x70\x83\x8f';
  var c = '2eh1.iaqw7';
  var s = a + b + c;
  return s;
}

getPwdMd5Val(pwd) {
  String str = getPwd(pwd);
  List<int> bytes = str.codeUnits; // data being hashed
  var digest = md5.convert(bytes);
  return digest;
}
