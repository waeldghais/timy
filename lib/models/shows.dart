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
 // Firestore _firestore=Firestore.instance;
  final List<Shows> _shows=[];
    // Shows(
    //     id: 'p1',
    //     channelUid: 'c1',
    //     genre: "Movies",
    //     mainLanguage: "English",
    //     premier: "March 10 2020 12:00 PM",
    //     replay1: "Feb 13 2020 4:45 PM",
    //     replay2: "January 5 2020 7:00 PM",
    //     showsCoverLink: "https://upload.wikimedia.org/wikipedia/en/c/c1/Sonic_the_Hedgehog_poster.jpg",
    //     description: "Thomas A. Anderson is a man living two lives. By day he is an average computer programmer and by night a hacker known as Neo. Neo has always questioned his reality, but the truth is far beyond his imagination. Neo finds himself targeted by the police when he is contacted by Morpheus, a legendary computer hacker branded a terrorist by the government. Morpheus awakens Neo to the real world, a ravaged wasteland where most of humanity have been captured by a race of machines that live off of the humans' body heat and electrochemical energy and who imprison their minds within an artificial reality known as the Matrix. As a rebel against the machines, Neo must return to the Matrix and confront the agents: super-powerful computer programs devoted to snuffing out Neo and the entire human rebellion.",
    //     subTitle: "Sonic",
    //     showTitle: "Arabic"),
    // Shows(
    //     id: 'p1a',
    //     channelUid: 'c2',
    //     genre: "Movies",
    //     mainLanguage: "English",
    //     premier: "Mar 10 2020 12:00",
    //     replay1: "Feb 13 2020 16:45",
    //     replay2: "Jan 5 2020 7:00",
    //     showsCoverLink: "https://m.media-amazon.com/images/M/MV5BYjA5YjA2YjUtMGRlNi00ZTU4LThhZmMtNDc0OTg4ZWExZjI3XkEyXkFqcGdeQXVyNjUyNjI3NzU@._V1_SY1000_SX800_AL_.jpg",
    //     description: "Thomas A. Anderson is a man living two lives. By day he is an average computer programmer and by night a hacker known as Neo. Neo has always questioned his reality, but the truth is far beyond his imagination. Neo finds himself targeted by the police when he is contacted by Morpheus, a legendary computer hacker branded a terrorist by the government. Morpheus awakens Neo to the real world, a ravaged wasteland where most of humanity have been captured by a race of machines that live off of the humans' body heat and electrochemical energy and who imprison their minds within an artificial reality known as the Matrix. As a rebel against the machines, Neo must return to the Matrix and confront the agents: super-powerful computer programs devoted to snuffing out Neo and the entire human rebellion.",
    //     subTitle: "The Aquaman",
    //     showTitle: "Arabic"),

    // Shows(
    //     id: 'p2',
    //     channelUid: 'c3',
    //     genre: "Series",
    //     mainLanguage: "English",
    //     premier: "May 10 2020 12:00",
    //     replay1: "Aug 15 2020 18:45",
    //     replay2: "Sep 20 2020 20:45",
    //     showsCoverLink: "https://m.media-amazon.com/images/M/MV5BOTVhMzYxNjgtYzYwOC00MGIwLWJmZGEtMjgwMzgxMWUwNmRhXkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_SY1000_CR0,0,640,1000_AL_.jpg",
    //     description: "This Series is very funny. The ratung of this movies is 5.This Series is very funny. "
    //         "The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.This Series is very funny."
    //         "This Series is very funny. The ratung of this movies is 5.This Series is very funny.",
    //     subTitle: "Avatar 2",
    //     showTitle: "English"),
    // Shows(
    //     id: 'p2a',
    //     channelUid: 'c4',
    //     genre: "Series",
    //     mainLanguage: "English",
    //     premier: "May 10 2020 15:00",
    //     replay1: "Aug 15 2020 6:45",
    //     replay2: "Sep 20 2020 20:45",
    //     showsCoverLink: "https://upload.wikimedia.org/wikipedia/en/3/38/The_SpongeBob_Movie_Sponge_on_the_Run.jpg",
    //     description: "This Series is very funny. The ratung of this movies is 5.This Series is very funny. "
    //         "The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.This Series is very funny."
    //         "This Series is very funny. The ratung of this movies is 5.This Series is very funny.",
    //     subTitle: "Avatar 3",
    //     showTitle: "English"),
    // Shows(
    //     id: 'p2b',
    //     channelUid: 'c5',
    //     genre: "Series",
    //     mainLanguage: "English",
    //     premier: "May 10 2020 12:00",
    //     replay1: "Aug 15 2020 18:45",
    //     replay2: "Sep 20 2020 20:45",
    //     showsCoverLink: "https://lumiere-a.akamaihd.net/v1/images/p_artemisfowl_update_19172_20808e23.jpeg?region=0,0,540,810&width=480",
    //     description: "This Series is very funny. The ratung of this movies is 5.This Series is very funny. "
    //         "The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.This Series is very funny."
    //         "This Series is very funny. The ratung of this movies is 5.This Series is very funny.",
    //     subTitle: "Avatar Return",
    //     showTitle: "English"),

    // Shows(
    //     id: 'p4',
    //     channelUid: 'c1',
    //     genre: "Docs",
    //     mainLanguage: "English",
    //     premier: "Nov 9 2020 10:59",
    //     replay1: "Jul 10 2020 21:45",
    //     replay2: "Jun 23 2020 12:45",
    //     showsCoverLink: "https://m.media-amazon.com/images/M/MV5BMWIwYzQ0NjMtMjA2Ni00MDNkLWFkYWMtNDQ3OTg1ZDg5ZDE0XkEyXkFqcGdeQXVyMTQ5ODIxNTc@._V1_.jpg",
    //     description: "This Series is very funny. The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.",
    //     subTitle: "Avenger",
    //     showTitle: "Arabic"),
    // Shows(
    //     id: 'p4a',
    //     channelUid: 'c2',
    //     genre: "Docs",
    //     mainLanguage: "English",
    //     premier: "Nov 9 2020 7:59",
    //     replay1: "Jul 10 2020 19:45",
    //     replay2: "Jun 23 2020 3:45",
    //     showsCoverLink: "https://artwork.captivate.fm/80cf10f5-0d88-4d49-a4a9-9b4009c5ae39/untitled1_2.jpg",
    //     description: "This Series is very funny. The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.",
    //     subTitle: "Avenger 2",
    //     showTitle: "Arabic"),

    // Shows(
    //     id: 'p3',
    //     channelUid: 'c3',
    //     genre: "Sports",
    //     mainLanguage: "Japanese",
    //     premier: "No 9 2020 15:59",
    //     replay1: "Jul 10 2020 19:45",
    //     replay2: "Jun 23 2020 6:45",
    //     showsCoverLink: "https://theyesng.com/wp-content/uploads/2020/02/RealMadrid_VS_Barcelona_2-1.jpg",
    //     description: "This Series is very funny. The ratung of this movies is 5.This Series is very funny. "
    //         "The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.This Series is very funny."
    //         "This Series is very funny. The ratung of this movies is 5.This Series is very funny."
    //         "This Series is very funny. The ratung of this movies is 5.This Series is very funny. "
    //         "The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.This Series is very funny."
    //         "This Series is very funny. The ratung of this movies is 5.This Series is very funny.",
    //     subTitle: "The Matrix",
    //     showTitle: "Arabic"),
    // Shows(
    //     id: 'p3a',
    //     channelUid: 'c4',
    //     genre: "Sports",
    //     mainLanguage: "Japanese",
    //     premier: "Nov 9 2020 4:59",
    //     replay1: "Jul 10 2020 13:45",
    //     replay2: "Jun 23 2020 6:45",
    //     showsCoverLink: "https://www.jeuxvideo24.com/wp-content/uploads/2018/09/NBA-2K18-cover-Kyrie-Irving-Switch.jpg",
    //     description: "This Series is very funny. The ratung of this movies is 5.This Series is very funny. "
    //         "The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.This Series is very funny."
    //         "This Series is very funny. The ratung of this movies is 5.This Series is very funny."
    //         "This Series is very funny. The ratung of this movies is 5.This Series is very funny. "
    //         "The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.This Series is very funny."
    //         "This Series is very funny. The ratung of this movies is 5.This Series is very funny.",
    //     subTitle: "The Matrix 4",
    //     showTitle: "Arabic"),
    // Shows(
    //     id: 'p3b',
    //     channelUid: 'c5',
    //     genre: "Sports",
    //     mainLanguage: "Japanese",
    //     premier: "Nov 9 2020 17:59",
    //     replay1: "Jul 10 2020 19:45",
    //     replay2: "Jun 23 2020 6:45",
    //     showsCoverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/shows%2Fchannel-wlWVZKSpV3ZbiEhSlTl9BJ2HMp33%2F398eecb1-6732-4273-b50d-8a3ebaebcfd6?alt=media&token=ceba5e92-dbaf-414a-9672-b69113273f4a",
    //     description: "This Series is very funny. The ratung of this movies is 5.This Series is very funny. "
    //         "The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.This Series is very funny."
    //         "This Series is very funny. The ratung of this movies is 5.This Series is very funny."
    //         "This Series is very funny. The ratung of this movies is 5.This Series is very funny. "
    //         "The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.This Series is very funny."
    //         "This Series is very funny. The ratung of this movies is 5.This Series is very funny.",
    //     subTitle: "The Matrix Return",
    //     showTitle: "Arabic"),

    // Shows(
    //     id: 'p6',
    //     channelUid: 'c1',
    //     genre: "Politics",
    //     mainLanguage: "English",
    //     premier: "Nov 9 2020 10:59",
    //     replay1: "Jul 10 2020 9:45",
    //     replay2: "Jun 23 2020 12:45",
    //     showsCoverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/shows%2Fchannel-vdDpUippR4aFs6VVuVE5QyKErgu1%2F90e6dbeb-bf2a-407c-956b-27369cec1d99?alt=media&token=8af980ff-f68e-44d6-aa2f-10252b5a37b6",
    //     description: "This Series is very funny. The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.",
    //     subTitle: "The Matrix",
    //     showTitle: "Spanish"),
    // Shows(
    //     id: 'p7',
    //     channelUid: 'c2',
    //     genre: "Politics",
    //     mainLanguage: "English",
    //     premier: "Nov 9 2020 123:59",
    //     replay1: "Jul 10 2020 10:45",
    //     replay2: "Jun 23 2020 2:45",
    //     showsCoverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/shows%2Fchannel-vdDpUippR4aFs6VVuVE5QyKErgu1%2F90e6dbeb-bf2a-407c-956b-27369cec1d99?alt=media&token=8af980ff-f68e-44d6-aa2f-10252b5a37b6",
    //     description: "This Series is very funny. The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.",
    //     subTitle: "The Avatar",
    //     showTitle: "Spanish"),

    // Shows(
    //     id: 'p8',
    //     channelUid: 'c3',
    //     genre: "News",
    //     mainLanguage: "English",
    //     premier: "Nov 9 2020 3:59",
    //     replay1: "Jul 10 2020 19:45",
    //     replay2: "Jun 23 2020 22:45",
    //     showsCoverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/shows%2Fchannel-vdDpUippR4aFs6VVuVE5QyKErgu1%2F90e6dbeb-bf2a-407c-956b-27369cec1d99?alt=media&token=8af980ff-f68e-44d6-aa2f-10252b5a37b6",
    //     description: "This Series is very funny. The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.",
    //     subTitle: "The Aquaman",
    //     showTitle: "Spanish"),
    // Shows(
    //     id: 'p8a',
    //     channelUid: 'c4',
    //     genre: "News",
    //     mainLanguage: "English",
    //     premier: "Nov 9 2020 20:59",
    //     replay1: "Jul 10 2020 16:45",
    //     replay2: "Jun 23 2020 12:45",
    //     showsCoverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/shows%2Fchannel-vdDpUippR4aFs6VVuVE5QyKErgu1%2F90e6dbeb-bf2a-407c-956b-27369cec1d99?alt=media&token=8af980ff-f68e-44d6-aa2f-10252b5a37b6",
    //     description: "This Series is very funny. The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.",
    //     subTitle: "The Aquaman 2",
    //     showTitle: "Spanish"),
    // Shows(
    //     id: 'p8b',
    //     channelUid: 'c5',
    //     genre: "News",
    //     mainLanguage: "English",
    //     premier: "Nov 9 2020 10:59",
    //     replay1: "Jul 10 2020 9:45",
    //     replay2: "Jun 23 2020 12:45",
    //     showsCoverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/shows%2Fchannel-vdDpUippR4aFs6VVuVE5QyKErgu1%2F90e6dbeb-bf2a-407c-956b-27369cec1d99?alt=media&token=8af980ff-f68e-44d6-aa2f-10252b5a37b6",
    //     description: "This Series is very funny. The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.",
    //     subTitle: "The Aquaman 3",
    //     showTitle: "Spanish"),

    // Shows(
    //     id: 'p5',
    //     channelUid: 'c1',
    //     genre: "Reality",
    //     mainLanguage: "Spanish",
    //     premier: "Jan 9 2020 9:59",
    //     replay1: "Feb 10 2020 11:45 PM",
    //     replay2: "Mar 23 2020 22:45 PM",
    //     showsCoverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/shows%2Fchannel-wlWVZKSpV3ZbiEhSlTl9BJ2HMp33%2F398eecb1-6732-4273-b50d-8a3ebaebcfd6?alt=media&token=ceba5e92-dbaf-414a-9672-b69113273f4a",
    //     description: "This Series is very funny. The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5."
    //         "This Series is very funny. The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.",
    //     subTitle: "Avatar",
    //     showTitle: "English"),
    // Shows(
    //     id: 'p5a',
    //     channelUid: 'c5',
    //     genre: "Reality",
    //     mainLanguage: "Spanish",
    //     premier: "Jan 9 2020 22:59",
    //     replay1: "Feb 10 2020 21:45",
    //     replay2: "Mar 23 2020 12:45",
    //     showsCoverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/shows%2Fchannel-wlWVZKSpV3ZbiEhSlTl9BJ2HMp33%2F398eecb1-6732-4273-b50d-8a3ebaebcfd6?alt=media&token=ceba5e92-dbaf-414a-9672-b69113273f4a",
    //     description: "This Series is very funny. The ratung of this movies is 5.This Series is very funny. The ratung of this movies is 5.",
    //     subTitle: "Avatar 5",
    //     showTitle: "English"),

  //];

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
