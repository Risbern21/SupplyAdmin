// This is a generated file - do not edit.
//
// Generated from disruption.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class DisruptionRisk extends $pb.GeneratedMessage {
  factory DisruptionRisk({
    $core.String? shipmentId,
    $core.String? type,
    $core.String? severity,
    $core.String? description,
    $1.Timestamp? detectedAt,
  }) {
    final result = create();
    if (shipmentId != null) result.shipmentId = shipmentId;
    if (type != null) result.type = type;
    if (severity != null) result.severity = severity;
    if (description != null) result.description = description;
    if (detectedAt != null) result.detectedAt = detectedAt;
    return result;
  }

  DisruptionRisk._();

  factory DisruptionRisk.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DisruptionRisk.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DisruptionRisk',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'shipmentId')
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..aOS(3, _omitFieldNames ? '' : 'severity')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'detectedAt',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DisruptionRisk clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DisruptionRisk copyWith(void Function(DisruptionRisk) updates) =>
      super.copyWith((message) => updates(message as DisruptionRisk))
          as DisruptionRisk;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisruptionRisk create() => DisruptionRisk._();
  @$core.override
  DisruptionRisk createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DisruptionRisk getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DisruptionRisk>(create);
  static DisruptionRisk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get shipmentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set shipmentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasShipmentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearShipmentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get severity => $_getSZ(2);
  @$pb.TagNumber(3)
  set severity($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSeverity() => $_has(2);
  @$pb.TagNumber(3)
  void clearSeverity() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);

  @$pb.TagNumber(5)
  $1.Timestamp get detectedAt => $_getN(4);
  @$pb.TagNumber(5)
  set detectedAt($1.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDetectedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearDetectedAt() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureDetectedAt() => $_ensure(4);
}

class AnalyzeShipmentRequest extends $pb.GeneratedMessage {
  factory AnalyzeShipmentRequest({
    $core.String? shipmentId,
  }) {
    final result = create();
    if (shipmentId != null) result.shipmentId = shipmentId;
    return result;
  }

  AnalyzeShipmentRequest._();

  factory AnalyzeShipmentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyzeShipmentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyzeShipmentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'shipmentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyzeShipmentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyzeShipmentRequest copyWith(
          void Function(AnalyzeShipmentRequest) updates) =>
      super.copyWith((message) => updates(message as AnalyzeShipmentRequest))
          as AnalyzeShipmentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyzeShipmentRequest create() => AnalyzeShipmentRequest._();
  @$core.override
  AnalyzeShipmentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyzeShipmentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyzeShipmentRequest>(create);
  static AnalyzeShipmentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get shipmentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set shipmentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasShipmentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearShipmentId() => $_clearField(1);
}

class AnalyzeShipmentResponse extends $pb.GeneratedMessage {
  factory AnalyzeShipmentResponse({
    $core.String? shipmentId,
    $core.Iterable<DisruptionRisk>? risks,
    $core.bool? rerouted,
  }) {
    final result = create();
    if (shipmentId != null) result.shipmentId = shipmentId;
    if (risks != null) result.risks.addAll(risks);
    if (rerouted != null) result.rerouted = rerouted;
    return result;
  }

  AnalyzeShipmentResponse._();

  factory AnalyzeShipmentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalyzeShipmentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalyzeShipmentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'shipmentId')
    ..pPM<DisruptionRisk>(2, _omitFieldNames ? '' : 'risks',
        subBuilder: DisruptionRisk.create)
    ..aOB(3, _omitFieldNames ? '' : 'rerouted')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyzeShipmentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalyzeShipmentResponse copyWith(
          void Function(AnalyzeShipmentResponse) updates) =>
      super.copyWith((message) => updates(message as AnalyzeShipmentResponse))
          as AnalyzeShipmentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyzeShipmentResponse create() => AnalyzeShipmentResponse._();
  @$core.override
  AnalyzeShipmentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalyzeShipmentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalyzeShipmentResponse>(create);
  static AnalyzeShipmentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get shipmentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set shipmentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasShipmentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearShipmentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<DisruptionRisk> get risks => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get rerouted => $_getBF(2);
  @$pb.TagNumber(3)
  set rerouted($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRerouted() => $_has(2);
  @$pb.TagNumber(3)
  void clearRerouted() => $_clearField(3);
}

class ListDisruptionsRequest extends $pb.GeneratedMessage {
  factory ListDisruptionsRequest({
    $core.String? severity,
  }) {
    final result = create();
    if (severity != null) result.severity = severity;
    return result;
  }

  ListDisruptionsRequest._();

  factory ListDisruptionsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDisruptionsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDisruptionsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'severity')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDisruptionsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDisruptionsRequest copyWith(
          void Function(ListDisruptionsRequest) updates) =>
      super.copyWith((message) => updates(message as ListDisruptionsRequest))
          as ListDisruptionsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDisruptionsRequest create() => ListDisruptionsRequest._();
  @$core.override
  ListDisruptionsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDisruptionsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDisruptionsRequest>(create);
  static ListDisruptionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get severity => $_getSZ(0);
  @$pb.TagNumber(1)
  set severity($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSeverity() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeverity() => $_clearField(1);
}

class ListDisruptionsResponse extends $pb.GeneratedMessage {
  factory ListDisruptionsResponse({
    $core.Iterable<DisruptionRisk>? disruptions,
  }) {
    final result = create();
    if (disruptions != null) result.disruptions.addAll(disruptions);
    return result;
  }

  ListDisruptionsResponse._();

  factory ListDisruptionsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDisruptionsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDisruptionsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..pPM<DisruptionRisk>(1, _omitFieldNames ? '' : 'disruptions',
        subBuilder: DisruptionRisk.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDisruptionsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDisruptionsResponse copyWith(
          void Function(ListDisruptionsResponse) updates) =>
      super.copyWith((message) => updates(message as ListDisruptionsResponse))
          as ListDisruptionsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDisruptionsResponse create() => ListDisruptionsResponse._();
  @$core.override
  ListDisruptionsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDisruptionsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDisruptionsResponse>(create);
  static ListDisruptionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DisruptionRisk> get disruptions => $_getList(0);
}

class WatchDisruptionsRequest extends $pb.GeneratedMessage {
  factory WatchDisruptionsRequest({
    $core.String? ownerId,
  }) {
    final result = create();
    if (ownerId != null) result.ownerId = ownerId;
    return result;
  }

  WatchDisruptionsRequest._();

  factory WatchDisruptionsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WatchDisruptionsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WatchDisruptionsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ownerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WatchDisruptionsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WatchDisruptionsRequest copyWith(
          void Function(WatchDisruptionsRequest) updates) =>
      super.copyWith((message) => updates(message as WatchDisruptionsRequest))
          as WatchDisruptionsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WatchDisruptionsRequest create() => WatchDisruptionsRequest._();
  @$core.override
  WatchDisruptionsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WatchDisruptionsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WatchDisruptionsRequest>(create);
  static WatchDisruptionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ownerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set ownerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerId() => $_clearField(1);
}

class WatchDisruptionsResponse extends $pb.GeneratedMessage {
  factory WatchDisruptionsResponse({
    $core.String? shipmentId,
    DisruptionRisk? risk,
    $core.String? suggestedAction,
    $1.Timestamp? alertTime,
  }) {
    final result = create();
    if (shipmentId != null) result.shipmentId = shipmentId;
    if (risk != null) result.risk = risk;
    if (suggestedAction != null) result.suggestedAction = suggestedAction;
    if (alertTime != null) result.alertTime = alertTime;
    return result;
  }

  WatchDisruptionsResponse._();

  factory WatchDisruptionsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WatchDisruptionsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WatchDisruptionsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'shipmentId')
    ..aOM<DisruptionRisk>(2, _omitFieldNames ? '' : 'risk',
        subBuilder: DisruptionRisk.create)
    ..aOS(3, _omitFieldNames ? '' : 'suggestedAction')
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'alertTime',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WatchDisruptionsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WatchDisruptionsResponse copyWith(
          void Function(WatchDisruptionsResponse) updates) =>
      super.copyWith((message) => updates(message as WatchDisruptionsResponse))
          as WatchDisruptionsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WatchDisruptionsResponse create() => WatchDisruptionsResponse._();
  @$core.override
  WatchDisruptionsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WatchDisruptionsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WatchDisruptionsResponse>(create);
  static WatchDisruptionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get shipmentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set shipmentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasShipmentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearShipmentId() => $_clearField(1);

  @$pb.TagNumber(2)
  DisruptionRisk get risk => $_getN(1);
  @$pb.TagNumber(2)
  set risk(DisruptionRisk value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRisk() => $_has(1);
  @$pb.TagNumber(2)
  void clearRisk() => $_clearField(2);
  @$pb.TagNumber(2)
  DisruptionRisk ensureRisk() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get suggestedAction => $_getSZ(2);
  @$pb.TagNumber(3)
  set suggestedAction($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSuggestedAction() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuggestedAction() => $_clearField(3);

  @$pb.TagNumber(4)
  $1.Timestamp get alertTime => $_getN(3);
  @$pb.TagNumber(4)
  set alertTime($1.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasAlertTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearAlertTime() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureAlertTime() => $_ensure(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
