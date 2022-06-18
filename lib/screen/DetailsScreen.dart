import 'package:flutter/material.dart';
import 'package:flutter_ui_part_01/custom/BorderBox.dart';
import 'package:flutter_ui_part_01/custom/CustomButton.dart';
import 'package:flutter_ui_part_01/utils/constants.dart';
import 'package:flutter_ui_part_01/utils/custom_functions.dart';
import 'package:flutter_ui_part_01/utils/widget_functions.dart';

class DetailsScreen extends StatelessWidget {
  final dynamic itemData;

  const DetailsScreen({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //design top
                  Stack(
                    children: [
                      Image.asset(
                        itemData['image'],
                        height: size.height * 0.30,
                        width: size.width,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                          top: padding,
                          left: padding,
                          child: const BorderBox(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.arrow_back,
                              color: COLOR_BLACK,
                            ),
                          )),
                      Positioned(
                          top: padding,
                          right: padding,
                          child: const BorderBox(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.favorite_border,
                              color: COLOR_BLACK,
                            ),
                          ))
                    ],
                  ),
                  addVerticalSpace(padding),
                  //design mid => price, address and time
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formatCurrency(itemData["amount"]),
                              style: themeData.textTheme.headline1,
                            ),
                            Text(
                              "\$${itemData["address"]}",
                              style: themeData.textTheme.subtitle2,
                            )
                          ],
                        ),
                        BorderBox(
                          child: Text(
                            "20 Hours ago",
                            style: themeData.textTheme.headline5,
                          ),
                          height: 50,
                          width: 130,
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  //design mid => house information
                  Padding(
                    padding: EdgeInsets.only(left: padding),
                    child: Text(
                      "House Information",
                      style: themeData.textTheme.headline4,
                    ),
                  ),
                  addVerticalSpace(padding),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        addHorizontalSpace(padding),
                        HouseInformation(
                            title: "Square Foot", value: itemData["area"]),
                        addHorizontalSpace(10),
                        HouseInformation(
                            title: "Bedrooms", value: itemData["bedrooms"]),
                        addHorizontalSpace(10),
                        HouseInformation(
                            title: "Bathrooms", value: itemData["bathrooms"]),
                        addHorizontalSpace(10),
                        HouseInformation(
                            title: "Garage", value: itemData["garage"]),
                        addHorizontalSpace(padding),
                      ],
                    ),
                  ),
                  //design bottom => house details
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: padding, horizontal: padding),
                    child: Text(
                      itemData["description"],
                      style: themeData.textTheme.bodyText2,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            //design => floating buttons
            Positioned(
                bottom: 20,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionButton(
                        text: "Message",
                        icon: Icons.message,
                        width: size.width * 0.35),
                    addHorizontalSpace(10),
                    OptionButton(
                        text: "Call",
                        icon: Icons.call,
                        width: size.width * 0.35)
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}

class HouseInformation extends StatelessWidget {
  final String title;
  final dynamic value;

  const HouseInformation({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Column(
      children: [
        BorderBox(
            height: 90,
            width: 90,
            child: Text(
              value.toString(),
              style: themeData.textTheme.headline3,
            )),
        addVerticalSpace(10),
        Text(
          title,
          style: themeData.textTheme.headline6,
        )
      ],
    );
  }
}
