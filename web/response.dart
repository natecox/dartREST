part of dartrest;

class Response {
    Map data;
    String url;
    String requestType;
    var dataOut;
    var dataIn;


    Response(){
    }

    void render() {
        Element output = document.querySelector('.output');
        output.innerHtml = "";
        output.append(to_lis(data));
    }
    
    Element to_lis(Map data) {
        Element master_list = new Element.ul();
        for (String key in data.keys) {
            var value = data[key];
            Element element;
            if (value is Map) {
                element = to_lis(value);
            }
            else {
                element = new Element.ul();
                element.innerHtml = "<li>" + value.toString() + "</li>";
            }
            Element sub_list = new Element.li();
            sub_list.innerHtml = key;
            sub_list.append(element);
            master_list.append(sub_list);
        }
        return master_list;
    }

    Map getRequest(String url, String methodOut, Map dataOut) {
        if (methodOut.toLowerCase() == "get") {
            url += "?";
            for (String key in dataOut.keys) {
                url += key + "=" + dataOut[key] + "&";
            }
        }
        HttpRequest request = new HttpRequest();
        request
            ..open(methodOut, url, async: false)
            ..send(JSON.encode(dataOut));

        data = JSON.decode(request.responseText);
        return JSON.decode(request.responseText);
    }
}