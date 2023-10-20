import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:smart_brace_case/src/core/resources/app_constant.dart';
import 'package:smart_brace_case/src/presentation/providers/firebase_auth_service.dart';
import 'package:smart_brace_case/src/presentation/views/main/widget/last_3_article_card.dart';

Logger logger = Logger();

class DentalPage extends StatefulWidget {
  const DentalPage({super.key});

  @override
  State<DentalPage> createState() => _DentalPageState();
}

class _DentalPageState extends State<DentalPage> {
  final firestore = FirebaseFirestore.instance;

  late DocumentReference doRef;
  String noticePath = "공지사항";
  String qnaPath = "문의사항";

  test({required String uid}) async {
    var dental = await firestore.collection("user").doc(uid).get();
    logger.i(dental.data());

    doRef = FirebaseFirestore.instance.doc(dental.data()!["dental"]);

    var data = await doRef.get();
    logger.i(data.data());

    noticePath = doRef.path + "/notice";

    logger.i("noticePath: $noticePath");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test(
        uid: Provider.of<FirebaseAuthService>(context, listen: false)
            .currentUser!
            .uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("치과")),
      body: ListView(
        children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 1,
            margin: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Image.asset("assets/images/bg_dentistry.jpg"),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "김남주 치과",
                    style: TextStyle(
                      fontSize: 30,
                      shadows: [Shadow(color: Colors.white, blurRadius: 10)],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Last3ArticleCard(firebasePath: noticePath)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "문의사항",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_sharp)),
                    ],
                  ),
                  ListTile(
                    title: const Text("제목"),
                    subtitle: const Text("내용"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("제목"),
                    subtitle: const Text("내용"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("제목"),
                    subtitle: const Text("내용"),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
