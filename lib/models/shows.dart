import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../helper/DBHelper.dart';

class Shows with ChangeNotifier{
  final String id;
  final String channelUid;
  final String genre;
  final String mainLanguage;
  final DateTime premier;
  final DateTime replay1;
  final String replay2;
  final String showsCoverLink;
  final String description;
  final String showTitle;
  final String subTitle;
  bool isAddToSchedule;
  Shows({
    @required this.id,
    @required this.channelUid,
    @required this.genre,
    @required this.mainLanguage,
    @required this.premier,
    @required this.replay1,
    @required this.replay2,
    @required this.showsCoverLink,
    @required this.description,
    @required this.subTitle,
    @required this.showTitle,
    this.isAddToSchedule=false
  });
  void toggleScheduleStatus() {
    isAddToSchedule = !isAddToSchedule;
    notifyListeners();
  }
}

class ShowsModel with ChangeNotifier{
 
  final List<Shows> _shows=[];
    
// here i am fetching data from firebase
Future<void> getShows()async{
  _shows.clear();
  //here
  QuerySnapshot snapshot= await Firestore.instance.collection('shows').getDocuments();
  snapshot.documents.forEach((data) {
    _shows.add(Shows(
      replay2: 'Jun 23 2020 6:45',
      // switch subtitle with showtitle
      subTitle: data.data['subtitle'],
      showTitle: data.data['showTitle'],
      genre: data.data['category'],
      channelUid: data.data['channelUid'],
      mainLanguage: data.data['mainLanguage'],
      description: data.data['showDescription'],
      id: data.data['id'],
      showsCoverLink: data.data['showCoverLink'],
      replay1: data.data['replay'][0].toDate(),
      premier: data.data['premier'].toDate(),
    ));
   });
   notifyListeners();
   }

  Future<void> getCurrentAndNextPlayingShows()async{
     _currentlyPlaying.clear();
   final scheduledData= await DBHelper.getData('schedule');
   scheduledData.forEach((data) {
     final show= findById(data['id']);
     if(_currentlyPlaying.isEmpty){ 
    if(DateTime.parse(data['date']).isBefore(DateTime.now())&&DateTime.parse(data['date']).isBefore(DateTime.now().add(Duration(hours: 1)))
    &&DateTime.now().difference(DateTime.parse(data['date']))<=Duration(hours: 2))
    {
      _currentlyPlaying.add(show);
    }
     }
   });
   _nextPlaying.clear();
   scheduledData.forEach((data) {
     final show= findById(data['id']);
     if(_nextPlaying.isEmpty){
       if(DateTime.parse(data['date']).isAfter(DateTime.now())&&DateTime.parse(data['date']).isBefore(DateTime.now().add(Duration(hours: 23))))
       {
         _nextPlaying.add(show);
       }
     }
   });
   }


  List<Shows> get shows {
    return [..._shows];
  }

  final List<Shows> _currentlyPlaying=[];

  List<Shows> get currentlyPlaying{
    return [..._currentlyPlaying];
  }

 final List<Shows> _nextPlaying=[];

 List<Shows> get nextPlaying{
   return [..._nextPlaying];
 }

  Shows findByName(String name) {
    return shows.firstWhere((prod) => prod.genre ==name);
  }

  List<Shows> findByShowTitle(String name){
    return shows.where((prod) =>prod.showTitle==name ).toList();
  }
  List<Shows> getGenre(String genre){
    return _shows.where((prodItem)=>prodItem.genre==genre).toList();
  }

  Shows findById(String id){
    return shows.firstWhere((prod)=>prod.id==id);
  }
  List<Shows> getChannelShows(String channelId){
    return _shows.where((prodItem)=>prodItem.channelUid==channelId).toList();
  }
  List<Shows> get scheduleItems {
    return shows.where((prodItem) => prodItem.isAddToSchedule).toList();
  }

}
