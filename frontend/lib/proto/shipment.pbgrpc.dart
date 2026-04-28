// This is a generated file - do not edit.
//
// Generated from shipment.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'shipment.pb.dart' as $0;

export 'shipment.pb.dart';

@$pb.GrpcServiceName('supplychain.ShipmentService')
class ShipmentServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ShipmentServiceClient(super.channel, {super.options, super.interceptors});

  /// CRUD
  $grpc.ResponseFuture<$0.Shipment> createShipment(
    $0.CreateShipmentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createShipment, request, options: options);
  }

  $grpc.ResponseFuture<$0.Shipment> getShipment(
    $0.GetShipmentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getShipment, request, options: options);
  }

  $grpc.ResponseFuture<$0.Shipment> updateShipment(
    $0.UpdateShipmentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateShipment, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteShipmentResponse> deleteShipment(
    $0.DeleteShipmentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteShipment, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListShipmentsResponse> listShipments(
    $0.ListShipmentsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listShipments, request, options: options);
  }

  /// Streaming
  $grpc.ResponseStream<$0.ShipmentStatusUpdate> trackShipment(
    $0.GetShipmentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(
        _$trackShipment, $async.Stream.fromIterable([request]),
        options: options);
  }

  // method descriptors

  static final _$createShipment =
      $grpc.ClientMethod<$0.CreateShipmentRequest, $0.Shipment>(
          '/supplychain.ShipmentService/CreateShipment',
          ($0.CreateShipmentRequest value) => value.writeToBuffer(),
          $0.Shipment.fromBuffer);
  static final _$getShipment =
      $grpc.ClientMethod<$0.GetShipmentRequest, $0.Shipment>(
          '/supplychain.ShipmentService/GetShipment',
          ($0.GetShipmentRequest value) => value.writeToBuffer(),
          $0.Shipment.fromBuffer);
  static final _$updateShipment =
      $grpc.ClientMethod<$0.UpdateShipmentRequest, $0.Shipment>(
          '/supplychain.ShipmentService/UpdateShipment',
          ($0.UpdateShipmentRequest value) => value.writeToBuffer(),
          $0.Shipment.fromBuffer);
  static final _$deleteShipment =
      $grpc.ClientMethod<$0.DeleteShipmentRequest, $0.DeleteShipmentResponse>(
          '/supplychain.ShipmentService/DeleteShipment',
          ($0.DeleteShipmentRequest value) => value.writeToBuffer(),
          $0.DeleteShipmentResponse.fromBuffer);
  static final _$listShipments =
      $grpc.ClientMethod<$0.ListShipmentsRequest, $0.ListShipmentsResponse>(
          '/supplychain.ShipmentService/ListShipments',
          ($0.ListShipmentsRequest value) => value.writeToBuffer(),
          $0.ListShipmentsResponse.fromBuffer);
  static final _$trackShipment =
      $grpc.ClientMethod<$0.GetShipmentRequest, $0.ShipmentStatusUpdate>(
          '/supplychain.ShipmentService/TrackShipment',
          ($0.GetShipmentRequest value) => value.writeToBuffer(),
          $0.ShipmentStatusUpdate.fromBuffer);
}

@$pb.GrpcServiceName('supplychain.ShipmentService')
abstract class ShipmentServiceBase extends $grpc.Service {
  $core.String get $name => 'supplychain.ShipmentService';

  ShipmentServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateShipmentRequest, $0.Shipment>(
        'CreateShipment',
        createShipment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateShipmentRequest.fromBuffer(value),
        ($0.Shipment value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetShipmentRequest, $0.Shipment>(
        'GetShipment',
        getShipment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetShipmentRequest.fromBuffer(value),
        ($0.Shipment value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateShipmentRequest, $0.Shipment>(
        'UpdateShipment',
        updateShipment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateShipmentRequest.fromBuffer(value),
        ($0.Shipment value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteShipmentRequest,
            $0.DeleteShipmentResponse>(
        'DeleteShipment',
        deleteShipment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteShipmentRequest.fromBuffer(value),
        ($0.DeleteShipmentResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListShipmentsRequest, $0.ListShipmentsResponse>(
            'ListShipments',
            listShipments_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListShipmentsRequest.fromBuffer(value),
            ($0.ListShipmentsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetShipmentRequest, $0.ShipmentStatusUpdate>(
            'TrackShipment',
            trackShipment_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.GetShipmentRequest.fromBuffer(value),
            ($0.ShipmentStatusUpdate value) => value.writeToBuffer()));
  }

  $async.Future<$0.Shipment> createShipment_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateShipmentRequest> $request) async {
    return createShipment($call, await $request);
  }

  $async.Future<$0.Shipment> createShipment(
      $grpc.ServiceCall call, $0.CreateShipmentRequest request);

  $async.Future<$0.Shipment> getShipment_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetShipmentRequest> $request) async {
    return getShipment($call, await $request);
  }

  $async.Future<$0.Shipment> getShipment(
      $grpc.ServiceCall call, $0.GetShipmentRequest request);

  $async.Future<$0.Shipment> updateShipment_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdateShipmentRequest> $request) async {
    return updateShipment($call, await $request);
  }

  $async.Future<$0.Shipment> updateShipment(
      $grpc.ServiceCall call, $0.UpdateShipmentRequest request);

  $async.Future<$0.DeleteShipmentResponse> deleteShipment_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DeleteShipmentRequest> $request) async {
    return deleteShipment($call, await $request);
  }

  $async.Future<$0.DeleteShipmentResponse> deleteShipment(
      $grpc.ServiceCall call, $0.DeleteShipmentRequest request);

  $async.Future<$0.ListShipmentsResponse> listShipments_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListShipmentsRequest> $request) async {
    return listShipments($call, await $request);
  }

  $async.Future<$0.ListShipmentsResponse> listShipments(
      $grpc.ServiceCall call, $0.ListShipmentsRequest request);

  $async.Stream<$0.ShipmentStatusUpdate> trackShipment_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetShipmentRequest> $request) async* {
    yield* trackShipment($call, await $request);
  }

  $async.Stream<$0.ShipmentStatusUpdate> trackShipment(
      $grpc.ServiceCall call, $0.GetShipmentRequest request);
}
