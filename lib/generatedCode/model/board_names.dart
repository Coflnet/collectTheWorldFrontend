//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BoardNames {
  /// Returns a new [BoardNames] instance.
  BoardNames({
    this.exp,
    this.weeklyExp,
    this.dailyExp,
  });

  String? exp;

  String? weeklyExp;

  String? dailyExp;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BoardNames &&
    other.exp == exp &&
    other.weeklyExp == weeklyExp &&
    other.dailyExp == dailyExp;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (exp == null ? 0 : exp!.hashCode) +
    (weeklyExp == null ? 0 : weeklyExp!.hashCode) +
    (dailyExp == null ? 0 : dailyExp!.hashCode);

  @override
  String toString() => 'BoardNames[exp=$exp, weeklyExp=$weeklyExp, dailyExp=$dailyExp]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.exp != null) {
      json[r'exp'] = this.exp;
    } else {
      json[r'exp'] = null;
    }
    if (this.weeklyExp != null) {
      json[r'weeklyExp'] = this.weeklyExp;
    } else {
      json[r'weeklyExp'] = null;
    }
    if (this.dailyExp != null) {
      json[r'dailyExp'] = this.dailyExp;
    } else {
      json[r'dailyExp'] = null;
    }
    return json;
  }

  /// Returns a new [BoardNames] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BoardNames? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "BoardNames[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "BoardNames[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BoardNames(
        exp: mapValueOfType<String>(json, r'exp'),
        weeklyExp: mapValueOfType<String>(json, r'weeklyExp'),
        dailyExp: mapValueOfType<String>(json, r'dailyExp'),
      );
    }
    return null;
  }

  static List<BoardNames> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BoardNames>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BoardNames.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BoardNames> mapFromJson(dynamic json) {
    final map = <String, BoardNames>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BoardNames.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BoardNames-objects as value to a dart map
  static Map<String, List<BoardNames>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BoardNames>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BoardNames.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

