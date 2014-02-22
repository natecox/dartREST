import 'dart:html';
import 'dart:convert' show JSON;

void create_request() {
    InputElement url_input = querySelector('#url');
    InputElement method_input = querySelector('#method');
    ElementList data_elements = querySelectorAll('.data');
    
    Map data_map = new Map();
    for (Element element in data_elements) {
        InputElement name_input = element.querySelector('.name');
        InputElement value_input = element.querySelector('.value');
        if (name_input.value != '' && value_input.value != '') {
            data_map[name_input.value] = value_input.value;
        }
    }
    
    String data_JSON = JSON.encode(data_map);
}