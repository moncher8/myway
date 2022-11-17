import '../models/fb_user_model.dart';
import '../providers/fb_user_provider.dart';

class HomeRepository {
  final FbUserProvider fbUserProvider;

  HomeRepository({required this.fbUserProvider})
      : assert(fbUserProvider != null);

  Future<FbUser?> postUser(FbUser fbUser) => fbUserProvider.postFbUser(fbUser);

  }