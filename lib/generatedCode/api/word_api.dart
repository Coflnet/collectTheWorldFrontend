//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class WordApi {
  WordApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /api/Word/isCollectableWord' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] locale:
  ///
  /// * [String] phrase:
  Future<Response> isCollectableWordWithHttpInfo({ String? locale, String? phrase, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Word/isCollectableWord';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (locale != null) {
      queryParams.addAll(_queryParams('', 'locale', locale));
    }
    if (phrase != null) {
      queryParams.addAll(_queryParams('', 'phrase', phrase));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] locale:
  ///
  /// * [String] phrase:
  Future<void> isCollectableWord({ String? locale, String? phrase, }) async {
    final response = await isCollectableWordWithHttpInfo( locale: locale, phrase: phrase, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
