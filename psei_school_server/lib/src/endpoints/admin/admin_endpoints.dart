import 'package:psei_school_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AuthEndpoint extends Endpoint {
  Future<Admin?> verifyAdmin(Session session, String email, String password) async {
    final admin = await Admin.db.findFirstRow(
      session,
      where: (a) => a.email.equals(email) & a.password.equals(password),
    );
    return admin;
  }
}
