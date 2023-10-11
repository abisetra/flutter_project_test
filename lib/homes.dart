import 'package:si_kb_pintar/resources/color_resources.dart';
import 'package:si_kb_pintar/screen/about.dart';
import 'package:si_kb_pintar/screen/khawatir_kehamilan_quiz.dart';
import 'package:si_kb_pintar/screen/list_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

void main() {
  runApp(const Welcome());
}

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SI KB Pintar',
      theme: ThemeData(
        primarySwatch: Pallete.blueKB,
      ),
      home: const MyHomePage(title: 'Si KB Pintar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String greeting() {
    var jam = DateTime.now().hour;
    if (jam < 10) {
      return 'Selamat Pagi';
    }
    if (jam < 14) {
      return 'Selamat Siang';
    }
    if (jam < 18) {
      return 'Selamat Sore';
    }
    return 'Selamat Malam';
  }

  late TutorialCoachMark tutorialCoachMark;
  late SharedPreferences prefs;

  List<TargetFocus> targets = [];

  GlobalKey key = GlobalKey();

  @override
  void initState() {
    initTargets();
    init();
    super.initState();
  }

  Future init() async {
    prefs = await SharedPreferences.getInstance();
    bool finishedIntro = (prefs.getBool('finished_intro') ?? false);

    if (finishedIntro) {
      return super.initState();
    } else
      await prefs.setBool('finished_intro', true);
    return showTutorial();
  }

  void initTargets() {
    targets.add(
      TargetFocus(
        identify: "Target 1",
        keyTarget: key,
        color: Colors.black45,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Selamat Datang!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Silahkan tekan di bagian sini untuk melihat metode kontrasepsi yang akan ibu lihat.",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );
  }

  void showTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black54,
      textSkip: "LEWATI",
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onSkip: () {
        print("skip");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
    )..show(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 160,
              child: AppBar(
                title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 4, top: 14),
                        child: Text(greeting() + '!',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 24)),
                      ),
                    ]),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(28),
                )),
                elevation: 2.0,
              ),
            ),
            Column(
              children: [
                Opacity(
                    child: AppBar(
                      title: Text('Invisible Space'),
                    ),
                    opacity: 0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 8.0),
                        margin: const EdgeInsets.only(
                            left: 22.0, right: 22.0, top: 10, bottom: 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular((12))),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 24.0,
                                      left: 14.0,
                                      right: 0.0,
                                      bottom: 0.0),
                                  child: Text(
                                    'Si KB Pintar',
                                    style: TextStyle(
                                        color: ColorsResources.primary_blue,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 4.0,
                                      left: 14.0,
                                      right: 0.0,
                                      bottom: 24.0),
                                  child: Text(
                                    'Aplikasi Keluarga Berencana Pintar',
                                    style: TextStyle(
                                        color: ColorsResources.primary_blue,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                        shadows: [
                                          Shadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              blurRadius: 1,
                                              offset: Offset(0.2, 0.2)),
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                            Flexible(fit: FlexFit.tight, child: SizedBox()),
                            IconButton(
                                padding: EdgeInsets.only(right: 22),
                                icon: Image.asset("assets/icons/infoo.png",
                                    fit: BoxFit.contain, width: 32),
                                iconSize: 32,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutScreen()),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 24.0, left: 30.0, right: 0.0, bottom: 14.0),
                      child: Text(
                        'Metode Kontrasepsi',
                        style: TextStyle(
                            color: ColorsResources.black1,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      key: key,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        JangkaPanjangListView()));
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Image.asset(
                                      "assets/icons/jangka_panjang.png",
                                      fit: BoxFit.contain),
                                  iconSize: 78,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                JangkaPanjangListView()));
                                  },
                                ),
                                Text('Jangka Panjang\nSangat Efektif',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorsResources.black1,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14)),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SangatEfektifListView()));
                          },
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                icon: Image.asset(
                                    "assets/icons/sangat_efektif.png",
                                    fit: BoxFit.contain),
                                iconSize: 78,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SangatEfektifListView()));
                                },
                              ),
                              Text('Sangat Efektif',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorsResources.black1,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                  maxLines: 3),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SadarMasaSuburListView()));
                          },
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Image.asset(
                                      "assets/icons/sadar_masa_subur.png",
                                      fit: BoxFit.contain),
                                  iconSize: 78,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SadarMasaSuburListView()));
                                  },
                                ),
                                Text('Efektif Dengan\nPemakaian Benar',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorsResources.black1,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: 28, right: 28, top: 26),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(29),
                              child: Image.asset('assets/icons/alkon.png',
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 24.0, left: 30.0, right: 0.0, bottom: 14.0),
                      child: Text(
                        'Informasi Tambahan',
                        style: TextStyle(
                            color: ColorsResources.black1,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HivAidsListView()));
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 5, bottom: 36),
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Image.asset("assets/icons/hiv_aids.png",
                                      fit: BoxFit.contain),
                                  iconSize: 78,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HivAidsListView()));
                                  },
                                ),
                                Text('HIV / AIDS',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorsResources.black1,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14)),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        KhawatirKehamilanQuiz()));
                          },
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                icon: Image.asset(
                                    "assets/icons/khawatir_kehamilan.png",
                                    fit: BoxFit.contain),
                                iconSize: 78,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              KhawatirKehamilanQuiz()));
                                },
                              ),
                              Text('Khawatir\n Kehamilan',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorsResources.black1,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                  maxLines: 2),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          KontrasepsiDaruratListView()));
                            },
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Image.asset(
                                      "assets/icons/kontrasepsi_darurat.png",
                                      fit: BoxFit.contain),
                                  iconSize: 78,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                KontrasepsiDaruratListView()));
                                  },
                                ),
                                Text('Kontrasepsi\n Darurat',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorsResources.black1,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                    maxLines: 2),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

showAlertDialog(BuildContext context) {
  String deskripsiApp =
      "Aplikasi SI KB Pintar ini ini mengacu kepada ABPK ber-KB edisi revisi 2018, yang dikeluarkan oleh Kesga Kemenkes RI dilengkapi dengan penjelasan mengenai KB alamiah yang merujuk kepada buku Pedoman Pelayanan Kontrasepsi dan Keluarga Berencana yang dikeluarkan oleh Kementerian Kesehatan RI (2021)\n\nPembuatan Aplikasi SI KB Pintar ini bertujuan untuk menambah wawasan ibu tentang kontrasepsi, sehingga dapat membantu dalam pengambilan keputusan ber-KB\n\nSemoga aplikasi SI KB Pintar ini dapat bermanfaat dan berkontribusi dalam menurunkan unmet need di Indonesia";

  // set up the button
  Widget okButton = TextButton(
    child: Text("Mengerti"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Aplikasi Si KB Pintar",
    ),
    content: Text(deskripsiApp),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
