import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class VeroIdentifyCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? firstName = '',
    String? lastName = '',
    String? jobTitle = '',
    String? workEmail = '',
  }) {
    final body = '''
{
  "auth_token": "ZTMyMTljODNjOGRjY2E0OWU3Nzc1MmUzYWNhNThiNDgyODA1MmM2OTo5OWNhMmQzNzk4OTM3OTYwMjZjYjdiMzE5OWIzNzBiYzUwYmQyNzk2",
  "email": "${email}",
  "data": {
    "first_name": "${firstName}",
    "last_name": "${lastName}",
    "job_title": "${jobTitle}",
    "work_email": "${workEmail}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'veroIdentify',
      apiUrl: 'https://api.getvero.com/api/v2/users/track',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
