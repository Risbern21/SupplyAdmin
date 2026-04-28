// This is a generated file - do not edit.
//
// Generated from disruption.proto.

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

import 'disruption.pb.dart' as $0;

export 'disruption.pb.dart';

@$pb.GrpcServiceName('supplychain.DisruptionService')
class DisruptionServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  DisruptionServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.AnalyzeShipmentResponse> analyzeShipment(
    $0.AnalyzeShipmentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$analyzeShipment, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListDisruptionsResponse> listDisruptions(
    $0.ListDisruptionsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listDisruptions, request, options: options);
  }

  $grpc.ResponseStream<$0.WatchDisruptionsResponse> watchDisruptions(
    $0.WatchDisruptionsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(
        _$watchDisruptions, $async.Stream.fromIterable([request]),
        options: options);
  }

  // method descriptors

  static final _$analyzeShipment =
      $grpc.ClientMethod<$0.AnalyzeShipmentRequest, $0.AnalyzeShipmentResponse>(
          '/supplychain.DisruptionService/AnalyzeShipment',
          ($0.AnalyzeShipmentRequest value) => value.writeToBuffer(),
          $0.AnalyzeShipmentResponse.fromBuffer);
  static final _$listDisruptions =
      $grpc.ClientMethod<$0.ListDisruptionsRequest, $0.ListDisruptionsResponse>(
          '/supplychain.DisruptionService/ListDisruptions',
          ($0.ListDisruptionsRequest value) => value.writeToBuffer(),
          $0.ListDisruptionsResponse.fromBuffer);
  static final _$watchDisruptions = $grpc.ClientMethod<
          $0.WatchDisruptionsRequest, $0.WatchDisruptionsResponse>(
      '/supplychain.DisruptionService/WatchDisruptions',
      ($0.WatchDisruptionsRequest value) => value.writeToBuffer(),
      $0.WatchDisruptionsResponse.fromBuffer);
}

@$pb.GrpcServiceName('supplychain.DisruptionService')
abstract class DisruptionServiceBase extends $grpc.Service {
  $core.String get $name => 'supplychain.DisruptionService';

  DisruptionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AnalyzeShipmentRequest,
            $0.AnalyzeShipmentResponse>(
        'AnalyzeShipment',
        analyzeShipment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AnalyzeShipmentRequest.fromBuffer(value),
        ($0.AnalyzeShipmentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListDisruptionsRequest,
            $0.ListDisruptionsResponse>(
        'ListDisruptions',
        listDisruptions_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListDisruptionsRequest.fromBuffer(value),
        ($0.ListDisruptionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.WatchDisruptionsRequest,
            $0.WatchDisruptionsResponse>(
        'WatchDisruptions',
        watchDisruptions_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.WatchDisruptionsRequest.fromBuffer(value),
        ($0.WatchDisruptionsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AnalyzeShipmentResponse> analyzeShipment_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.AnalyzeShipmentRequest> $request) async {
    return analyzeShipment($call, await $request);
  }

  $async.Future<$0.AnalyzeShipmentResponse> analyzeShipment(
      $grpc.ServiceCall call, $0.AnalyzeShipmentRequest request);

  $async.Future<$0.ListDisruptionsResponse> listDisruptions_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListDisruptionsRequest> $request) async {
    return listDisruptions($call, await $request);
  }

  $async.Future<$0.ListDisruptionsResponse> listDisruptions(
      $grpc.ServiceCall call, $0.ListDisruptionsRequest request);

  $async.Stream<$0.WatchDisruptionsResponse> watchDisruptions_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.WatchDisruptionsRequest> $request) async* {
    yield* watchDisruptions($call, await $request);
  }

  $async.Stream<$0.WatchDisruptionsResponse> watchDisruptions(
      $grpc.ServiceCall call, $0.WatchDisruptionsRequest request);
}
