//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ChangeEvent {
  /// Returns a new [ChangeEvent] instance.
  ChangeEvent({
    this.userId,
    this.time,
    this.change,
    this.source_,
    this.reference,
    this.description,
    this.type,
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
  DateTime? time;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? change;

  String? source_;

  String? reference;

  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ChangeType? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChangeEvent &&
    other.userId == userId &&
    other.time == time &&
    other.change == change &&
    other.source_ == source_ &&
    other.reference == reference &&
    other.description == description &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (userId == null ? 0 : userId!.hashCode) +
    (time == null ? 0 : time!.hashCode) +
    (change == null ? 0 : change!.hashCode) +
    (source_ == null ? 0 : source_!.hashCode) +
    (reference == null ? 0 : reference!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'ChangeEvent[userId=$userId, time=$time, change=$change, source_=$source_, reference=$reference, description=$description, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.userId != null) {
      json[r'userId'] = this.userId;
    } else {
      json[r'userId'] = null;
    }
    if (this.time != null) {
      json[r'time'] = this.time!.toUtc().toIso8601String();
    } else {
      json[r'time'] = null;
    }
    if (this.change != null) {
      json[r'change'] = this.change;
    } else {
      json[r'change'] = null;
    }
    if (this.source_ != null) {
      json[r'source'] = this.source_;
    } else {
      json[r'source'] = null;
    }
    if (this.reference != null) {
      json[r'reference'] = this.reference;
    } else {
      json[r'reference'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [ChangeEvent] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChangeEvent? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ChangeEvent[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ChangeEvent[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ChangeEvent(
        userId: mapValueOfType<String>(json, r'userId'),
        time: mapDateTime(json, r'time', r''),
        change: mapValueOfType<int>(json, r'change'),
        source_: mapValueOfType<String>(json, r'source'),
        reference: mapValueOfType<String>(json, r'reference'),
        description: mapValueOfType<String>(json, r'description'),
        type: ChangeType.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<ChangeEvent> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChangeEvent>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChangeEvent.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChangeEvent> mapFromJson(dynamic json) {
    final map = <String, ChangeEvent>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChangeEvent.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChangeEvent-objects as value to a dart map
  static Map<String, List<ChangeEvent>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChangeEvent>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ChangeEvent.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

