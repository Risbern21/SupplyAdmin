import "package:grpc/grpc.dart";

import "constants.dart";

class GrpcClient {
  GrpcClient._();

  static final ClientChannel _channel = ClientChannel(
    AppConstants.backendHost,
    port: AppConstants.backendPort,
    options: ChannelOptions(
      credentials: AppConstants.useInsecureGrpcForLocal
          ? const ChannelCredentials.insecure()
          : const ChannelCredentials.secure(),
    ),
  );

  static ClientChannel get channel => _channel;

  static Future<void> shutdown() => _channel.shutdown();
}
