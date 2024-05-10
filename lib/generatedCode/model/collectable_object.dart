//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CollectableObject {
  /// Returns a new [CollectableObject] instance.
  CollectableObject({
    this.category,
    this.name,
    this.locale,
    this.metadata = const {},
    this.description,
    this.value,
  });

  String? category;

  String? name;

  String? locale;

  Map<String, String>? metadata;

  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CollectableObject &&
    other.category == category &&
    other.name == name &&
    other.locale == locale &&
    _deepEquality.equals(other.metadata, metadata) &&
    other.description == description &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (category == null ? 0 : category!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (locale == null ? 0 : locale!.hashCode) +
    (metadata == null ? 0 : metadata!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'CollectableObject[category=$category, name=$name, locale=$locale, metadata=$metadata, description=$description, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.category != null) {
      json[r'category'] = this.category;
    } else {
      json[r'category'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.locale != null) {
      json[r'locale'] = this.locale;
    } else {
      json[r'locale'] = null;
    }
    if (this.metadata != null) {
      json[r'metadata'] = this.metadata;
    } else {
      json[r'metadata'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [CollectableObject] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CollectableObject? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CollectableObject[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CollectableObject[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CollectableObject(
        category: mapValueOfType<String>(json, r'category'),
        name: mapValueOfType<String>(json, r'name'),
        locale: mapValueOfType<String>(json, r'locale'),
        metadata: mapCastOfType<String, String>(json, r'metadata') ?? const {},
        description: mapValueOfType<String>(json, r'description'),
        value: mapValueOfType<int>(json, r'value'),
      );
    }
    return null;
  }

  static List<CollectableObject> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CollectableObject>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CollectableObject.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CollectableObject> mapFromJson(dynamic json) {
    final map = <String, CollectableObject>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CollectableObject.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CollectableObject-objects as value to a dart map
  static Map<String, List<CollectableObject>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CollectableObject>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CollectableObject.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

