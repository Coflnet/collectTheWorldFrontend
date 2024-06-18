//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UploadRewards {
  /// Returns a new [UploadRewards] instance.
  UploadRewards({
    this.total,
    this.multiplier,
    this.imageBonus,
    this.isCurrent,
    this.unique,
    this.dailyItemReward,
    this.dailyQuestReward,
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
  double? multiplier;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? imageBonus;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isCurrent;

  /// Has never been uploaded before
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? unique;

  /// If and how much reward was added because item is one of daily items
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? dailyItemReward;

  /// How much was added because of daily quest
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? dailyQuestReward;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UploadRewards &&
    other.total == total &&
    other.multiplier == multiplier &&
    other.imageBonus == imageBonus &&
    other.isCurrent == isCurrent &&
    other.unique == unique &&
    other.dailyItemReward == dailyItemReward &&
    other.dailyQuestReward == dailyQuestReward;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (total == null ? 0 : total!.hashCode) +
    (multiplier == null ? 0 : multiplier!.hashCode) +
    (imageBonus == null ? 0 : imageBonus!.hashCode) +
    (isCurrent == null ? 0 : isCurrent!.hashCode) +
    (unique == null ? 0 : unique!.hashCode) +
    (dailyItemReward == null ? 0 : dailyItemReward!.hashCode) +
    (dailyQuestReward == null ? 0 : dailyQuestReward!.hashCode);

  @override
  String toString() => 'UploadRewards[total=$total, multiplier=$multiplier, imageBonus=$imageBonus, isCurrent=$isCurrent, unique=$unique, dailyItemReward=$dailyItemReward, dailyQuestReward=$dailyQuestReward]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.total != null) {
      json[r'total'] = this.total;
    } else {
      json[r'total'] = null;
    }
    if (this.multiplier != null) {
      json[r'multiplier'] = this.multiplier;
    } else {
      json[r'multiplier'] = null;
    }
    if (this.imageBonus != null) {
      json[r'imageBonus'] = this.imageBonus;
    } else {
      json[r'imageBonus'] = null;
    }
    if (this.isCurrent != null) {
      json[r'isCurrent'] = this.isCurrent;
    } else {
      json[r'isCurrent'] = null;
    }
    if (this.unique != null) {
      json[r'unique'] = this.unique;
    } else {
      json[r'unique'] = null;
    }
    if (this.dailyItemReward != null) {
      json[r'dailyItemReward'] = this.dailyItemReward;
    } else {
      json[r'dailyItemReward'] = null;
    }
    if (this.dailyQuestReward != null) {
      json[r'dailyQuestReward'] = this.dailyQuestReward;
    } else {
      json[r'dailyQuestReward'] = null;
    }
    return json;
  }

  /// Returns a new [UploadRewards] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UploadRewards? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UploadRewards[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UploadRewards[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UploadRewards(
        total: mapValueOfType<int>(json, r'total'),
        multiplier: mapValueOfType<double>(json, r'multiplier'),
        imageBonus: mapValueOfType<int>(json, r'imageBonus'),
        isCurrent: mapValueOfType<bool>(json, r'isCurrent'),
        unique: mapValueOfType<bool>(json, r'unique'),
        dailyItemReward: mapValueOfType<int>(json, r'dailyItemReward'),
        dailyQuestReward: mapValueOfType<int>(json, r'dailyQuestReward'),
      );
    }
    return null;
  }

  static List<UploadRewards> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UploadRewards>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UploadRewards.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UploadRewards> mapFromJson(dynamic json) {
    final map = <String, UploadRewards>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UploadRewards.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UploadRewards-objects as value to a dart map
  static Map<String, List<UploadRewards>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UploadRewards>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UploadRewards.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

