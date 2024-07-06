//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UploadStats {
  /// Returns a new [UploadStats] instance.
  UploadStats({
    this.extendedStreak,
    this.collectedTimes,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? extendedStreak;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? collectedTimes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UploadStats &&
    other.extendedStreak == extendedStreak &&
    other.collectedTimes == collectedTimes;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (extendedStreak == null ? 0 : extendedStreak!.hashCode) +
    (collectedTimes == null ? 0 : collectedTimes!.hashCode);

  @override
  String toString() => 'UploadStats[extendedStreak=$extendedStreak, collectedTimes=$collectedTimes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.extendedStreak != null) {
      json[r'extendedStreak'] = this.extendedStreak;
    } else {
      json[r'extendedStreak'] = null;
    }
    if (this.collectedTimes != null) {
      json[r'collectedTimes'] = this.collectedTimes;
    } else {
      json[r'collectedTimes'] = null;
    }
    return json;
  }

  /// Returns a new [UploadStats] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UploadStats? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UploadStats[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UploadStats[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UploadStats(
        extendedStreak: mapValueOfType<bool>(json, r'extendedStreak'),
        collectedTimes: mapValueOfType<int>(json, r'collectedTimes'),
      );
    }
    return null;
  }

  static List<UploadStats> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UploadStats>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UploadStats.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UploadStats> mapFromJson(dynamic json) {
    final map = <String, UploadStats>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UploadStats.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UploadStats-objects as value to a dart map
  static Map<String, List<UploadStats>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UploadStats>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UploadStats.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

