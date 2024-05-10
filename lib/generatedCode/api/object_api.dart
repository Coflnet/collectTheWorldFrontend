//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ObjectApi {
  ObjectApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /api/objects/categories' operation and returns the [Response].
  Future<Response> apiObjectsCategoriesGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/objects/categories';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  Future<List<Category>?> apiObjectsCategoriesGet() async {
    final response = await apiObjectsCategoriesGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Category>') as List)
        .cast<Category>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/objects/category/{categoryName}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] categoryName (required):
  Future<Response> apiObjectsCategoryCategoryNameGetWithHttpInfo(String categoryName,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/objects/category/{categoryName}'
      .replaceAll('{categoryName}', categoryName);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  /// * [String] categoryName (required):
  Future<List<CollectableObject>?> apiObjectsCategoryCategoryNameGet(String categoryName,) async {
    final response = await apiObjectsCategoryCategoryNameGetWithHttpInfo(categoryName,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CollectableObject>') as List)
        .cast<CollectableObject>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/objects' operation and returns the [Response].
  Future<Response> apiObjectsGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/objects';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  Future<List<CollectableObject>?> apiObjectsGet() async {
    final response = await apiObjectsGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<CollectableObject>') as List)
        .cast<CollectableObject>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/objects/{objectId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] objectId (required):
  Future<Response> apiObjectsObjectIdGetWithHttpInfo(String objectId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/objects/{objectId}'
      .replaceAll('{objectId}', objectId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  /// * [String] objectId (required):
  Future<CollectableObject?> apiObjectsObjectIdGet(String objectId,) async {
    final response = await apiObjectsObjectIdGetWithHttpInfo(objectId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CollectableObject',) as CollectableObject;
    
    }
    return null;
  }
}
