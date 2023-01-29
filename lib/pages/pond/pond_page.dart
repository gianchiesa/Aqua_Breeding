import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/component/pond_card.dart';

import 'package:fish/pages/pond/add_pond_page.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

class PondPage extends StatefulWidget {
  PondPage({Key? key}) : super(key: key);
  @override
  State<PondPage> createState() => _PondPageState();
}

class _PondPageState extends State<PondPage> {
  final PondController controller = Get.put(PondController());
  int? _value = null;
  final chip = ["Aktif", "Panen", "Tidak Aktif"];
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await controller.getPondActivations(
    //       pondId: controller.pond.id.toString());
    // });

    controller.getPondsData(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Kolam',
          style: primaryTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget filter() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Wrap(
          spacing: 8.0,
          children: List<Widget>.generate(
            3,
            (int index) {
              return ChoiceChip(
                label: Text(
                  chip[index],
                  style: TextStyle(color: Colors.white),
                ),
                shape: StadiumBorder(side: BorderSide(color: Colors.white)),
                selected: _value == index,
                backgroundColor: backgroundColor1,
                selectedColor: primaryColor,
                onSelected: (bool selected) {
                  setState(() {
                    _value = selected ? index : null;
                    if (_value == null) {
                      controller.getPondsData(context);
                    } else {
                      controller.getPondsFiltered(chip[index]);
                    }
                  });
                },
              );
            },
          ).toList(),
        ),
      );
    }

    Widget pondList() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemBuilder: ((context, index) {
              return PondCard(pond: controller.ponds[index]
                  // indicatorWater: controller.indicatorWater[index]);
                  );
            }),
            itemCount: controller.ponds.length,
          ),
        ),
      );
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          backgroundColor: backgroundColor1,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => AddPondPage());
            },
            backgroundColor: primaryColor,
            child: const Icon(Icons.add),
          ),
          body: ListView(
            children: [
              title(),
              filter(),
              pondList(),
              SizedBox(
                height: 10,
              )
            ],
          ),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(
            color: secondaryColor,
          ),
        );
      }
    });
  }
}
