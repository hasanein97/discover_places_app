
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit.dart';
import 'package:flutter_cubit/cubit/app_cubit_state.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_button.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits,CubitStates>(builder: (context,state){
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+detail.place.img),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 40,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 300,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                  width: MediaQuery.of(context).size.width,
                  height:400,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AppLargeText(
                            text: detail.place.name,
                            color: Colors.black54,
                          ),
                          AppLargeText(
                            text: "\$ "+ detail.place.price.toString(),
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          AppText(
                            text:detail.place.location,
                            color: AppColors.textColor1,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(Icons.star,
                                  color: index < detail.place.stars
                                      ? AppColors.starColor
                                      : AppColors.textColor2);
                            }),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          AppText(
                            text: "(5.0)",
                            color: AppColors.textColor2,
                          ),
                        ],
                      ),
                    const
                    SizedBox(
                        height: 5,
                      ),
                      AppLargeText(
                        text: "People",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppText(
                        text:"number of people in your group",
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: (){
                              setState(() {
                                selectedIndex =index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButtons(
                                size: 50,
                                color:selectedIndex ==index? Colors.black:Colors.black,
                                backgroundColor:selectedIndex ==index?Colors.black:Colors.black,
                                borderColor:selectedIndex ==index?Colors.red: AppColors.buttonBackground,
                                isIcon: false,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                     const SizedBox(
                        height: 5,
                      ),
                      AppLargeText(text: "Description",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                    const  SizedBox(
                        height: 5,
                      ),
                      AppText(text:"\$ "+ detail.place.description.toString(),color: AppColors.mainColor,),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: Row(
                  children: [AppButtons(
                    size: 50,
                    color: AppColors.textColor1,
                    backgroundColor: Colors.white,
                    borderColor:AppColors.textColor2,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                    SizedBox(
                      width: 10,
                    ),
                    ResponsiveButton(
                      isResponsive: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
