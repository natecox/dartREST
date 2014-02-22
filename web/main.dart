library dartrest;

import 'dart:html';
import 'dart:convert' show JSON;

part 'serverResponse.dart';
part 'create_request.dart';

void  main() {

    document.querySelector('.request-form').onSubmit.listen(create_request);
    document.querySelectorAll('.method-selector').forEach((element) => element.onClick((event) {
        (document.querySelector('.method') as InputElement).value = event.target.text;
    }));
    //RESTRequest r = new RESTRequest();
    //Map map = new Map();
    //map['test'] = 'response';
    //map['another test'] = 'another response';
    //print(r.getMap('http://httpbin.org/post', 'POST', map).toString());
}
