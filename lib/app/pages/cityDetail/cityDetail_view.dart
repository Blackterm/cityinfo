import 'package:cityinfo/app/pages/cityDetail/cityDetail_controller.dart';
import 'package:cityinfo/app/pages/home/home_view.dart';
import 'package:cityinfo/data/repositories/data_city_repository.dart';
import 'package:cityinfo/domain/entities/city.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class CityDetailView extends View {
  final City _city;

  CityDetailView(this._city);

  @override
  State<StatefulWidget> createState() {
    return _CityDetailViewState(
      CityDetailController(
        DataCityRepository(),
      ),
    );
  }
}

class _CityDetailViewState
    extends ViewState<CityDetailView, CityDetailController> {
  _CityDetailViewState(CityDetailController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalKey,
      body: ControlledWidgetBuilder<CityDetailController>(
        builder: (context, controller) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Container(
                    width: size.width,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Color(0xFF6c63ff),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              (context),
                              MaterialPageRoute(
                                builder: (context) => HomeView(),
                              ),
                            );
                            ;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 140),
                          child: Text(
                            widget._city.cityName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 13, top: 30, right: 13),
                            child: Row(
                              children: [
                                Text(
                                  widget._city.cityName,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF6c63ff)),
                                ),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      controller.removeCity(widget._city.uid);
                                    },
                                    child: Icon(
                                      Icons.delete_forever,
                                      color: Color(0xFF6c63ff),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                width: size.width - 30,
                                height: size.height / 3 - 2,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(widget._city.imageUrl),
                                  ),
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
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: size.width - 30,
                                child: Text(
                                  widget._city.content,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
