import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Users Group Code

class UsersGroup {
  static String baseUrl = 'https://friendy-social-bc47307e1168.herokuapp.com';
  static Map<String, String> headers = {};
  static GetAllUsersCall getAllUsersCall = GetAllUsersCall();
}

class GetAllUsersCall {
  Future<ApiCallResponse> call({
    List<bool>? withCredentialsList,
  }) async {
    final withCredentials = _serializeList(withCredentialsList);

    return ApiManager.instance.makeApiCall(
      callName: 'getAllUsers',
      apiUrl: '${UsersGroup.baseUrl}/users',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'withCredentials': withCredentials,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Users Group Code

class GetAllPsotsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllPsots',
      apiUrl: 'https://friendy-social-bc47307e1168.herokuapp.com/posts',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'withCredentials': true,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddPostCall {
  static Future<ApiCallResponse> call({
    int? createdBy,
    String? content = '',
    String? images = '',
    List<bool>? withCredentialsList,
  }) async {
    final withCredentials = _serializeList(withCredentialsList);

    return ApiManager.instance.makeApiCall(
      callName: 'addPost',
      apiUrl: 'https://friendy-social-bc47307e1168.herokuapp.com/posts',
      callType: ApiCallType.POST,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
      params: {
        'withCredentials': withCredentials,
        'content': content,
        'images': images,
        'created_by': createdBy,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
