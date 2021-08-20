class LoginUserModel {
  String? displayName;
  String? email;
  String? photoUrl;
  String? uid;

  LoginUserModel(
    {
      required this.displayName,
      required this.email,
      required this.photoUrl,
      required this.uid
    }
  );
}