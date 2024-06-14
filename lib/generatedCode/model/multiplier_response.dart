//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MultiplierResponse {
  /// Returns a new [MultiplierResponse] instance.
  MultiplierResponse({
    this.success,
    this.multiplier = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? success;

  List<ActiveMultiplier>? multiplier;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MultiplierResponse &&
    other.success == success &&
    _deepEquality.equals(other.multiplier, multiplier);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (success == null ? 0 : success!.hashCode) +
    (multiplier == null ? 0 : multiplier!.hashCode);

  @override
  String toString() => 'MultiplierResponse[success=$success, multiplier=$multiplier]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.success != null) {
      json[r'success'] = this.success;
    } else {
      json[r'success'] = null;
    }
    if (this.multiplier != null) {
      json[r'multiplier'] = this.multiplier;
    } else {
      json[r'multiplier'] = null;
    }
    return json;
  }

  /// Returns a new [MultiplierResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MultiplierResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "MultiplierResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "MultiplierResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MultiplierResponse(
        success: mapValueOfType<bool>(json, r'success'),
        multiplier: ActiveMultiplier.listFromJson(json[r'multiplier']),
      );
    }
    return null;
  }

  static List<MultiplierResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MultiplierResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MultiplierResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MultiplierResponse> mapFromJson(dynamic json) {
    final map = <String, MultiplierResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MultiplierResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MultiplierResponse-objects as value to a dart map
  static Map<String, List<MultiplierResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MultiplierResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MultiplierResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

