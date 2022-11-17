
import '../models/fb_user_model.dart';
import '../providers/fb_user_provider.dart';

class LoginRepository {
  final FbUserProvider fbUserProvider;

  LoginRepository({required this.fbUserProvider})
      : assert(fbUserProvider != null);

  Future<FbUser?> getUser(FbUser fbUser) => fbUserProvider.getFbUser(fbUser);

  Future<FbUser> postUser(FbUser fbUser) => fbUserProvider.postFbUser(fbUser);

}