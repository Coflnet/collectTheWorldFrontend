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
  Future<Response> getCategoriesWithHttpInfo() async {
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

  Future<List<Category>?> getCategories() async {
    final response = await getCategoriesWithHttpInfo();
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
  Future<Response> getCategoryObjectsWithHttpInfo(String categoryName,) async {
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
  Future<List<CollectableObject>?> getCategoryObjects(String categoryName,) async {
    final response = await getCategoryObjectsWithHttpInfo(categoryName,);
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

  /// Performs an HTTP 'GET /api/objects/challenge' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] offset:
  ///
  /// * [int] count:
  Future<Response> getChellengeWithHttpInfo({ int? offset, int? count, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/objects/challenge';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (offset != null) {
      queryParams.addAll(_queryParams('', 'offset', offset));
    }
    if (count != null) {
      queryParams.addAll(_queryParams('', 'count', count));
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
  /// * [int] offset:
  ///
  /// * [int] count:
  Future<List<CollectableObject>?> getChellenge({ int? offset, int? count, }) async {
    final response = await getChellengeWithHttpInfo( offset: offset, count: count, );
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

  /// Performs an HTTP 'GET /api/objects/next' operation and returns the [Response].
  Future<Response> getNextObjectWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/objects/next';

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

  Future<CollectableObject?> getNextObject() async {
    final response = await getNextObjectWithHttpInfo();
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

  /// Performs an HTTP 'GET /api/objects/{objectId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] objectId (required):
  Future<Response> getObjectWithHttpInfo(String objectId,) async {
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
  Future<CollectableObject?> getObject(String objectId,) async {
    final response = await getObjectWithHttpInfo(objectId,);
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

  /// Performs an HTTP 'GET /api/objects' operation and returns the [Response].
  Future<Response> getObjectsWithHttpInfo() async {
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

  Future<List<CollectableObject>?> getObjects() async {
    final response = await getObjectsWithHttpInfo();
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
}
