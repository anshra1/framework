
    import 'package:framework/src/features/framework/data/sources/sources.dart';
    import 'package:framework/src/features/framework/domain/repositories/repositories.dart';
    
    class FrameworkRepositoryImp implements FrameworkRepository{
        FrameworkRepositoryImp({required this.remoteDataSource});

        final FrameworkRemoteDataSource remoteDataSource;
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    