// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slang_base_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SlangBaseStateIdleImpl _$$SlangBaseStateIdleImplFromJson(
        Map<String, dynamic> json) =>
    _$SlangBaseStateIdleImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SlangBaseStateIdleImplToJson(
        _$SlangBaseStateIdleImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$SlangBaseStateDataImpl _$$SlangBaseStateDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SlangBaseStateDataImpl(
      version: (json['version'] as num).toInt(),
      contactData: json['contactData'] == null
          ? const UserContactData()
          : UserContactData.fromJson(
              json['contactData'] as Map<String, dynamic>),
      languageCode: json['languageCode'] as String,
      slangJson: json['slangJson'] as Map<String, dynamic>,
      hasChanges: json['hasChanges'] as bool,
      isSubmitted: json['isSubmitted'] as bool,
      approvedKeys: (json['approvedKeys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      lastSelectedKey: json['lastSelectedKey'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SlangBaseStateDataImplToJson(
        _$SlangBaseStateDataImpl instance) =>
    <String, dynamic>{
      'version': instance.version,
      'contactData': instance.contactData,
      'languageCode': instance.languageCode,
      'slangJson': instance.slangJson,
      'hasChanges': instance.hasChanges,
      'isSubmitted': instance.isSubmitted,
      'approvedKeys': instance.approvedKeys,
      'lastSelectedKey': instance.lastSelectedKey,
      'runtimeType': instance.$type,
    };

_$UserContactDataImpl _$$UserContactDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UserContactDataImpl(
      email: json['email'] as String?,
      name: json['name'] as String?,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$$UserContactDataImplToJson(
        _$UserContactDataImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'website': instance.website,
    };
