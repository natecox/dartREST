part of dartrest;

void create_request(Event e) {
    e.preventDefault();
    InputElement url_input = querySelector('.url');
    InputElement method_input = querySelector('.method');
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
    serverResponse.render();
}

void add_data_element(MouseEvent e) {
    Element parent = querySelector('.parameter-container');
    
    Element data_item = new Element.li();
    data_item.classes.add('data');
    
    data_item.innerHtml = '<input type="text" class="form-control parameter-entry name" placeholder="Enter a key here!">\n<input type="text" class="form-control parameter-entry value" placeholder="Enter a value here!">';
    
    parent.append(data_item);
}
