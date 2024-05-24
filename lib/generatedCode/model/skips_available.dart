//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SkipsAvailable {
  /// Returns a new [SkipsAvailable] instance.
  SkipsAvailable({
    this.total,
    this.used,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? total;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? used;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SkipsAvailable &&
    other.total == total &&
    other.used == used;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (total == null ? 0 : total!.hashCode) +
    (used == null ? 0 : used!.hashCode);

  @override
  String toString() => 'SkipsAvailable[total=$total, used=$used]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.total != null) {
      json[r'total'] = this.total;
    } else {
      json[r'total'] = null;
    }
    if (this.used != null) {
      json[r'used'] = this.used;
    } else {
      json[r'used'] = null;
    }
    return json;
  }

  /// Returns a new [SkipsAvailable] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SkipsAvailable? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SkipsAvailable[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SkipsAvailable[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SkipsAvailable(
        total: mapValueOfType<int>(json, r'total'),
        used: mapValueOfType<int>(json, r'used'),
      );
    }
    return null;
  }

  static List<SkipsAvailable> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SkipsAvailable>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SkipsAvailable.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SkipsAvailable> mapFromJson(dynamic json) {
    final map = <String, SkipsAvailable>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SkipsAvailable.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SkipsAvailable-objects as value to a dart map
  static Map<String, List<SkipsAvailable>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SkipsAvailable>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SkipsAvailable.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

