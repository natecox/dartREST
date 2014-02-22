part of dartrest;

class RESTRequest {
    String url;
    String requestType;
    var dataOut;
    var dataIn;

    RESTRequest() {

    }

    Map getMap(String url, String methodOut, Map dataOut) {
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
