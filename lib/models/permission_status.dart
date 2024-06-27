enum PermissionStatusType {
  neverRequested,

  granted,

  denied,

  /// OS denied access to the requested feature possibly due to active restrictions such
  /// as parental controls being in place - iOS only.
  restricted,

  /// User has authorized this application for limited access.
  limited,

  /// Permission to the requested feature is permanently denied, and the permission dialog cannot
  /// be shown again. User may still be able to change the permission status in the settings -
  /// Android only.
  permanentlyDenied,
}
