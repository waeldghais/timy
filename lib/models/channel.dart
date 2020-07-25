import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Channels with ChangeNotifier {
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

class ChannelModel with ChangeNotifier {
  final List<Channels> _channel = [];

  List<Channels> get channel {
    return [..._channel];
  }

  Channels findById(String id) {
    return channel.firstWhere((prod) => prod.id == id);
  }

  Future<void> getChannels() async {
    _channel.clear();
    QuerySnapshot snapshot =
        await Firestore.instance.collection('users').getDocuments();
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

  Channels findByChannelId(String channelId) {
    return _channel.firstWhere((prod) => prod.id == channelId);
  }
}
