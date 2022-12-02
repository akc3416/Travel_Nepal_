import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_nepal/src/core/model/database_model.dart';

class DatabaseService {
  // Collection reference
  final CollectionReference dataCollection =
      FirebaseFirestore.instance.collection('data');

  void setFirebasePref() {
    FirebaseFirestore.instance.settings = Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }

  // User List From Snapshot
  List<DatabaseModel> _databaseListFromSnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((doc) {
        final dynamic data = doc.data();
        return DatabaseModel(
          key: data['key'] ?? '',
          body: data['body'] ?? '',
        );
      }).toList();
    } catch (err) {
      print("Error in Fetching Database List: " + err.toString());
      return [];
    }
  }

  // Get Notification Stream
  Stream<List<DatabaseModel>> get databaseList {
    return dataCollection.snapshots().map(_databaseListFromSnapshot);
  }
}
