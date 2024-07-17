//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AuthApi {
  AuthApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Authenticates with google and returns a jwt token
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthToken] authToken:
  ///   
  Future<Response> authWithGoogleWithHttpInfo({ AuthToken? authToken, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/google';

    // ignore: prefer_final_locals
    Object? postBody = authToken;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Authenticates with google and returns a jwt token
  ///
  /// Parameters:
  ///
  /// * [AuthToken] authToken:
  ///   
  Future<TokenResponse?> authWithGoogle({ AuthToken? authToken, }) async {
    final response = await authWithGoogleWithHttpInfo( authToken: authToken, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TokenResponse',) as TokenResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/auth/google/connect' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [AuthToken] authToken:
  Future<Response> connectGoogleWithHttpInfo({ AuthToken? authToken, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/google/connect';

    // ignore: prefer_final_locals
    Object? postBody = authToken;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [AuthToken] authToken:
  Future<TokenResponse?> connectGoogle({ AuthToken? authToken, }) async {
    final response = await connectGoogleWithHttpInfo( authToken: authToken, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TokenResponse',) as TokenResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/auth/anonymous' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [AnonymousLoginRequest] anonymousLoginRequest:
  Future<Response> loginWithHttpInfo({ AnonymousLoginRequest? anonymousLoginRequest, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/anonymous';

    // ignore: prefer_final_locals
    Object? postBody = anonymousLoginRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [AnonymousLoginRequest] anonymousLoginRequest:
  Future<TokenResponse?> login({ AnonymousLoginRequest? anonymousLoginRequest, }) async {
    final response = await loginWithHttpInfo( anonymousLoginRequest: anonymousLoginRequest, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TokenResponse',) as TokenResponse;
    
    }
    return null;
  }
}
