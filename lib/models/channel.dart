import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Channels with ChangeNotifier{
  final String id;
  final String broadCastRegion;
  final String channelName;
  final String channelSlogan;
  final String coverLink;
  final String description;
  final String fbLink;
  final String genre;
  final String hqCountry;
  final String instaLink;
  final String logoLink;
  final String mainLanguage;
  final String sateliteFrequency;
  final String webStreamLink;
  final String youtubeLink;
  Channels({
    @required this.id,
    @required this.broadCastRegion,
    @required this.channelName,
    @required this.channelSlogan,
    @required this.coverLink,
    @required this.description,
    @required this.fbLink,
    @required this.genre,
    @required this.hqCountry,
    @required this.instaLink,
    @required this.logoLink,
    @required this.mainLanguage,
    @required this.sateliteFrequency,
    @required this.webStreamLink,
    @required this.youtubeLink,
  });
}

class ChannelModel with ChangeNotifier{
  final List<Channels> _channel=[
    // Channels(
    //     id: "sa06E3qihHYaSOCjyYzqRwIXTL83",
    //     broadCastRegion: "Europe",
    //     channelName: "M6",
    //     channelSlogan: "Continuons de grandir ensemble ",
    //     coverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Fcover-PoJfOiddYXMqN6AGbFWHEs4AGEx1?alt=media&token=9c5f570f-3716-48ec-86a8-6da79083d128",
    //     description: "6play est laa première offre de divertissement vidéo gratuite et 100% personnalisée. Avec plus de 300 programmes et 3000 heures de télévision, 6play propose une propose une offre de contenus profonde, diverse et exclusive.",
    //     fbLink: "https://www.facebook.com/6play",
    //     genre: "Entertainment",
    //     hqCountry: "France",
    //     instaLink: "https://www.instagram.com/6play/",
    //     logoLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Flogo-PoJfOiddYXMqN6AGbFWHEs4AGEx1?alt=media&token=ebe3b844-048d-42c8-b6ea-2067d88a5899",
    //     mainLanguage: "Frensh",
    //     sateliteFrequency: " 12168",
    //     webStreamLink: "https://www.6play.fr/m6/direct",
    //     youtubeLink: "https://www.youtube.com/channel/UCoJs009FeAVHzLZv6WyBf9g"),
    // Channels(id: "djeYy18QiYQa7aGb5BoNWV7NJhT2",
    //     broadCastRegion: "MENA",
    //     channelName: "First Tv Channel",
    //     channelSlogan: "Continuons de grandir ensemble ",
    //     coverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Fcover-vdDpUippR4aFs6VVuVE5QyKErgu1?alt=media&token=3d845f68-b81f-4759-8157-08fc15fa3dcc",
    //     description: "Diasney Channel's programming consists of original first-run television series, theatrically released and original made-for-TV movies and select other third-party programming. Disney Channel – which formerly operated as a premium service – originally marketed its programs towards families during the 1980s, and later at younger children by the 2000s. A majority of Disney Channel's original programming is aimed at children aged 6–16, while its Disney Junior programs are targeted at children aged 7 years and under.",
    //     fbLink: "https://www.facebook.com/6play",
    //     genre: "Kids",
    //     hqCountry: "Tunisia",
    //     instaLink: "https://www.instagram.com/6play/",
    //     logoLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Flogo-djeYy18QiYQa7aGb5BoNWV7NJhT2?alt=media&token=f474572a-c0a6-440b-803c-7dcdcd0fd0e7",
    //     mainLanguage: "Frensh",
    //     sateliteFrequency: " 11559 MHz",
    //     webStreamLink: "https://www.6play.fr/m6/direct",
    //     youtubeLink: "https://www.youtube.com/channel/UCoJs009FeAVHzLZv6WyBf9g"),
    // Channels(
    //     id: "gxrFamcTCyStkWjTKCCC6Y8UcqD3",
    //     broadCastRegion: "Europe",
    //     channelName: "TF1",
    //     channelSlogan: "Partageons des ondes positives ",
    //     coverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Fcover-RsKZAhtBMcUaQw2U8L4aZLMxp002?alt=media&token=2c2b28f4-b3f5-4b9c-9673-805a93637a69",
    //     description: "La chaîne TF1 propose une programmation familiale et événementielle. Appréciée pour son offre diversifiée en fiction, sport, cinéma, jeunesse, magazine et documentaire, ses journaux d’information offrent un regard exigeant sur le monde. Leader tout en étant proche du public, sa mission première est d’informer et divertir.",
    //     fbLink: "https://www.facebook.com/TF1",
    //     genre: "Reality",
    //     hqCountry: "France",
    //     instaLink: "https://www.instagram.com/tf1",
    //     logoLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Flogo-RsKZAhtBMcUaQw2U8L4aZLMxp002?alt=media&token=cf0f633d-32bf-4d53-8c7f-01f9c33b9013",
    //     mainLanguage:"Frensh",
    //     sateliteFrequency: " 11559 MHz",
    //     webStreamLink: "https://www.6play.fr/m6/direct",
    //     youtubeLink: "https://www.youtube.com/channel/UCoJs009FeAVHzLZv6WyBf9g"),
    // Channels(
    //   id: "rwLM4bY3gOWGX4McbWcSEMlae163",
    //   broadCastRegion: "Europe",
    //     channelName: "TF1",
    //     channelSlogan: "Partageons des ondes positives ",
    //     coverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Fcover-RsKZAhtBMcUaQw2U8L4aZLMxp002?alt=media&token=2c2b28f4-b3f5-4b9c-9673-805a93637a69",
    //     description: "La chaîne TF1 propose une programmation familiale et événementielle. Appréciée pour son offre diversifiée en fiction, sport, cinéma, jeunesse, magazine et documentaire, ses journaux d’information offrent un regard exigeant sur le monde. Leader tout en étant proche du public, sa mission première est d’informer et divertir.",
    //     fbLink: "https://www.facebook.com/TF1",
    //     genre: "Reality",
    //     hqCountry: "France",
    //     instaLink: "https://www.instagram.com/tf1",
    //     logoLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Flogo-RsKZAhtBMcUaQw2U8L4aZLMxp002?alt=media&token=cf0f633d-32bf-4d53-8c7f-01f9c33b9013",
    //     mainLanguage:"Frensh",
    //     sateliteFrequency: "19.2° Est",
    //     webStreamLink: "https://www.tntendirect.com/TF1-en-direct",
    //     youtubeLink: "https://www.youtube.com/user/tf1",),
    // Channels(
    //     id: "0Hb6Wt5mMdY8AZZDzfkgMYMj4fv2",
    //     broadCastRegion: "USA",
    //     channelName: "T-Square",
    //     channelSlogan: " Nothing is impossible",
    //     coverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Fcover-RsKZAhtBMcUaQw2U8L4aZLMxp002?alt=media&token=2c2b28f4-b3f5-4b9c-9673-805a93637a69",
    //     description: "La chaîne TF1 propose une programmation familiale et événementielle. Appréciée pour son offre diversifiée en fiction, sport, cinéma, jeunesse, magazine et documentaire, ses journaux d’information offrent un regard exigeant sur le monde. Leader tout en étant proche du public, sa mission première est d’informer et divertir.",
    //     fbLink: "https://www.facebook.com/TF1",
    //     genre: "News",
    //     hqCountry: "Germany",
    //     instaLink: "https://www.instagram.com/tf1",
    //     logoLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Flogo-RsKZAhtBMcUaQw2U8L4aZLMxp002?alt=media&token=cf0f633d-32bf-4d53-8c7f-01f9c33b9013",
    //     mainLanguage:"German",
    //     sateliteFrequency: " 11559 MHz",
    //     webStreamLink: "https://www.6play.fr/m6/direct",
    //     youtubeLink: "https://www.youtube.com/channel/UCoJs009FeAVHzLZv6WyBf9g"),

    // Channels(id: "RsKZAhtBMcUaQw2U8L4aZLMxp002",
    //     broadCastRegion: "Chionese",
    //     channelName: "Corona",
    //     channelSlogan: "Devil ",
    //     coverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Fcover-PoJfOiddYXMqN6AGbFWHEs4AGEx1?alt=media&token=9c5f570f-3716-48ec-86a8-6da79083d128",
    //     description: "6play est laa première offre de divertissement vidéo gratuite et 100% personnalisée. Avec plus de 300 programmes et 3000 heures de télévision, 6play propose une propose une offre de contenus profonde, diverse et exclusive.",
    //     fbLink: "https://www.facebook.com/6play",
    //     genre: "Docs",
    //     hqCountry: "Chinese",
    //     instaLink: "https://www.instagram.com/6play/",
    //     logoLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Flogo-PoJfOiddYXMqN6AGbFWHEs4AGEx1?alt=media&token=ebe3b844-048d-42c8-b6ea-2067d88a5899",
    //     mainLanguage: "Chinese",
    //     sateliteFrequency: " 12168",
    //     webStreamLink: "https://www.6play.fr/m6/direct",
    //     youtubeLink: "https://www.youtube.com/channel/UCoJs009FeAVHzLZv6WyBf9g"),

    //     Channels(id: "jSkLQirvdyXmmxmw8sRn4ihCpxL2",
    //     broadCastRegion: "Chionese",
    //     channelName: "Corona",
    //     channelSlogan: "Devil ",
    //     coverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Fcover-PoJfOiddYXMqN6AGbFWHEs4AGEx1?alt=media&token=9c5f570f-3716-48ec-86a8-6da79083d128",
    //     description: "6play est laa première offre de divertissement vidéo gratuite et 100% personnalisée. Avec plus de 300 programmes et 3000 heures de télévision, 6play propose une propose une offre de contenus profonde, diverse et exclusive.",
    //     fbLink: "https://www.facebook.com/6play",
    //     genre: "Docs",
    //     hqCountry: "Chinese",
    //     instaLink: "https://www.instagram.com/6play/",
    //     logoLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Flogo-PoJfOiddYXMqN6AGbFWHEs4AGEx1?alt=media&token=ebe3b844-048d-42c8-b6ea-2067d88a5899",
    //     mainLanguage: "Chinese",
    //     sateliteFrequency: " 12168",
    //     webStreamLink: "https://www.6play.fr/m6/direct",
    //     youtubeLink: "https://www.youtube.com/channel/UCoJs009FeAVHzLZv6WyBf9g"),

    //     Channels(id: "12k98kG8HaameY01Xlw8L2W38ZF2",
    //     broadCastRegion: "Chionese",
    //     channelName: "Corona",
    //     channelSlogan: "Devil ",
    //     coverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Fcover-PoJfOiddYXMqN6AGbFWHEs4AGEx1?alt=media&token=9c5f570f-3716-48ec-86a8-6da79083d128",
    //     description: "6play est laa première offre de divertissement vidéo gratuite et 100% personnalisée. Avec plus de 300 programmes et 3000 heures de télévision, 6play propose une propose une offre de contenus profonde, diverse et exclusive.",
    //     fbLink: "https://www.facebook.com/6play",
    //     genre: "Docs",
    //     hqCountry: "Chinese",
    //     instaLink: "https://www.instagram.com/6play/",
    //     logoLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Flogo-PoJfOiddYXMqN6AGbFWHEs4AGEx1?alt=media&token=ebe3b844-048d-42c8-b6ea-2067d88a5899",
    //     mainLanguage: "Chinese",
    //     sateliteFrequency: " 12168",
    //     webStreamLink: "https://www.6play.fr/m6/direct",
    //     youtubeLink: "https://www.youtube.com/channel/UCoJs009FeAVHzLZv6WyBf9g"),

    //     Channels(id: "WgtXGVp5IfTXYkFFN5kGLCVMcjz2",
    //     broadCastRegion: "Chionese",
    //     channelName: "Corona",
    //     channelSlogan: "Devil ",
    //     coverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Fcover-PoJfOiddYXMqN6AGbFWHEs4AGEx1?alt=media&token=9c5f570f-3716-48ec-86a8-6da79083d128",
    //     description: "6play est laa première offre de divertissement vidéo gratuite et 100% personnalisée. Avec plus de 300 programmes et 3000 heures de télévision, 6play propose une propose une offre de contenus profonde, diverse et exclusive.",
    //     fbLink: "https://www.facebook.com/6play",
    //     genre: "Docs",
    //     hqCountry: "Chinese",
    //     instaLink: "https://www.instagram.com/6play/",
    //     logoLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Flogo-PoJfOiddYXMqN6AGbFWHEs4AGEx1?alt=media&token=ebe3b844-048d-42c8-b6ea-2067d88a5899",
    //     mainLanguage: "Chinese",
    //     sateliteFrequency: " 12168",
    //     webStreamLink: "https://www.6play.fr/m6/direct",
    //     youtubeLink: "https://www.youtube.com/channel/UCoJs009FeAVHzLZv6WyBf9g"),

    //     Channels(id: "vdDpUippR4aFs6VVuVE5QyKErgu1",
    //     broadCastRegion: "Chionese",
    //     channelName: "Corona",
    //     channelSlogan: "Devil ",
    //     coverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Fcover-PoJfOiddYXMqN6AGbFWHEs4AGEx1?alt=media&token=9c5f570f-3716-48ec-86a8-6da79083d128",
    //     description: "6play est laa première offre de divertissement vidéo gratuite et 100% personnalisée. Avec plus de 300 programmes et 3000 heures de télévision, 6play propose une propose une offre de contenus profonde, diverse et exclusive.",
    //     fbLink: "https://www.facebook.com/6play",
    //     genre: "Docs",
    //     hqCountry: "Chinese",
    //     instaLink: "https://www.instagram.com/6play/",
    //     logoLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Flogo-PoJfOiddYXMqN6AGbFWHEs4AGEx1?alt=media&token=ebe3b844-048d-42c8-b6ea-2067d88a5899",
    //     mainLanguage: "Chinese",
    //     sateliteFrequency: " 12168",
    //     webStreamLink: "https://www.6play.fr/m6/direct",
    //     youtubeLink: "https://www.youtube.com/channel/UCoJs009FeAVHzLZv6WyBf9g"),

    //     Channels(id: "dVnFHkeuLBOkWD8pUd1kCjiyulp1",
    //     broadCastRegion: "Chionese",
    //     channelName: "Corona",
    //     channelSlogan: "Devil ",
    //     coverLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Fcover-PoJfOiddYXMqN6AGbFWHEs4AGEx1?alt=media&token=9c5f570f-3716-48ec-86a8-6da79083d128",
    //     description: "6play est laa première offre de divertissement vidéo gratuite et 100% personnalisée. Avec plus de 300 programmes et 3000 heures de télévision, 6play propose une propose une offre de contenus profonde, diverse et exclusive.",
    //     fbLink: "https://www.facebook.com/6play",
    //     genre: "Docs",
    //     hqCountry: "Chinese",
    //     instaLink: "https://www.instagram.com/6play/",
    //     logoLink: "https://firebasestorage.googleapis.com/v0/b/timytime-app.appspot.com/o/channelProfile%2Flogo-PoJfOiddYXMqN6AGbFWHEs4AGEx1?alt=media&token=ebe3b844-048d-42c8-b6ea-2067d88a5899",
    //     mainLanguage: "Chinese",
    //     sateliteFrequency: " 12168",
    //     webStreamLink: "https://www.6play.fr/m6/direct",
    //     youtubeLink: "https://www.youtube.com/channel/UCoJs009FeAVHzLZv6WyBf9g"),

        
  ];

  List<Channels> get channel {
    return [..._channel];
  }
  Channels findById(String id){
    return channel.firstWhere((prod)=>prod.id==id);
  }

  Future<void> getChannels()async{
    _channel.clear();
    QuerySnapshot snapshot= await Firestore.instance.collection('users').getDocuments();
    snapshot.documents.forEach((data) {
      _channel.add(Channels(
        description: data.data['description'],
        webStreamLink: data.data['webStreamLink'],
        mainLanguage: data.data['mainLanguage'],
        id: data.documentID,
        fbLink: data.data['fbLink'],
        logoLink: data.data['logoLink'],
        channelSlogan: data.data['channelSlogan'],
        genre: data.data['genre'],
        instaLink: data.data['instaLink'],
        channelName: data.data['channelName'],
        coverLink: data.data['coverLink'],
        broadCastRegion: data.data['broadcastRegion'],
        sateliteFrequency: data.data['sateliteFrequency'],
        youtubeLink: data.data['youtubeLink'],
        hqCountry: data.data['hqCountry'],
      ));
    });
    notifyListeners();
  }

  Channels findByChannelId(String channelId){
    return _channel.firstWhere((prod)=>prod.id==channelId);
  }
}


