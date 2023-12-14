abstract class BaseAuthRepository {
  Future<void> signUp({
    required String name,
    required String mail,
    required int password,
  });
}
