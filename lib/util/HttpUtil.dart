import 'package:http/http.dart' as http;
import 'dart:async';
class Http{

  static Future<String> get(String url,{Map<String, String> params}) async{
    if(params != null && params.isNotEmpty){
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key,value){
        sb.write("$key=$value&");
      });
      String paramString = sb.toString();
      paramString = paramString.substring(0,paramString.length-1);
      url+=paramString;
    }
    http.Response res = await http.get(url);
      if(res.statusCode == 200)
        return res.body;
      else
        return null;
  }

  static Future<String> post(String url, {Map<String, String> params}) async {
    http.Response res = await http.post(url, body: params);
    return res.body;
  }
}