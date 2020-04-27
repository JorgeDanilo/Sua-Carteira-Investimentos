import 'dart:io';
import 'dart:convert';
import 'dart:io';

import 'package:sua_carteira_investimentos/core/constants.dart';
import 'package:sua_carteira_investimentos/data/http_manager/http_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:sua_carteira_investimentos/domain/app_exception.dart';

const timeout = Duration(seconds: 3);

@injectable
@RegisterAs(HttpManager)
class AppHttpManager implements HttpManager {

  @override
  Future get({String url, Map<String, dynamic> query, Map<String, String> headers}) async {
    try {
      print('Api Get request url $url');
      final response = await http.get(_queryBuilder(url, query), headers: _headersBuilder(headers)).timeout(timeout, onTimeout: () {
        throw NetworkException();
      });
      return _returnResponse(response);
    } catch(error) {
      throw NetworkException();
    }
  }
  
  @override
  Future post({String url, Map body, Map<String, dynamic> query, Map<String, String> headers}) async {
    try {
      print('Api Post request url $url, with $body');
      final response = await http.post(_queryBuilder(url, query), body: body != null ? json.encode(body) : null, headers: _headersBuilder(headers)).timeout(timeout, onTimeout: () {
        throw NetworkException();
      });
      return _returnResponse(response);
    } catch(error) {
      throw NetworkException();
    }
  }
  
  @override
  Future put({String url, Map body, Map<String, dynamic> query, Map<String, String> headers}) async {
    try {
      print('Api Put request url $url, with $body');
      final response = await http.put(_queryBuilder(url, query), body: json.encode(body), headers: _headersBuilder(headers)).timeout(timeout, onTimeout: () {
        throw NetworkException();
      });
      return _returnResponse(response);
    } catch(error) {
      throw NetworkException();
    }
  }
  
  @override
  Future delete({String url, Map<String, dynamic> query, Map<String, String> headers}) async {
    try {
      print('Api Delete request url $url');
      final response = await http.delete(_queryBuilder(url, query), headers: _headersBuilder(headers)).timeout(timeout, onTimeout: () {
        throw NetworkException();
      });
      return _returnResponse(response);
    } catch(error) {
      throw NetworkException();
    }
  }

  String _queryBuilder(String path, Map<String, dynamic> query) {
    final buffer = StringBuffer();
    buffer.write(Constants.server_url + path);
    if (query != null) {
      if(query.isNotEmpty) {
        buffer.write('?');
      }
      query.forEach((key, value) {
        buffer.write('$key=$value&');
      });
    }
    return buffer.toString();
  }

  Map<String, String>_headersBuilder(Map<String, String> headers) {
    final headers = Map<String, String>();
    headers[HttpHeaders.acceptHeader] = 'application/json';
    headers[HttpHeaders.contentTypeHeader] = 'application/json';
    if(headers != null && headers.isNotEmpty) {
      headers.forEach((key, value) {
        headers[key] = value;
      });
    }
    return headers;
  }

  Future _returnResponse(http.Response response) {
     final responseJson = json.decode(response.body.toString());
     if(response.statusCode >= 200 && response.statusCode <= 299) {
       print('Api response success with ${responseJson}');
       return responseJson;
     }
     switch(response.statusCode) {
       case 400:
         throw BadRequestException('Bad request');
       case 401:
       case 403:
         throw UnauthorisedException('Invalid token');
       case 500:
       default:
          throw FetchDataException('Error ocurred while communication with server with StatusCode: ${response.statusCode}');
     }
  }




}