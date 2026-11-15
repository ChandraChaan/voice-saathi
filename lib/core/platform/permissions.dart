import 'package:permission_handler/permission_handler.dart';

enum AppPermission { microphone, phone }

/// Runtime permissions the app asks for.
abstract interface class Permissions {
  Future<bool> isGranted(AppPermission permission);

  /// Asks Android; when it won't ask again, opens the app's settings page.
  Future<bool> request(AppPermission permission);
}

class PermissionHandlerPermissions implements Permissions {
  const PermissionHandlerPermissions();

  Permission _of(AppPermission permission) => switch (permission) {
    AppPermission.microphone => Permission.microphone,
    AppPermission.phone => Permission.phone,
  };

  @override
  Future<bool> isGranted(AppPermission permission) => _of(permission).isGranted;

  @override
  Future<bool> request(AppPermission permission) async {
    final status = await _of(permission).request();
    if (status.isPermanentlyDenied) await openAppSettings();
    return status.isGranted;
  }
}
