
    import 'package:framework/src/features/notes/data/sources/sources.dart';
    import 'package:framework/src/features/notes/domain/repositories/repositories.dart';
    
    class NotesRepositoryImp implements NotesRepository{
        NotesRepositoryImp({required this.remoteDataSource});

        final NotesRemoteDataSource remoteDataSource;
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    