//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConsentData {
  /// Returns a new [ConsentData] instance.
  ConsentData({
    this.givenAt,
    this.targetedAds,
    this.tracking,
    this.analytics,
    this.allowResell,
    this.newService,
  });

  /// When the consent was given, updated when storing
  DateTime? givenAt;

  /// Accepted all targeting
  bool? targetedAds;

  /// Accepted (ad) tracking
  bool? tracking;

  /// Analytics
  bool? analytics;

  /// Licenses for content
  bool? allowResell;

  /// Allow to use data for new services, AI, etc.
  bool? newService;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ConsentData &&
    other.givenAt == givenAt &&
    other.targetedAds == targetedAds &&
    other.tracking == tracking &&
    other.analytics == analytics &&
    other.allowResell == allowResell &&
    other.newService == newService;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (givenAt == null ? 0 : givenAt!.hashCode) +
    (targetedAds == null ? 0 : targetedAds!.hashCode) +
    (tracking == null ? 0 : tracking!.hashCode) +
    (analytics == null ? 0 : analytics!.hashCode) +
    (allowResell == null ? 0 : allowResell!.hashCode) +
    (newService == null ? 0 : newService!.hashCode);

  @override
  String toString() => 'ConsentData[givenAt=$givenAt, targetedAds=$targetedAds, tracking=$tracking, analytics=$analytics, allowResell=$allowResell, newService=$newService]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.givenAt != null) {
      json[r'givenAt'] = this.givenAt!.toUtc().toIso8601String();
    } else {
      json[r'givenAt'] = null;
    }
    if (this.targetedAds != null) {
      json[r'targetedAds'] = this.targetedAds;
    } else {
      json[r'targetedAds'] = null;
    }
    if (this.tracking != null) {
      json[r'tracking'] = this.tracking;
    } else {
      json[r'tracking'] = null;
    }
    if (this.analytics != null) {
      json[r'analytics'] = this.analytics;
    } else {
      json[r'analytics'] = null;
    }
    if (this.allowResell != null) {
      json[r'allowResell'] = this.allowResell;
    } else {
      json[r'allowResell'] = null;
    }
    if (this.newService != null) {
      json[r'newService'] = this.newService;
    } else {
      json[r'newService'] = null;
    }
    return json;
  }

  /// Returns a new [ConsentData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConsentData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ConsentData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ConsentData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ConsentData(
        givenAt: mapDateTime(json, r'givenAt', r''),
        targetedAds: mapValueOfType<bool>(json, r'targetedAds'),
        tracking: mapValueOfType<bool>(json, r'tracking'),
        analytics: mapValueOfType<bool>(json, r'analytics'),
        allowResell: mapValueOfType<bool>(json, r'allowResell'),
        newService: mapValueOfType<bool>(json, r'newService'),
      );
    }
    return null;
  }

  static List<ConsentData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ConsentData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConsentData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConsentData> mapFromJson(dynamic json) {
    final map = <String, ConsentData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConsentData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConsentData-objects as value to a dart map
  static Map<String, List<ConsentData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ConsentData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConsentData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

