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
        var output = document.querySelector('.response.output');
        List<DivElement> outputElements = new List();
        for(var key in data.keys){
            String value = data;
            DivElement kvpContainerDiv = new DivElement(); 
            DivElement keyDiv = new DivElement();
            DivElement valueDiv = new DivElement();
            keyDiv
                ..classes.add('key')
                ..text = 'Response: ';
            valueDiv..classes.add('value')
                ..text = value;
            kvpContainerDiv
                ..append(keyDiv)
                ..append(valueDiv)
                ..classes.add('kvp-container');
            output.append(kvpContainerDiv);
        }
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
        return data;
    }
}
