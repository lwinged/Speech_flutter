import 'package:flutter/material.dart';
import 'package:speech/src/models.dart';
import 'package:speech/src/widgets.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:speech/src/admob_config.dart' show appId;

final adUnitId = RewardedVideoAd.testAdUnitId;

MobileAdTargetingInfo targetingInfo = new MobileAdTargetingInfo(
  keywords: <String>['flutterio', 'beautiful apps'],
  contentUrl: 'https://flutter.io',
  birthday: new DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender:
      MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: appId != null
      ? [appId]
      : null, // Android emulators are considered test devices
);

class ReadPost extends StatefulWidget {
  @override
  _ReadPostState createState() => _ReadPostState();
}

class _ReadPostState extends State<ReadPost> {
  //tmp
  var postList = [
    Post(message: "Ceci est mon message trololo"),
    Post(
        message:
            "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte."),
    Post(
        message:
            "Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié."),
    Post(
        message:
            " Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker. On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L'avantage du Lorem Ipsum sur un texte générique comme 'Du texte."),
    Post(
        message:
            " Du texte. Du texte.' est qu'il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. "),
    Post(
        message:
            "De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour 'Lorem Ipsum' vous conduira vers de nombreux sites qui n'en sont encore qu'à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d'y rajouter de petits clins d'oeil, voire des phrases embarassantes)."),
  ];

  ScrollController _scrollController;
  var isRewardedVideoloaded = false;

  @override
  void initState() {
    super.initState();
    initAds();
    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      if (maxScroll == currentScroll && isRewardedVideoloaded) {
        RewardedVideoAd.instance.show();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: postList.length,
      controller: _scrollController,
      itemBuilder: (context, index) {
        return SpeechCard(post: postList[index]);
      },
    );
  }

  void loadPosts() {
    setState(() {
      var p = List<Post>.from(postList);
      postList.addAll(p);
    });
  }

  //tmp move to App Widget
  void initAds() {
    FirebaseAdMob.instance.initialize(appId: appId);
    loadRewardedVideo();
    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      print("RewardedVideoAd event $event");
      if (event == RewardedVideoAdEvent.loaded) {
        isRewardedVideoloaded = true;
      } else if (event == RewardedVideoAdEvent.closed) {
        loadPosts();
        loadRewardedVideo();
      }
    };
  }

  void loadRewardedVideo() {
    isRewardedVideoloaded = false;
    RewardedVideoAd.instance.load(
        adUnitId: RewardedVideoAd.testAdUnitId, targetingInfo: targetingInfo);
  }
}
