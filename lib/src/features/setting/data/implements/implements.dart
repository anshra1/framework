
    import 'package:framework/src/features/setting/data/sources/sources.dart';
    import 'package:framework/src/features/setting/domain/repositories/repositories.dart';
    
    class SettingRepositoryImp implements SettingRepository{
        SettingRepositoryImp({required this.remoteDataSource});

        final SettingRemoteDataSource remoteDataSource;
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    