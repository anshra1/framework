
    import 'package:framework/src/features/dashboard/data/sources/sources.dart';
    import 'package:framework/src/features/dashboard/domain/repositories/repositories.dart';
    
    class DashboardRepositoryImp implements DashboardRepository{
        DashboardRepositoryImp({required this.remoteDataSource});

        final DashboardRemoteDataSource remoteDataSource;
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    