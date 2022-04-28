import 'package:cityinfo/app/pages/addCity/addCity_view.dart';
import 'package:cityinfo/app/pages/cityDetail/cityDetail_view.dart';
import 'package:cityinfo/app/pages/home/home_controller.dart';
import 'package:cityinfo/data/repositories/data_city_repository.dart';
import 'package:cityinfo/domain/entities/city.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lottie/lottie.dart';

class HomeView extends View {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState(
      HomeController(
        DataCityRepository(),
      ),
    );
  }
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  _HomeViewState(HomeController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        key: globalKey,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF6c63ff),
          onPressed: () {
            Navigator.push(
              (context),
              MaterialPageRoute(
                builder: (context) => AddCityView(),
              ),
            );
          },
          child: Icon(
            Icons.add,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Color(0xFF6c63ff),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 130),
                            child: Text(
                              "Firebase App",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 22),
                            child: Icon(
                              Icons.account_circle_outlined,
                              size: 38,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        ControlledWidgetBuilder<HomeController>(
                          builder: (context, controller) {
                            return controller.cities != null &&
                                    controller.cities!.length != 0
                                ? Column(
                                    children: [
                                      for (int i = 0;
                                          i < controller.cities!.length;
                                          i++)
                                        _HomeCityCard(
                                            controller.cities![i], controller),
                                    ],
                                  )
                                : Lottie.asset(
                                    'assets/animations/loading.json');
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeCityCard extends StatelessWidget {
  final HomeController _controller;
  final City city;

  _HomeCityCard(this.city, this._controller);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            width: size.width - 36,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(235, 221, 218, 218),
                  offset: Offset(5, 2),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 18,
                  left: 19,
                  right: 15,
                ),
                child: Container(
                  width: 330,
                  height: 165,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          city.imageUrl,
                        )),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(235, 221, 218, 218),
                        offset: Offset(5, 2),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  // child: Image(

                  //   image: NetworkImage(city.imageUrl,),
                  // ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 19),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 26),
                      child: Text(
                        city.cityName,
                        style: TextStyle(
                          color: Color(0xFF6c63ff),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CityDetailView(city)),
                          );
                        },
                        child: Icon(
                          Icons.chevron_right,
                          size: 25,
                          color: Color(0xFF6c63ff),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
