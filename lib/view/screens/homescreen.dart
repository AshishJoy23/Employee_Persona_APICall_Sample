import 'dart:developer';

import 'package:employee_persona_api/controller/api_service.dart';
import 'package:employee_persona_api/model/usermodel.dart';
import 'package:flutter/material.dart';

import '../widgets/cardtilewidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<UserModel>? modelList = [];
  bool isLoaded = false;

  @override
  void initState() {
    getUserData();
    // TODO: implement initState
    super.initState();
  }

  getUserData() async {
    modelList = (await ApiServices().getUsers())!;
    log(modelList.toString());
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => setState(
        () {
          isLoaded = true;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: isLoaded,
                replacement: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4,
                    left: MediaQuery.of(context).size.width * 0.44,
                  ),
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CardTileWidget(
                      user: modelList![index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 10,
                    );
                  },
                  itemCount: modelList!.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
