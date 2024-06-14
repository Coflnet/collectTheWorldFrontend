//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/auth_api.dart';
part 'api/challenge_api.dart';
part 'api/image_api.dart';
part 'api/leaderboard_api.dart';
part 'api/multiplier_api.dart';
part 'api/object_api.dart';
part 'api/skip_api.dart';
part 'api/stats_api.dart';

part 'model/active_multiplier.dart';
part 'model/anonymous_login_request.dart';
part 'model/board_entry.dart';
part 'model/board_names.dart';
part 'model/captured_image.dart';
part 'model/captured_image_with_download_url.dart';
part 'model/category.dart';
part 'model/challenge.dart';
part 'model/challenge_response.dart';
part 'model/collectable_object.dart';
part 'model/multiplier_response.dart';
part 'model/profile.dart';
part 'model/public_profile.dart';
part 'model/skip_response.dart';
part 'model/skips_available.dart';
part 'model/stat.dart';
part 'model/token_response.dart';


/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
var defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) => pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
