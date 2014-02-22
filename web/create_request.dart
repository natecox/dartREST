part of dartrest;

void create_request(Event e) {
    InputElement url_input = querySelector('#url');
    SelectElement method_input = querySelector('#method');
    ElementList data_elements = querySelectorAll('.data');
    
    Map data_map = new Map();
    for (Element element in data_elements) {
        InputElement name_input = element.querySelector('.name');
        InputElement value_input = element.querySelector('.value');
        if (name_input.value != '' && value_input.value != '') {
            data_map[name_input.value] = value_input.value;
        }
    }
    
    RESTRequest r = new RESTRequest();
    print(r.getMap(url_input.value, method_input.value, data_map));
    
    e.preventDefault();
}

void add_data_element(MouseEvent e) {
    Element parent = querySelector('#form_div');
    
    DivElement data_div = new DivElement();
    data_div.classes.add('data');
    TextInputElement name_input = new TextInputElement();
    name_input.classes.add('name');
    TextInputElement value_input = new TextInputElement();
    value_input.classes.add('value');
    
    data_div..append(name_input)
            ..append(value_input);
    
    parent.append(data_div);
}