
    import 'package:framework/src/features/workspace/data/sources/sources.dart';
    import 'package:framework/src/features/workspace/domain/repositories/repositories.dart';
    
    class WorkspaceRepositoryImp implements WorkspaceRepository{
        WorkspaceRepositoryImp({required this.remoteDataSource});

        final WorkspaceRemoteDataSource remoteDataSource;
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    