library dartrest;

import 'dart:html';
import 'dart:convert' show JSON;

part 'serverResponse.dart';

void  main() {
    RESTRequest r = new RESTRequest();
    Map map = new Map();
    map['test'] = 'response';
    map['another test'] = 'another response';
    print(r.getMap('http://httpbin.org/post', 'POST', map).toString());
}
