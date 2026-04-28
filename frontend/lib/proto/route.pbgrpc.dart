// This is a generated file - do not edit.
//
// Generated from route.proto.

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

import 'route.pb.dart' as $0;

export 'route.pb.dart';

@$pb.GrpcServiceName('supplychain.RouteService')
class RouteServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  RouteServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.Route> optimizeRoute(
    $0.OptimizeRouteRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$optimizeRoute, request, options: options);
  }

  $grpc.ResponseFuture<$0.Route> getRoute(
    $0.GetRouteRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getRoute, request, options: options);
  }

  // method descriptors

  static final _$optimizeRoute =
      $grpc.ClientMethod<$0.OptimizeRouteRequest, $0.Route>(
          '/supplychain.RouteService/OptimizeRoute',
          ($0.OptimizeRouteRequest value) => value.writeToBuffer(),
          $0.Route.fromBuffer);
  static final _$getRoute = $grpc.ClientMethod<$0.GetRouteRequest, $0.Route>(
      '/supplychain.RouteService/GetRoute',
      ($0.GetRouteRequest value) => value.writeToBuffer(),
      $0.Route.fromBuffer);
}

@$pb.GrpcServiceName('supplychain.RouteService')
abstract class RouteServiceBase extends $grpc.Service {
  $core.String get $name => 'supplychain.RouteService';

  RouteServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.OptimizeRouteRequest, $0.Route>(
        'OptimizeRoute',
        optimizeRoute_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.OptimizeRouteRequest.fromBuffer(value),
        ($0.Route value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRouteRequest, $0.Route>(
        'GetRoute',
        getRoute_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRouteRequest.fromBuffer(value),
        ($0.Route value) => value.writeToBuffer()));
  }

  $async.Future<$0.Route> optimizeRoute_Pre($grpc.ServiceCall $call,
      $async.Future<$0.OptimizeRouteRequest> $request) async {
    return optimizeRoute($call, await $request);
  }

  $async.Future<$0.Route> optimizeRoute(
      $grpc.ServiceCall call, $0.OptimizeRouteRequest request);

  $async.Future<$0.Route> getRoute_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetRouteRequest> $request) async {
    return getRoute($call, await $request);
  }

  $async.Future<$0.Route> getRoute(
      $grpc.ServiceCall call, $0.GetRouteRequest request);
}
