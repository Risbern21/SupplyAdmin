// This is a generated file - do not edit.
//
// Generated from route.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use routePointDescriptor instead')
const RoutePoint$json = {
  '1': 'RoutePoint',
  '2': [
    {'1': 'lat', '3': 1, '4': 1, '5': 1, '10': 'lat'},
    {'1': 'lng', '3': 2, '4': 1, '5': 1, '10': 'lng'},
    {'1': 'label', '3': 3, '4': 1, '5': 9, '10': 'label'},
    {'1': 'sequence', '3': 4, '4': 1, '5': 5, '10': 'sequence'},
  ],
};

/// Descriptor for `RoutePoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List routePointDescriptor = $convert.base64Decode(
    'CgpSb3V0ZVBvaW50EhAKA2xhdBgBIAEoAVIDbGF0EhAKA2xuZxgCIAEoAVIDbG5nEhQKBWxhYm'
    'VsGAMgASgJUgVsYWJlbBIaCghzZXF1ZW5jZRgEIAEoBVIIc2VxdWVuY2U=');

@$core.Deprecated('Use routeDescriptor instead')
const Route$json = {
  '1': 'Route',
  '2': [
    {'1': 'shipment_id', '3': 1, '4': 1, '5': 9, '10': 'shipmentId'},
    {
      '1': 'points',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.supplychain.RoutePoint',
      '10': 'points'
    },
    {
      '1': 'estimated_duration_minutes',
      '3': 3,
      '4': 1,
      '5': 1,
      '10': 'estimatedDurationMinutes'
    },
    {'1': 'distance_km', '3': 4, '4': 1, '5': 1, '10': 'distanceKm'},
    {'1': 'reason', '3': 5, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `Route`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List routeDescriptor = $convert.base64Decode(
    'CgVSb3V0ZRIfCgtzaGlwbWVudF9pZBgBIAEoCVIKc2hpcG1lbnRJZBIvCgZwb2ludHMYAiADKA'
    'syFy5zdXBwbHljaGFpbi5Sb3V0ZVBvaW50UgZwb2ludHMSPAoaZXN0aW1hdGVkX2R1cmF0aW9u'
    'X21pbnV0ZXMYAyABKAFSGGVzdGltYXRlZER1cmF0aW9uTWludXRlcxIfCgtkaXN0YW5jZV9rbR'
    'gEIAEoAVIKZGlzdGFuY2VLbRIWCgZyZWFzb24YBSABKAlSBnJlYXNvbg==');

@$core.Deprecated('Use optimizeRouteRequestDescriptor instead')
const OptimizeRouteRequest$json = {
  '1': 'OptimizeRouteRequest',
  '2': [
    {'1': 'shipment_id', '3': 1, '4': 1, '5': 9, '10': 'shipmentId'},
    {'1': 'avoid_types', '3': 2, '4': 3, '5': 9, '10': 'avoidTypes'},
  ],
};

/// Descriptor for `OptimizeRouteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List optimizeRouteRequestDescriptor = $convert.base64Decode(
    'ChRPcHRpbWl6ZVJvdXRlUmVxdWVzdBIfCgtzaGlwbWVudF9pZBgBIAEoCVIKc2hpcG1lbnRJZB'
    'IfCgthdm9pZF90eXBlcxgCIAMoCVIKYXZvaWRUeXBlcw==');

@$core.Deprecated('Use getRouteRequestDescriptor instead')
const GetRouteRequest$json = {
  '1': 'GetRouteRequest',
  '2': [
    {'1': 'shipment_id', '3': 1, '4': 1, '5': 9, '10': 'shipmentId'},
  ],
};

/// Descriptor for `GetRouteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRouteRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRSb3V0ZVJlcXVlc3QSHwoLc2hpcG1lbnRfaWQYASABKAlSCnNoaXBtZW50SWQ=');
