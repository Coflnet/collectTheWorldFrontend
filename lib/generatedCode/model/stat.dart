//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Stat {
  /// Returns a new [Stat] instance.
  Stat({
    this.userId,
    this.statName,
    this.value,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? userId;

  String? statName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Stat &&
    other.userId == userId &&
    other.statName == statName &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (userId == null ? 0 : userId!.hashCode) +
    (statName == null ? 0 : statName!.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'Stat[userId=$userId, statName=$statName, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.userId != null) {
      json[r'userId'] = this.userId;
    } else {
      json[r'userId'] = null;
    }
    if (this.statName != null) {
      json[r'statName'] = this.statName;
    } else {
      json[r'statName'] = null;
    }
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [Stat] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Stat? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Stat[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Stat[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Stat(
        userId: mapValueOfType<String>(json, r'userId'),
        statName: mapValueOfType<String>(json, r'statName'),
        value: mapValueOfType<int>(json, r'value'),
      );
    }
    return null;
  }

  static List<Stat> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Stat>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Stat.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Stat> mapFromJson(dynamic json) {
    final map = <String, Stat>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Stat.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Stat-objects as value to a dart map
  static Map<String, List<Stat>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Stat>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Stat.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

