import 'package:fish/pages/component/activation_card.dart';
import 'package:fish/pages/pond/activation_breed_page.dart';
import 'package:fish/pages/pond/add_pond_page.dart';
import 'package:fish/pages/pond/deactivation_breed_page.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

class DetailPondPage extends StatelessWidget {
  const DetailPondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailPondController controller = Get.put(DetailPondController());

    Widget pondStatus() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "kolam ${controller.pond.alias}",
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: heavy,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  controller.pond.getGmtToNormalDate(),
                  style: secondaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: controller.pond.getColor()),
                color: transparentColor,
              ),
              child: Center(
                child: Text(
                  controller.pond.pondStatusStr!,
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: heavy,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget activationButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () {
            Get.to(() => ActivationBreedPage(), arguments: controller.pond);
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.green.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Start Budidaya',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget deactivationButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () {
            Get.to(() => DeactivationBreedPage(), arguments: controller.pond);
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Panen',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget detail() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lokasi Kolam",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  controller.pond.location!,
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Bentuk Kolam",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  controller.pond.shape!,
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Material Kolam",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  controller.pond.material!,
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Ukuran Kolam",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  controller.pond.shape! == "persegi"
                      ? "${controller.pond.length}m x ${controller.pond.width}m"
                      : "${controller.pond.diameter}m\u00B2",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget activationTitle() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 2, right: defaultMargin, left: defaultMargin),
        child: Text(
          "List Musim Budidaya",
          style: primaryTextStyle.copyWith(
            fontSize: 14,
            fontWeight: bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      );
    }

    Widget listActivation() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Column(
            children: controller.activations
                .map(
                  (activation) => ActivationCard(
                      activation: activation, pond: controller.pond),
                )
                .toList(),
          ));
    }

    Widget emptyListActivation() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Center(
            child: Column(children: [
              SizedBox(height: 35),
              Image(
                image: AssetImage("assets/unavailable_icon.png"),
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: 20),
              Text(
                "Kolam belum pernah\nmemulai musim budidaya",
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text(
                "Silahkan memulai musim budidaya!",
                style: secondaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ]),
          ));
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor2,
            title: const Text("Detail Kolam"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              pondStatus(),
              controller.pond.isActive == true
                  ? deactivationButton()
                  : activationButton(),
              detail(),
              activationTitle(),
              controller.activations.isEmpty
                  ? emptyListActivation()
                  : listActivation(),
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
