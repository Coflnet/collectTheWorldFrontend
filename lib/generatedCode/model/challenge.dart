//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Challenge {
  /// Returns a new [Challenge] instance.
  Challenge({
    this.userId,
    this.date,
    this.type,
    this.progress,
    this.target,
    this.reward,
    this.rewardPaid,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? userId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? date;

  String? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? progress;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? target;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? reward;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? rewardPaid;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Challenge &&
    other.userId == userId &&
    other.date == date &&
    other.type == type &&
    other.progress == progress &&
    other.target == target &&
    other.reward == reward &&
    other.rewardPaid == rewardPaid;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (userId == null ? 0 : userId!.hashCode) +
    (date == null ? 0 : date!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (progress == null ? 0 : progress!.hashCode) +
    (target == null ? 0 : target!.hashCode) +
    (reward == null ? 0 : reward!.hashCode) +
    (rewardPaid == null ? 0 : rewardPaid!.hashCode);

  @override
  String toString() => 'Challenge[userId=$userId, date=$date, type=$type, progress=$progress, target=$target, reward=$reward, rewardPaid=$rewardPaid]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.userId != null) {
      json[r'userId'] = this.userId;
    } else {
      json[r'userId'] = null;
    }
    if (this.date != null) {
      json[r'date'] = this.date!.toUtc().toIso8601String();
    } else {
      json[r'date'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.progress != null) {
      json[r'progress'] = this.progress;
    } else {
      json[r'progress'] = null;
    }
    if (this.target != null) {
      json[r'target'] = this.target;
    } else {
      json[r'target'] = null;
    }
    if (this.reward != null) {
      json[r'reward'] = this.reward;
    } else {
      json[r'reward'] = null;
    }
    if (this.rewardPaid != null) {
      json[r'rewardPaid'] = this.rewardPaid;
    } else {
      json[r'rewardPaid'] = null;
    }
    return json;
  }

  /// Returns a new [Challenge] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Challenge? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Challenge[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Challenge[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Challenge(
        userId: mapValueOfType<String>(json, r'userId'),
        date: mapDateTime(json, r'date', r''),
        type: mapValueOfType<String>(json, r'type'),
        progress: mapValueOfType<int>(json, r'progress'),
        target: mapValueOfType<int>(json, r'target'),
        reward: mapValueOfType<int>(json, r'reward'),
        rewardPaid: mapValueOfType<bool>(json, r'rewardPaid'),
      );
    }
    return null;
  }

  static List<Challenge> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Challenge>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Challenge.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Challenge> mapFromJson(dynamic json) {
    final map = <String, Challenge>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Challenge.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Challenge-objects as value to a dart map
  static Map<String, List<Challenge>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Challenge>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Challenge.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

