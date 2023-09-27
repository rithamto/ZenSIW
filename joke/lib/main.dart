import 'package:flutter/material.dart';
import 'package:joke/cubit/main_cubit.dart';
import 'package:joke/global_color.dart';
import 'package:joke/global_img.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke/model/Joke.dart';

void main() {
  runApp(MainApp.provider());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static BlocProvider provider() {
    return BlocProvider<MainCubit>(
      create: (context) => MainCubit(),
      child: const MainApp(),
    );
  }

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    context.read<MainCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Image.asset(
            GlobalImages.logo,
            width: 25,
            height: 25,
          ),
          actions: const [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Handicraft by",
                  style: TextStyle(fontSize: 11),
                ),
                Text(
                  "Jim HLS",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(GlobalImages.avatar),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: GlobalColors.green),
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.05,
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: const Column(children: [
                    Text(
                      "A joke a day keeps doctor away",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "If you joke wrong way, your teeth have to pay. (Serious)",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )
                  ]),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.08,
                        right: MediaQuery.of(context).size.width * 0.08,
                        top: MediaQuery.of(context).size.height * 0.1),
                    child: BlocBuilder<MainCubit, MainState>(
                      builder: (context, state) {
                        final index = state.data!.index;
                        return Text(origin.lst![index].str ?? "");
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              maximumSize: Size.fromWidth(200),
                              backgroundColor: GlobalColors.blue,
                              shape: const ContinuousRectangleBorder()),
                          onPressed: () {
                            context.read<MainCubit>().handle();
                          },
                          child: const Text("This is Funny!",
                              style: TextStyle(color: Colors.white))),
                      const SizedBox(
                        width: 40,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              maximumSize: Size.fromWidth(160),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              backgroundColor: GlobalColors.green,
                              shape: const ContinuousRectangleBorder()),
                          onPressed: () {
                            context.read<MainCubit>().handle();
                          },
                          child: const Text(
                            "This is not Funny",
                            style: TextStyle(color: Colors.white),
                          )),
                      const Spacer(),
                    ],
                  ),
                ),
                const Column(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: Text(
                      "This appis created as part of Hlsolutions program. The materials contained on this website are provided for general information only and do not constitute any form of advice. HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the information contained on this site",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Copyright 2022 HLS")
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
