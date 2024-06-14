//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ActiveMultiplier {
  /// Returns a new [ActiveMultiplier] instance.
  ActiveMultiplier({
    this.multiplier,
    this.category,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? multiplier;

  String? category;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ActiveMultiplier &&
    other.multiplier == multiplier &&
    other.category == category;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (multiplier == null ? 0 : multiplier!.hashCode) +
    (category == null ? 0 : category!.hashCode);

  @override
  String toString() => 'ActiveMultiplier[multiplier=$multiplier, category=$category]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.multiplier != null) {
      json[r'multiplier'] = this.multiplier;
    } else {
      json[r'multiplier'] = null;
    }
    if (this.category != null) {
      json[r'category'] = this.category;
    } else {
      json[r'category'] = null;
    }
    return json;
  }

  /// Returns a new [ActiveMultiplier] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ActiveMultiplier? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ActiveMultiplier[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ActiveMultiplier[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ActiveMultiplier(
        multiplier: mapValueOfType<double>(json, r'multiplier'),
        category: mapValueOfType<String>(json, r'category'),
      );
    }
    return null;
  }

  static List<ActiveMultiplier> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ActiveMultiplier>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ActiveMultiplier.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ActiveMultiplier> mapFromJson(dynamic json) {
    final map = <String, ActiveMultiplier>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ActiveMultiplier.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ActiveMultiplier-objects as value to a dart map
  static Map<String, List<ActiveMultiplier>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ActiveMultiplier>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ActiveMultiplier.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

