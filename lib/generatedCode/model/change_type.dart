//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ChangeType {
  /// Instantiate a new enum with the provided [value].
  const ChangeType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const unknown = ChangeType._(r'Unknown');
  static const exp = ChangeType._(r'Exp');
  static const skip = ChangeType._(r'Skip');

  /// List of all possible values in this [enum][ChangeType].
  static const values = <ChangeType>[
    unknown,
    exp,
    skip,
  ];

  static ChangeType? fromJson(dynamic value) => ChangeTypeTypeTransformer().decode(value);

  static List<ChangeType> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChangeType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChangeType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ChangeType] to String,
/// and [decode] dynamic data back to [ChangeType].
class ChangeTypeTypeTransformer {
  factory ChangeTypeTypeTransformer() => _instance ??= const ChangeTypeTypeTransformer._();

  const ChangeTypeTypeTransformer._();

  String encode(ChangeType data) => data.value;

  /// Decodes a [dynamic value][data] to a ChangeType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ChangeType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Unknown': return ChangeType.unknown;
        case r'Exp': return ChangeType.exp;
        case r'Skip': return ChangeType.skip;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ChangeTypeTypeTransformer] instance.
  static ChangeTypeTypeTransformer? _instance;
}

