import '../../Barrel/app_barrel.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    final Size mediaProp = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Background(
          mediaProp: mediaProp,
          child: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Text(
                      'Skip',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    label: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.grey,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaProp.height * 0.85,
                  width: mediaProp.width,
                  child: PageView(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/Splash/images/android.png',
                            height: mediaProp.height * 0.5,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            alignment: Alignment.centerRight,
                            child: const Text(
                              'We will like to send you push notifications.',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                height: 50,
                                width: mediaProp.width * 0.7,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      HomeScreen.routeName,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 80, 163, 246),
                                    shadowColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  child: const Text(
                                    'Allow',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                width: mediaProp.width * 0.7,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 253, 253, 253),
                                    shadowColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  child: const Text(
                                    'Don\'t Allow',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
