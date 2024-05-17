//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class LeaderboardApi {
  LeaderboardApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /api/leaderboard/{leaderboardId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] leaderboardId (required):
  ///
  /// * [int] offset:
  ///
  /// * [int] count:
  Future<Response> getLeaderboardWithHttpInfo(String leaderboardId, { int? offset, int? count, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/leaderboard/{leaderboardId}'
      .replaceAll('{leaderboardId}', leaderboardId);

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
  /// * [String] leaderboardId (required):
  ///
  /// * [int] offset:
  ///
  /// * [int] count:
  Future<List<BoardEntry>?> getLeaderboard(String leaderboardId, { int? offset, int? count, }) async {
    final response = await getLeaderboardWithHttpInfo(leaderboardId,  offset: offset, count: count, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<BoardEntry>') as List)
        .cast<BoardEntry>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/leaderboard/{leaderboardId}/me' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] leaderboardId (required):
  ///
  /// * [int] count:
  Future<Response> getLeaderboardAroundMeWithHttpInfo(String leaderboardId, { int? count, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/leaderboard/{leaderboardId}/me'
      .replaceAll('{leaderboardId}', leaderboardId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  /// * [String] leaderboardId (required):
  ///
  /// * [int] count:
  Future<List<BoardEntry>?> getLeaderboardAroundMe(String leaderboardId, { int? count, }) async {
    final response = await getLeaderboardAroundMeWithHttpInfo(leaderboardId,  count: count, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<BoardEntry>') as List)
        .cast<BoardEntry>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/leaderboard/profile' operation and returns the [Response].
  Future<Response> getProfileWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/leaderboard/profile';

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

  Future<Profile?> getProfile() async {
    final response = await getProfileWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Profile',) as Profile;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/leaderboard/{leaderboardId}/me/rank' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] leaderboardId (required):
  Future<Response> getRankWithHttpInfo(String leaderboardId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/leaderboard/{leaderboardId}/me/rank'
      .replaceAll('{leaderboardId}', leaderboardId);

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
  /// * [String] leaderboardId (required):
  Future<int?> getRank(String leaderboardId,) async {
    final response = await getRankWithHttpInfo(leaderboardId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/leaderboard/profile' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [Profile] profile:
  Future<Response> setProfileWithHttpInfo({ Profile? profile, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/leaderboard/profile';

    // ignore: prefer_final_locals
    Object? postBody = profile;

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
  /// * [Profile] profile:
  Future<void> setProfile({ Profile? profile, }) async {
    final response = await setProfileWithHttpInfo( profile: profile, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
