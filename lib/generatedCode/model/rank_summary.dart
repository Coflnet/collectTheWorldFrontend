//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RankSummary {
  /// Returns a new [RankSummary] instance.
  RankSummary({
    this.dailyRank,
    this.weeklyRank,
    this.overallRank,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? dailyRank;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? weeklyRank;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? overallRank;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RankSummary &&
    other.dailyRank == dailyRank &&
    other.weeklyRank == weeklyRank &&
    other.overallRank == overallRank;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (dailyRank == null ? 0 : dailyRank!.hashCode) +
    (weeklyRank == null ? 0 : weeklyRank!.hashCode) +
    (overallRank == null ? 0 : overallRank!.hashCode);

  @override
  String toString() => 'RankSummary[dailyRank=$dailyRank, weeklyRank=$weeklyRank, overallRank=$overallRank]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.dailyRank != null) {
      json[r'dailyRank'] = this.dailyRank;
    } else {
      json[r'dailyRank'] = null;
    }
    if (this.weeklyRank != null) {
      json[r'weeklyRank'] = this.weeklyRank;
    } else {
      json[r'weeklyRank'] = null;
    }
    if (this.overallRank != null) {
      json[r'overallRank'] = this.overallRank;
    } else {
      json[r'overallRank'] = null;
    }
    return json;
  }

  /// Returns a new [RankSummary] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RankSummary? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RankSummary[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RankSummary[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RankSummary(
        dailyRank: mapValueOfType<int>(json, r'dailyRank'),
        weeklyRank: mapValueOfType<int>(json, r'weeklyRank'),
        overallRank: mapValueOfType<int>(json, r'overallRank'),
      );
    }
    return null;
  }

  static List<RankSummary> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RankSummary>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RankSummary.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RankSummary> mapFromJson(dynamic json) {
    final map = <String, RankSummary>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RankSummary.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RankSummary-objects as value to a dart map
  static Map<String, List<RankSummary>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RankSummary>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RankSummary.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

