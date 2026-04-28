// This is a generated file - do not edit.
//
// Generated from route.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class RoutePoint extends $pb.GeneratedMessage {
  factory RoutePoint({
    $core.double? lat,
    $core.double? lng,
    $core.String? label,
    $core.int? sequence,
  }) {
    final result = create();
    if (lat != null) result.lat = lat;
    if (lng != null) result.lng = lng;
    if (label != null) result.label = label;
    if (sequence != null) result.sequence = sequence;
    return result;
  }

  RoutePoint._();

  factory RoutePoint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoutePoint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoutePoint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'lat')
    ..aD(2, _omitFieldNames ? '' : 'lng')
    ..aOS(3, _omitFieldNames ? '' : 'label')
    ..aI(4, _omitFieldNames ? '' : 'sequence')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoutePoint clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoutePoint copyWith(void Function(RoutePoint) updates) =>
      super.copyWith((message) => updates(message as RoutePoint)) as RoutePoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoutePoint create() => RoutePoint._();
  @$core.override
  RoutePoint createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoutePoint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoutePoint>(create);
  static RoutePoint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get lat => $_getN(0);
  @$pb.TagNumber(1)
  set lat($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLat() => $_has(0);
  @$pb.TagNumber(1)
  void clearLat() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get lng => $_getN(1);
  @$pb.TagNumber(2)
  set lng($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLng() => $_has(1);
  @$pb.TagNumber(2)
  void clearLng() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get label => $_getSZ(2);
  @$pb.TagNumber(3)
  set label($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLabel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLabel() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get sequence => $_getIZ(3);
  @$pb.TagNumber(4)
  set sequence($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSequence() => $_has(3);
  @$pb.TagNumber(4)
  void clearSequence() => $_clearField(4);
}

class Route extends $pb.GeneratedMessage {
  factory Route({
    $core.String? shipmentId,
    $core.Iterable<RoutePoint>? points,
    $core.double? estimatedDurationMinutes,
    $core.double? distanceKm,
    $core.String? reason,
  }) {
    final result = create();
    if (shipmentId != null) result.shipmentId = shipmentId;
    if (points != null) result.points.addAll(points);
    if (estimatedDurationMinutes != null)
      result.estimatedDurationMinutes = estimatedDurationMinutes;
    if (distanceKm != null) result.distanceKm = distanceKm;
    if (reason != null) result.reason = reason;
    return result;
  }

  Route._();

  factory Route.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Route.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Route',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'shipmentId')
    ..pPM<RoutePoint>(2, _omitFieldNames ? '' : 'points',
        subBuilder: RoutePoint.create)
    ..aD(3, _omitFieldNames ? '' : 'estimatedDurationMinutes')
    ..aD(4, _omitFieldNames ? '' : 'distanceKm')
    ..aOS(5, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Route clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Route copyWith(void Function(Route) updates) =>
      super.copyWith((message) => updates(message as Route)) as Route;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Route create() => Route._();
  @$core.override
  Route createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Route getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Route>(create);
  static Route? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get shipmentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set shipmentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasShipmentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearShipmentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<RoutePoint> get points => $_getList(1);

  @$pb.TagNumber(3)
  $core.double get estimatedDurationMinutes => $_getN(2);
  @$pb.TagNumber(3)
  set estimatedDurationMinutes($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEstimatedDurationMinutes() => $_has(2);
  @$pb.TagNumber(3)
  void clearEstimatedDurationMinutes() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get distanceKm => $_getN(3);
  @$pb.TagNumber(4)
  set distanceKm($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDistanceKm() => $_has(3);
  @$pb.TagNumber(4)
  void clearDistanceKm() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get reason => $_getSZ(4);
  @$pb.TagNumber(5)
  set reason($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReason() => $_has(4);
  @$pb.TagNumber(5)
  void clearReason() => $_clearField(5);
}

class OptimizeRouteRequest extends $pb.GeneratedMessage {
  factory OptimizeRouteRequest({
    $core.String? shipmentId,
    $core.Iterable<$core.String>? avoidTypes,
  }) {
    final result = create();
    if (shipmentId != null) result.shipmentId = shipmentId;
    if (avoidTypes != null) result.avoidTypes.addAll(avoidTypes);
    return result;
  }

  OptimizeRouteRequest._();

  factory OptimizeRouteRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OptimizeRouteRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OptimizeRouteRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'shipmentId')
    ..pPS(2, _omitFieldNames ? '' : 'avoidTypes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OptimizeRouteRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OptimizeRouteRequest copyWith(void Function(OptimizeRouteRequest) updates) =>
      super.copyWith((message) => updates(message as OptimizeRouteRequest))
          as OptimizeRouteRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OptimizeRouteRequest create() => OptimizeRouteRequest._();
  @$core.override
  OptimizeRouteRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OptimizeRouteRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OptimizeRouteRequest>(create);
  static OptimizeRouteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get shipmentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set shipmentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasShipmentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearShipmentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get avoidTypes => $_getList(1);
}

class GetRouteRequest extends $pb.GeneratedMessage {
  factory GetRouteRequest({
    $core.String? shipmentId,
  }) {
    final result = create();
    if (shipmentId != null) result.shipmentId = shipmentId;
    return result;
  }

  GetRouteRequest._();

  factory GetRouteRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetRouteRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRouteRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'shipmentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRouteRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRouteRequest copyWith(void Function(GetRouteRequest) updates) =>
      super.copyWith((message) => updates(message as GetRouteRequest))
          as GetRouteRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRouteRequest create() => GetRouteRequest._();
  @$core.override
  GetRouteRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetRouteRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRouteRequest>(create);
  static GetRouteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get shipmentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set shipmentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasShipmentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearShipmentId() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
