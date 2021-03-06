library dartrest;

import 'dart:html';
import 'dart:convert' show JSON;

part 'serverResponse.dart';
part 'response.dart';
part 'create_request.dart';

void  main() {

    document.querySelector('.request-form').onSubmit.listen(create_request);
    document.querySelectorAll('.method-selector').forEach((element) => element.onClick.listen((event) {
        (document.querySelector('.method') as InputElement).value = event.target.text;
        document.querySelector('.dropdown-toggle').innerHtml = event.target.text + ' <span class="caret">';
        
    }));
    document.querySelector('.add-parameter-btn').onClick.listen(add_data_element);
    //RESTRequest r = new RESTRequest();
    //Map map = new Map();
    //map['test'] = 'response';
    //map['another test'] = 'another response';
    //print(r.getMap('http://httpbin.org/post', 'POST', map).toString());
}
