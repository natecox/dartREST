import 'dart:html';

void create_request() {
    InputElement url_input = querySelector('#url');
    InputElement method_input = querySelector('#method');
    ElementList data_elements = querySelector('.data');
    
    Map data_map = new Map();
    data_elements.forEach((element) => data_map[element.querySelector('.name')] = element.querySelector('.value'));
    
    
}