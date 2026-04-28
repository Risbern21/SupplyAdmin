// This is a generated file - do not edit.
//
// Generated from disruption.proto.

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

@$core.Deprecated('Use disruptionRiskDescriptor instead')
const DisruptionRisk$json = {
  '1': 'DisruptionRisk',
  '2': [
    {'1': 'shipment_id', '3': 1, '4': 1, '5': 9, '10': 'shipmentId'},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
    {'1': 'severity', '3': 3, '4': 1, '5': 9, '10': 'severity'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {
      '1': 'detected_at',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'detectedAt'
    },
  ],
};

/// Descriptor for `DisruptionRisk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disruptionRiskDescriptor = $convert.base64Decode(
    'Cg5EaXNydXB0aW9uUmlzaxIfCgtzaGlwbWVudF9pZBgBIAEoCVIKc2hpcG1lbnRJZBISCgR0eX'
    'BlGAIgASgJUgR0eXBlEhoKCHNldmVyaXR5GAMgASgJUghzZXZlcml0eRIgCgtkZXNjcmlwdGlv'
    'bhgEIAEoCVILZGVzY3JpcHRpb24SOwoLZGV0ZWN0ZWRfYXQYBSABKAsyGi5nb29nbGUucHJvdG'
    '9idWYuVGltZXN0YW1wUgpkZXRlY3RlZEF0');

@$core.Deprecated('Use analyzeShipmentRequestDescriptor instead')
const AnalyzeShipmentRequest$json = {
  '1': 'AnalyzeShipmentRequest',
  '2': [
    {'1': 'shipment_id', '3': 1, '4': 1, '5': 9, '10': 'shipmentId'},
  ],
};

/// Descriptor for `AnalyzeShipmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyzeShipmentRequestDescriptor =
    $convert.base64Decode(
        'ChZBbmFseXplU2hpcG1lbnRSZXF1ZXN0Eh8KC3NoaXBtZW50X2lkGAEgASgJUgpzaGlwbWVudE'
        'lk');

@$core.Deprecated('Use analyzeShipmentResponseDescriptor instead')
const AnalyzeShipmentResponse$json = {
  '1': 'AnalyzeShipmentResponse',
  '2': [
    {'1': 'shipment_id', '3': 1, '4': 1, '5': 9, '10': 'shipmentId'},
    {
      '1': 'risks',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.supplychain.DisruptionRisk',
      '10': 'risks'
    },
    {'1': 'rerouted', '3': 3, '4': 1, '5': 8, '10': 'rerouted'},
  ],
};

/// Descriptor for `AnalyzeShipmentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analyzeShipmentResponseDescriptor = $convert.base64Decode(
    'ChdBbmFseXplU2hpcG1lbnRSZXNwb25zZRIfCgtzaGlwbWVudF9pZBgBIAEoCVIKc2hpcG1lbn'
    'RJZBIxCgVyaXNrcxgCIAMoCzIbLnN1cHBseWNoYWluLkRpc3J1cHRpb25SaXNrUgVyaXNrcxIa'
    'CghyZXJvdXRlZBgDIAEoCFIIcmVyb3V0ZWQ=');

@$core.Deprecated('Use listDisruptionsRequestDescriptor instead')
const ListDisruptionsRequest$json = {
  '1': 'ListDisruptionsRequest',
  '2': [
    {
      '1': 'severity',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'severity',
      '17': true
    },
  ],
  '8': [
    {'1': '_severity'},
  ],
};

/// Descriptor for `ListDisruptionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDisruptionsRequestDescriptor =
    $convert.base64Decode(
        'ChZMaXN0RGlzcnVwdGlvbnNSZXF1ZXN0Eh8KCHNldmVyaXR5GAEgASgJSABSCHNldmVyaXR5iA'
        'EBQgsKCV9zZXZlcml0eQ==');

@$core.Deprecated('Use listDisruptionsResponseDescriptor instead')
const ListDisruptionsResponse$json = {
  '1': 'ListDisruptionsResponse',
  '2': [
    {
      '1': 'disruptions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.supplychain.DisruptionRisk',
      '10': 'disruptions'
    },
  ],
};

/// Descriptor for `ListDisruptionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDisruptionsResponseDescriptor =
    $convert.base64Decode(
        'ChdMaXN0RGlzcnVwdGlvbnNSZXNwb25zZRI9CgtkaXNydXB0aW9ucxgBIAMoCzIbLnN1cHBseW'
        'NoYWluLkRpc3J1cHRpb25SaXNrUgtkaXNydXB0aW9ucw==');

@$core.Deprecated('Use watchDisruptionsRequestDescriptor instead')
const WatchDisruptionsRequest$json = {
  '1': 'WatchDisruptionsRequest',
  '2': [
    {'1': 'owner_id', '3': 1, '4': 1, '5': 9, '10': 'ownerId'},
  ],
};

/// Descriptor for `WatchDisruptionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List watchDisruptionsRequestDescriptor =
    $convert.base64Decode(
        'ChdXYXRjaERpc3J1cHRpb25zUmVxdWVzdBIZCghvd25lcl9pZBgBIAEoCVIHb3duZXJJZA==');

@$core.Deprecated('Use watchDisruptionsResponseDescriptor instead')
const WatchDisruptionsResponse$json = {
  '1': 'WatchDisruptionsResponse',
  '2': [
    {'1': 'shipment_id', '3': 1, '4': 1, '5': 9, '10': 'shipmentId'},
    {
      '1': 'risk',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.supplychain.DisruptionRisk',
      '10': 'risk'
    },
    {'1': 'suggested_action', '3': 3, '4': 1, '5': 9, '10': 'suggestedAction'},
    {
      '1': 'alert_time',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'alertTime'
    },
  ],
};

/// Descriptor for `WatchDisruptionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List watchDisruptionsResponseDescriptor = $convert.base64Decode(
    'ChhXYXRjaERpc3J1cHRpb25zUmVzcG9uc2USHwoLc2hpcG1lbnRfaWQYASABKAlSCnNoaXBtZW'
    '50SWQSLwoEcmlzaxgCIAEoCzIbLnN1cHBseWNoYWluLkRpc3J1cHRpb25SaXNrUgRyaXNrEikK'
    'EHN1Z2dlc3RlZF9hY3Rpb24YAyABKAlSD3N1Z2dlc3RlZEFjdGlvbhI5CgphbGVydF90aW1lGA'
    'QgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJYWxlcnRUaW1l');
