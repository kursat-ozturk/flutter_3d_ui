import 'package:flutter/material.dart';
import 'package:flutter_3d_ui/inverted_circle_clipper.dart';
import 'package:o3d/o3d.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 3D UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  O3DController o3dController = O3DController();
  PageController mainPageController = PageController();
  PageController textsPageController = PageController();
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          O3D(
            src: 'assets/walking_robot.glb',
            controller: o3dController,
            ar: false,
            autoPlay: true,
            autoRotate: false,
            cameraControls: false,
            cameraTarget: CameraTarget(-2, 1.5, 5.5),
            cameraOrbit: CameraOrbit(0, 90, 1),
          ),
          PageView(
            controller: mainPageController,
            children: [
              const Center(),
              const Center(),
              ClipPath(
                clipper: InvertedCircleClipper(),
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            width: 100,
            height: double.infinity,
            margin: const EdgeInsets.all(12),
            child: PageView(
              controller: textsPageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'My Robot',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Expanded(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                '77',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(0, 20),
                            child: const Text(
                              '%',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(Icons.battery_6_bar_outlined, color: Colors.green),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Battery',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Remaining',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.hourglass_bottom_outlined, color: Colors.blue),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '3.7',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Hours',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(Icons.settings_outlined, color: Colors.grey),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Robot",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Settings',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'My Robot',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 20),
                            child: const Text(
                              '<',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const Expanded(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'Distance',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('Profile'),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Expanded(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text('77'),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(0, 20),
                            child: const Text('%'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        onTap: (page) {
          mainPageController.animateToPage(page,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
          textsPageController.animateToPage(page,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);

          if (page == 0) {
            o3dController.cameraTarget(-2, 1.5, 5.5);
            o3dController.cameraOrbit(0, 90, 1);
          } else if (page == 1) {
            o3dController.cameraTarget(0, 1.8, 0);
            o3dController.cameraOrbit(90, 90, 1.8);
          } else if (page == 2) {
            o3dController.cameraTarget(0, 3, 0);
            o3dController.cameraOrbit(0, 90, 20);
          }

          setState(() {
            this.page = page;
          });
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
