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
        TextAreaElement output = document.querySelector('.area') as TextAreaElement;
        output.text = data.toString();
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

        return JSON.decode(request.responseText);
    }
}
