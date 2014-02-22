part of dartrest;

void create_request(Event e) {
    InputElement url_input = querySelector('.url');
    SelectElement method_input = querySelector('.method');
    ElementList data_elements = querySelectorAll('.data');
    
    Map data_map = new Map();
    for (Element element in data_elements) {
        InputElement name_input = element.querySelector('.name');
        InputElement value_input = element.querySelector('.value');
        if (name_input.value != '' && value_input.value != '') {
            data_map[name_input.value] = value_input.value;
        }
    }
    
    Response serverResponse = new Response();
    print(serverResponse.getRequest(url_input.value, method_input.value, data_map));
    e.preventDefault();
}

void add_data_element(MouseEvent e) {
    Element parent = querySelector('.parameter-container');
    
    ListElement data_item = new ListElement();
    data_item.classes.add('data');
    
    data_item.innerHtml = '<input type="text" class="form-control parameter-entry" placeholder="Enter a key here!">\n<input type="text" class="form-control parameter-entry" placeholder="Enter a value here!">';
    
    parent.append(data_div);
}
