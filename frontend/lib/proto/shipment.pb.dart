// This is a generated file - do not edit.
//
// Generated from shipment.proto.

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

class Location extends $pb.GeneratedMessage {
  factory Location({
    $core.double? lat,
    $core.double? lng,
    $core.String? name,
  }) {
    final result = create();
    if (lat != null) result.lat = lat;
    if (lng != null) result.lng = lng;
    if (name != null) result.name = name;
    return result;
  }

  Location._();

  factory Location.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Location.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Location',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'lat')
    ..aD(2, _omitFieldNames ? '' : 'lng')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Location clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Location copyWith(void Function(Location) updates) =>
      super.copyWith((message) => updates(message as Location)) as Location;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Location create() => Location._();
  @$core.override
  Location createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Location getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Location>(create);
  static Location? _defaultInstance;

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
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);
}

class Shipment extends $pb.GeneratedMessage {
  factory Shipment({
    $core.String? id,
    $core.String? ownerId,
    Location? origin,
    Location? destination,
    Location? currentLocation,
    $core.Iterable<Location>? routePoints,
    $core.String? status,
    $core.String? carrier,
    $1.Timestamp? estimatedArrival,
    $1.Timestamp? createdAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (ownerId != null) result.ownerId = ownerId;
    if (origin != null) result.origin = origin;
    if (destination != null) result.destination = destination;
    if (currentLocation != null) result.currentLocation = currentLocation;
    if (routePoints != null) result.routePoints.addAll(routePoints);
    if (status != null) result.status = status;
    if (carrier != null) result.carrier = carrier;
    if (estimatedArrival != null) result.estimatedArrival = estimatedArrival;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  Shipment._();

  factory Shipment.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Shipment.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Shipment',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'ownerId')
    ..aOM<Location>(3, _omitFieldNames ? '' : 'origin',
        subBuilder: Location.create)
    ..aOM<Location>(4, _omitFieldNames ? '' : 'destination',
        subBuilder: Location.create)
    ..aOM<Location>(5, _omitFieldNames ? '' : 'currentLocation',
        subBuilder: Location.create)
    ..pPM<Location>(6, _omitFieldNames ? '' : 'routePoints',
        subBuilder: Location.create)
    ..aOS(7, _omitFieldNames ? '' : 'status')
    ..aOS(8, _omitFieldNames ? '' : 'carrier')
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'estimatedArrival',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(10, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Shipment clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Shipment copyWith(void Function(Shipment) updates) =>
      super.copyWith((message) => updates(message as Shipment)) as Shipment;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Shipment create() => Shipment._();
  @$core.override
  Shipment createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Shipment getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Shipment>(create);
  static Shipment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get ownerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set ownerId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerId() => $_clearField(2);

  @$pb.TagNumber(3)
  Location get origin => $_getN(2);
  @$pb.TagNumber(3)
  set origin(Location value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasOrigin() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrigin() => $_clearField(3);
  @$pb.TagNumber(3)
  Location ensureOrigin() => $_ensure(2);

  @$pb.TagNumber(4)
  Location get destination => $_getN(3);
  @$pb.TagNumber(4)
  set destination(Location value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasDestination() => $_has(3);
  @$pb.TagNumber(4)
  void clearDestination() => $_clearField(4);
  @$pb.TagNumber(4)
  Location ensureDestination() => $_ensure(3);

  @$pb.TagNumber(5)
  Location get currentLocation => $_getN(4);
  @$pb.TagNumber(5)
  set currentLocation(Location value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCurrentLocation() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrentLocation() => $_clearField(5);
  @$pb.TagNumber(5)
  Location ensureCurrentLocation() => $_ensure(4);

  @$pb.TagNumber(6)
  $pb.PbList<Location> get routePoints => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get status => $_getSZ(6);
  @$pb.TagNumber(7)
  set status($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get carrier => $_getSZ(7);
  @$pb.TagNumber(8)
  set carrier($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCarrier() => $_has(7);
  @$pb.TagNumber(8)
  void clearCarrier() => $_clearField(8);

  @$pb.TagNumber(9)
  $1.Timestamp get estimatedArrival => $_getN(8);
  @$pb.TagNumber(9)
  set estimatedArrival($1.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasEstimatedArrival() => $_has(8);
  @$pb.TagNumber(9)
  void clearEstimatedArrival() => $_clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureEstimatedArrival() => $_ensure(8);

  @$pb.TagNumber(10)
  $1.Timestamp get createdAt => $_getN(9);
  @$pb.TagNumber(10)
  set createdAt($1.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasCreatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreatedAt() => $_clearField(10);
  @$pb.TagNumber(10)
  $1.Timestamp ensureCreatedAt() => $_ensure(9);
}

class CreateShipmentRequest extends $pb.GeneratedMessage {
  factory CreateShipmentRequest({
    $core.String? ownerId,
    Location? origin,
    Location? destination,
    $core.String? carrier,
    $1.Timestamp? estimatedArrival,
  }) {
    final result = create();
    if (ownerId != null) result.ownerId = ownerId;
    if (origin != null) result.origin = origin;
    if (destination != null) result.destination = destination;
    if (carrier != null) result.carrier = carrier;
    if (estimatedArrival != null) result.estimatedArrival = estimatedArrival;
    return result;
  }

  CreateShipmentRequest._();

  factory CreateShipmentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateShipmentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateShipmentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ownerId')
    ..aOM<Location>(2, _omitFieldNames ? '' : 'origin',
        subBuilder: Location.create)
    ..aOM<Location>(3, _omitFieldNames ? '' : 'destination',
        subBuilder: Location.create)
    ..aOS(4, _omitFieldNames ? '' : 'carrier')
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'estimatedArrival',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateShipmentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateShipmentRequest copyWith(
          void Function(CreateShipmentRequest) updates) =>
      super.copyWith((message) => updates(message as CreateShipmentRequest))
          as CreateShipmentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateShipmentRequest create() => CreateShipmentRequest._();
  @$core.override
  CreateShipmentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateShipmentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateShipmentRequest>(create);
  static CreateShipmentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ownerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set ownerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerId() => $_clearField(1);

  @$pb.TagNumber(2)
  Location get origin => $_getN(1);
  @$pb.TagNumber(2)
  set origin(Location value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOrigin() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrigin() => $_clearField(2);
  @$pb.TagNumber(2)
  Location ensureOrigin() => $_ensure(1);

  @$pb.TagNumber(3)
  Location get destination => $_getN(2);
  @$pb.TagNumber(3)
  set destination(Location value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDestination() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestination() => $_clearField(3);
  @$pb.TagNumber(3)
  Location ensureDestination() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get carrier => $_getSZ(3);
  @$pb.TagNumber(4)
  set carrier($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCarrier() => $_has(3);
  @$pb.TagNumber(4)
  void clearCarrier() => $_clearField(4);

  @$pb.TagNumber(5)
  $1.Timestamp get estimatedArrival => $_getN(4);
  @$pb.TagNumber(5)
  set estimatedArrival($1.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasEstimatedArrival() => $_has(4);
  @$pb.TagNumber(5)
  void clearEstimatedArrival() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureEstimatedArrival() => $_ensure(4);
}

class GetShipmentRequest extends $pb.GeneratedMessage {
  factory GetShipmentRequest({
    $core.String? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  GetShipmentRequest._();

  factory GetShipmentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetShipmentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetShipmentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetShipmentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetShipmentRequest copyWith(void Function(GetShipmentRequest) updates) =>
      super.copyWith((message) => updates(message as GetShipmentRequest))
          as GetShipmentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetShipmentRequest create() => GetShipmentRequest._();
  @$core.override
  GetShipmentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetShipmentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetShipmentRequest>(create);
  static GetShipmentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class UpdateShipmentRequest extends $pb.GeneratedMessage {
  factory UpdateShipmentRequest({
    $core.String? id,
    Location? currentLocation,
    $core.String? status,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (currentLocation != null) result.currentLocation = currentLocation;
    if (status != null) result.status = status;
    return result;
  }

  UpdateShipmentRequest._();

  factory UpdateShipmentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateShipmentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateShipmentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOM<Location>(2, _omitFieldNames ? '' : 'currentLocation',
        subBuilder: Location.create)
    ..aOS(3, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateShipmentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateShipmentRequest copyWith(
          void Function(UpdateShipmentRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateShipmentRequest))
          as UpdateShipmentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateShipmentRequest create() => UpdateShipmentRequest._();
  @$core.override
  UpdateShipmentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateShipmentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateShipmentRequest>(create);
  static UpdateShipmentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  Location get currentLocation => $_getN(1);
  @$pb.TagNumber(2)
  set currentLocation(Location value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCurrentLocation() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentLocation() => $_clearField(2);
  @$pb.TagNumber(2)
  Location ensureCurrentLocation() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get status => $_getSZ(2);
  @$pb.TagNumber(3)
  set status($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);
}

class DeleteShipmentRequest extends $pb.GeneratedMessage {
  factory DeleteShipmentRequest({
    $core.String? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  DeleteShipmentRequest._();

  factory DeleteShipmentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteShipmentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteShipmentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteShipmentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteShipmentRequest copyWith(
          void Function(DeleteShipmentRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteShipmentRequest))
          as DeleteShipmentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteShipmentRequest create() => DeleteShipmentRequest._();
  @$core.override
  DeleteShipmentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteShipmentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteShipmentRequest>(create);
  static DeleteShipmentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class DeleteShipmentResponse extends $pb.GeneratedMessage {
  factory DeleteShipmentResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  DeleteShipmentResponse._();

  factory DeleteShipmentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteShipmentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteShipmentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteShipmentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteShipmentResponse copyWith(
          void Function(DeleteShipmentResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteShipmentResponse))
          as DeleteShipmentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteShipmentResponse create() => DeleteShipmentResponse._();
  @$core.override
  DeleteShipmentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteShipmentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteShipmentResponse>(create);
  static DeleteShipmentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class ListShipmentsRequest extends $pb.GeneratedMessage {
  factory ListShipmentsRequest({
    $core.String? ownerId,
    $core.String? status,
  }) {
    final result = create();
    if (ownerId != null) result.ownerId = ownerId;
    if (status != null) result.status = status;
    return result;
  }

  ListShipmentsRequest._();

  factory ListShipmentsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListShipmentsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListShipmentsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ownerId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListShipmentsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListShipmentsRequest copyWith(void Function(ListShipmentsRequest) updates) =>
      super.copyWith((message) => updates(message as ListShipmentsRequest))
          as ListShipmentsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListShipmentsRequest create() => ListShipmentsRequest._();
  @$core.override
  ListShipmentsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListShipmentsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListShipmentsRequest>(create);
  static ListShipmentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ownerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set ownerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);
}

class ListShipmentsResponse extends $pb.GeneratedMessage {
  factory ListShipmentsResponse({
    $core.Iterable<Shipment>? shipments,
  }) {
    final result = create();
    if (shipments != null) result.shipments.addAll(shipments);
    return result;
  }

  ListShipmentsResponse._();

  factory ListShipmentsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListShipmentsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListShipmentsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..pPM<Shipment>(1, _omitFieldNames ? '' : 'shipments',
        subBuilder: Shipment.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListShipmentsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListShipmentsResponse copyWith(
          void Function(ListShipmentsResponse) updates) =>
      super.copyWith((message) => updates(message as ListShipmentsResponse))
          as ListShipmentsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListShipmentsResponse create() => ListShipmentsResponse._();
  @$core.override
  ListShipmentsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListShipmentsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListShipmentsResponse>(create);
  static ListShipmentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Shipment> get shipments => $_getList(0);
}

class ShipmentStatusUpdate extends $pb.GeneratedMessage {
  factory ShipmentStatusUpdate({
    $core.String? shipmentId,
    $core.String? status,
    Location? currentLocation,
    $1.Timestamp? updatedAt,
  }) {
    final result = create();
    if (shipmentId != null) result.shipmentId = shipmentId;
    if (status != null) result.status = status;
    if (currentLocation != null) result.currentLocation = currentLocation;
    if (updatedAt != null) result.updatedAt = updatedAt;
    return result;
  }

  ShipmentStatusUpdate._();

  factory ShipmentStatusUpdate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ShipmentStatusUpdate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShipmentStatusUpdate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'supplychain'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'shipmentId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..aOM<Location>(3, _omitFieldNames ? '' : 'currentLocation',
        subBuilder: Location.create)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShipmentStatusUpdate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShipmentStatusUpdate copyWith(void Function(ShipmentStatusUpdate) updates) =>
      super.copyWith((message) => updates(message as ShipmentStatusUpdate))
          as ShipmentStatusUpdate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShipmentStatusUpdate create() => ShipmentStatusUpdate._();
  @$core.override
  ShipmentStatusUpdate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ShipmentStatusUpdate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShipmentStatusUpdate>(create);
  static ShipmentStatusUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get shipmentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set shipmentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasShipmentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearShipmentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  Location get currentLocation => $_getN(2);
  @$pb.TagNumber(3)
  set currentLocation(Location value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCurrentLocation() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentLocation() => $_clearField(3);
  @$pb.TagNumber(3)
  Location ensureCurrentLocation() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Timestamp get updatedAt => $_getN(3);
  @$pb.TagNumber(4)
  set updatedAt($1.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasUpdatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdatedAt() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureUpdatedAt() => $_ensure(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
