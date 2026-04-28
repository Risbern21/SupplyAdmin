// This is a generated file - do not edit.
//
// Generated from shipment.proto.

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

@$core.Deprecated('Use locationDescriptor instead')
const Location$json = {
  '1': 'Location',
  '2': [
    {'1': 'lat', '3': 1, '4': 1, '5': 1, '10': 'lat'},
    {'1': 'lng', '3': 2, '4': 1, '5': 1, '10': 'lng'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Location`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationDescriptor = $convert.base64Decode(
    'CghMb2NhdGlvbhIQCgNsYXQYASABKAFSA2xhdBIQCgNsbmcYAiABKAFSA2xuZxISCgRuYW1lGA'
    'MgASgJUgRuYW1l');

@$core.Deprecated('Use shipmentDescriptor instead')
const Shipment$json = {
  '1': 'Shipment',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'owner_id', '3': 2, '4': 1, '5': 9, '10': 'ownerId'},
    {
      '1': 'origin',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.supplychain.Location',
      '10': 'origin'
    },
    {
      '1': 'destination',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.supplychain.Location',
      '10': 'destination'
    },
    {
      '1': 'current_location',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.supplychain.Location',
      '10': 'currentLocation'
    },
    {
      '1': 'route_points',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.supplychain.Location',
      '10': 'routePoints'
    },
    {'1': 'status', '3': 7, '4': 1, '5': 9, '10': 'status'},
    {'1': 'carrier', '3': 8, '4': 1, '5': 9, '10': 'carrier'},
    {
      '1': 'estimated_arrival',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'estimatedArrival'
    },
    {
      '1': 'created_at',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
  ],
};

/// Descriptor for `Shipment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shipmentDescriptor = $convert.base64Decode(
    'CghTaGlwbWVudBIOCgJpZBgBIAEoCVICaWQSGQoIb3duZXJfaWQYAiABKAlSB293bmVySWQSLQ'
    'oGb3JpZ2luGAMgASgLMhUuc3VwcGx5Y2hhaW4uTG9jYXRpb25SBm9yaWdpbhI3CgtkZXN0aW5h'
    'dGlvbhgEIAEoCzIVLnN1cHBseWNoYWluLkxvY2F0aW9uUgtkZXN0aW5hdGlvbhJAChBjdXJyZW'
    '50X2xvY2F0aW9uGAUgASgLMhUuc3VwcGx5Y2hhaW4uTG9jYXRpb25SD2N1cnJlbnRMb2NhdGlv'
    'bhI4Cgxyb3V0ZV9wb2ludHMYBiADKAsyFS5zdXBwbHljaGFpbi5Mb2NhdGlvblILcm91dGVQb2'
    'ludHMSFgoGc3RhdHVzGAcgASgJUgZzdGF0dXMSGAoHY2FycmllchgIIAEoCVIHY2FycmllchJH'
    'ChFlc3RpbWF0ZWRfYXJyaXZhbBgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSEG'
    'VzdGltYXRlZEFycml2YWwSOQoKY3JlYXRlZF9hdBgKIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5U'
    'aW1lc3RhbXBSCWNyZWF0ZWRBdA==');

@$core.Deprecated('Use createShipmentRequestDescriptor instead')
const CreateShipmentRequest$json = {
  '1': 'CreateShipmentRequest',
  '2': [
    {'1': 'owner_id', '3': 1, '4': 1, '5': 9, '10': 'ownerId'},
    {
      '1': 'origin',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.supplychain.Location',
      '10': 'origin'
    },
    {
      '1': 'destination',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.supplychain.Location',
      '10': 'destination'
    },
    {'1': 'carrier', '3': 4, '4': 1, '5': 9, '10': 'carrier'},
    {
      '1': 'estimated_arrival',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'estimatedArrival'
    },
  ],
};

/// Descriptor for `CreateShipmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createShipmentRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVTaGlwbWVudFJlcXVlc3QSGQoIb3duZXJfaWQYASABKAlSB293bmVySWQSLQoGb3'
    'JpZ2luGAIgASgLMhUuc3VwcGx5Y2hhaW4uTG9jYXRpb25SBm9yaWdpbhI3CgtkZXN0aW5hdGlv'
    'bhgDIAEoCzIVLnN1cHBseWNoYWluLkxvY2F0aW9uUgtkZXN0aW5hdGlvbhIYCgdjYXJyaWVyGA'
    'QgASgJUgdjYXJyaWVyEkcKEWVzdGltYXRlZF9hcnJpdmFsGAUgASgLMhouZ29vZ2xlLnByb3Rv'
    'YnVmLlRpbWVzdGFtcFIQZXN0aW1hdGVkQXJyaXZhbA==');

@$core.Deprecated('Use getShipmentRequestDescriptor instead')
const GetShipmentRequest$json = {
  '1': 'GetShipmentRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetShipmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getShipmentRequestDescriptor =
    $convert.base64Decode('ChJHZXRTaGlwbWVudFJlcXVlc3QSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use updateShipmentRequestDescriptor instead')
const UpdateShipmentRequest$json = {
  '1': 'UpdateShipmentRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {
      '1': 'current_location',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.supplychain.Location',
      '10': 'currentLocation'
    },
    {'1': 'status', '3': 3, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `UpdateShipmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateShipmentRequestDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVTaGlwbWVudFJlcXVlc3QSDgoCaWQYASABKAlSAmlkEkAKEGN1cnJlbnRfbG9jYX'
    'Rpb24YAiABKAsyFS5zdXBwbHljaGFpbi5Mb2NhdGlvblIPY3VycmVudExvY2F0aW9uEhYKBnN0'
    'YXR1cxgDIAEoCVIGc3RhdHVz');

@$core.Deprecated('Use deleteShipmentRequestDescriptor instead')
const DeleteShipmentRequest$json = {
  '1': 'DeleteShipmentRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteShipmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteShipmentRequestDescriptor = $convert
    .base64Decode('ChVEZWxldGVTaGlwbWVudFJlcXVlc3QSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use deleteShipmentResponseDescriptor instead')
const DeleteShipmentResponse$json = {
  '1': 'DeleteShipmentResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `DeleteShipmentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteShipmentResponseDescriptor =
    $convert.base64Decode(
        'ChZEZWxldGVTaGlwbWVudFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbW'
        'Vzc2FnZRgCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use listShipmentsRequestDescriptor instead')
const ListShipmentsRequest$json = {
  '1': 'ListShipmentsRequest',
  '2': [
    {'1': 'owner_id', '3': 1, '4': 1, '5': 9, '10': 'ownerId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `ListShipmentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listShipmentsRequestDescriptor = $convert.base64Decode(
    'ChRMaXN0U2hpcG1lbnRzUmVxdWVzdBIZCghvd25lcl9pZBgBIAEoCVIHb3duZXJJZBIWCgZzdG'
    'F0dXMYAiABKAlSBnN0YXR1cw==');

@$core.Deprecated('Use listShipmentsResponseDescriptor instead')
const ListShipmentsResponse$json = {
  '1': 'ListShipmentsResponse',
  '2': [
    {
      '1': 'shipments',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.supplychain.Shipment',
      '10': 'shipments'
    },
  ],
};

/// Descriptor for `ListShipmentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listShipmentsResponseDescriptor = $convert.base64Decode(
    'ChVMaXN0U2hpcG1lbnRzUmVzcG9uc2USMwoJc2hpcG1lbnRzGAEgAygLMhUuc3VwcGx5Y2hhaW'
    '4uU2hpcG1lbnRSCXNoaXBtZW50cw==');

@$core.Deprecated('Use shipmentStatusUpdateDescriptor instead')
const ShipmentStatusUpdate$json = {
  '1': 'ShipmentStatusUpdate',
  '2': [
    {'1': 'shipment_id', '3': 1, '4': 1, '5': 9, '10': 'shipmentId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    {
      '1': 'current_location',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.supplychain.Location',
      '10': 'currentLocation'
    },
    {
      '1': 'updated_at',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
  ],
};

/// Descriptor for `ShipmentStatusUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shipmentStatusUpdateDescriptor = $convert.base64Decode(
    'ChRTaGlwbWVudFN0YXR1c1VwZGF0ZRIfCgtzaGlwbWVudF9pZBgBIAEoCVIKc2hpcG1lbnRJZB'
    'IWCgZzdGF0dXMYAiABKAlSBnN0YXR1cxJAChBjdXJyZW50X2xvY2F0aW9uGAMgASgLMhUuc3Vw'
    'cGx5Y2hhaW4uTG9jYXRpb25SD2N1cnJlbnRMb2NhdGlvbhI5Cgp1cGRhdGVkX2F0GAQgASgLMh'
    'ouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0');
