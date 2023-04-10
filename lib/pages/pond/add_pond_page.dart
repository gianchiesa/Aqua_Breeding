import 'package:fish/pages/pond/pond_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

class AddPondPage extends StatelessWidget {
  const AddPondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PondController controller = Get.put(PondController());

    Widget aliasInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alias Kolam',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Obx(() {
                return TextFormField(
                  style: primaryTextStyle,
                  onChanged: controller.aliasChanged,
                  onTap: controller.valAlias,
                  controller: controller.aliasController,
                  decoration: controller.validateAlias.value == true
                      ? controller.alias == ''
                          ? InputDecoration(
                              errorText: 'tinggi tidak boleh kosong',
                              isCollapsed: true)
                          : InputDecoration.collapsed(
                              hintText: 'ex: Flamboyan',
                              hintStyle: subtitleTextStyle)
                      : InputDecoration.collapsed(
                          hintText: 'ex: Flamboyan',
                          hintStyle: subtitleTextStyle),
                );
              })),
            ),
          ],
        ),
      );
    }

    Widget locationInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lokasi Kolam (Opsional)',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: TextFormField(
                  style: primaryTextStyle,
                  controller: controller.locationController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'ex: Blok A',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget materialInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Material',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Obx(() => DropdownButtonFormField<String>(
                      onChanged: (newValue) =>
                          controller.materialController.setSelected(newValue!),
                      value: controller.materialController.selected.value,
                      items: controller.materialController.listMaterial
                          .map((material) {
                        return DropdownMenuItem<String>(
                          value: material,
                          child: Text(
                            material,
                            style: primaryTextStyle,
                          ),
                        );
                      }).toList(),
                      dropdownColor: backgroundColor5,
                      decoration: InputDecoration(border: InputBorder.none),
                    )),
              ),
            ),
          ],
        ),
      );
    }

    Widget shapelInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bentuk',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Obx(() => DropdownButtonFormField<String>(
                      onChanged: (newValue) =>
                          controller.shapeController.setSelected(newValue!),
                      value: controller.shapeController.selected.value,
                      items:
                          controller.shapeController.listMaterial.map((shape) {
                        return DropdownMenuItem<String>(
                          value: shape,
                          child: Text(
                            shape,
                            style: primaryTextStyle,
                          ),
                        );
                      }).toList(),
                      dropdownColor: backgroundColor5,
                      decoration: InputDecoration(border: InputBorder.none),
                    )),
              ),
            ),
          ],
        ),
      );
    }

    Widget heightInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tinggi (meter)',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Obx(() {
                return TextFormField(
                  style: primaryTextStyle,
                  keyboardType: TextInputType.number,
                  onChanged: controller.heightChanged,
                  onTap: controller.valHeight,
                  controller: controller.heightController,
                  decoration: controller.validateHeight.value == true
                      ? controller.height == ''
                          ? InputDecoration(
                              errorText: 'tinggi tidak boleh kosong',
                              isCollapsed: true)
                          : InputDecoration.collapsed(
                              hintText: 'ex: 2.1', hintStyle: subtitleTextStyle)
                      : InputDecoration.collapsed(
                          hintText: 'ex: 2.1', hintStyle: subtitleTextStyle),
                );
              })),
            ),
          ],
        ),
      );
    }

    Widget lengthInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Panjang (meter)',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Obx(() {
                return TextFormField(
                  style: primaryTextStyle,
                  keyboardType: TextInputType.number,
                  onChanged: controller.lenghtChanged,
                  onTap: controller.valLenght,
                  controller: controller.lengthController,
                  decoration: controller.validatelenght.value == true
                      ? controller.lenght == ''
                          ? InputDecoration(
                              errorText: 'Panjang tidak boleh kosong',
                              isCollapsed: true)
                          : InputDecoration.collapsed(
                              hintText: 'ex: 1.1', hintStyle: subtitleTextStyle)
                      : InputDecoration.collapsed(
                          hintText: 'ex: 1.1', hintStyle: subtitleTextStyle),
                );
              })),
            ),
          ],
        ),
      );
    }

    Widget widthInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lebar (meter)',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Obx(() {
                return TextFormField(
                  style: primaryTextStyle,
                  keyboardType: TextInputType.number,
                  onChanged: controller.widthChanged,
                  onTap: controller.valWidth,
                  controller: controller.widthController,
                  decoration: controller.validateWidth.value == true
                      ? controller.width == ''
                          ? InputDecoration(
                              errorText: 'lebar tidak boleh kosong',
                              isCollapsed: true)
                          : InputDecoration.collapsed(
                              hintText: 'ex: 1.1', hintStyle: subtitleTextStyle)
                      : InputDecoration.collapsed(
                          hintText: 'ex: 1.1', hintStyle: subtitleTextStyle),
                );
              })),
            ),
          ],
        ),
      );
    }

    Widget diameterInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Diameter (meter)',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Obx(() {
                return TextFormField(
                  style: primaryTextStyle,
                  keyboardType: TextInputType.number,
                  onChanged: controller.diameterChanged,
                  onTap: controller.valDiameter,
                  controller: controller.diameterController,
                  decoration: controller.validatediameter.value == true
                      ? controller.diameter == ''
                          ? InputDecoration(
                              errorText: 'diameter tidak boleh kosong',
                              isCollapsed: true)
                          : InputDecoration.collapsed(
                              hintText: 'ex: 2.1', hintStyle: subtitleTextStyle)
                      : InputDecoration.collapsed(
                          hintText: 'ex: 2.1', hintStyle: subtitleTextStyle),
                );
              })),
            ),
          ],
        ),
      );
    }

    Widget registerButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () async {
            // Get.back();
            controller.shapeController.selected.value == "persegi"
                ? controller.aliasController.text == "" ||
                        controller.heightController.text == "" ||
                        controller.widthController.text == "" ||
                        controller.lengthController.text == ""
                    ? null
                    : await controller.pondRegister(
                        context,
                        () {
                          Navigator.pop(context);
                          controller.getPondsData(context);
                        },
                      )
                : controller.aliasController.text == "" ||
                        controller.heightController.text == "" ||
                        controller.diameterController.text == ""
                    ? null
                    : await controller.pondRegister(
                        context,
                        () {
                          Navigator.pop(context);
                          controller.getPondsData(context);
                        },
                      );

            // profilecontroller.getBreeder();
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Registrasi',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget persegiInput() {
      return Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [widthInput(), lengthInput()],
      ));
    }

    Widget bundarInput() {
      return Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [diameterInput()],
      ));
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor2,
            title: const Text("Registrasi Kolam"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              aliasInput(),
              locationInput(),
              materialInput(),
              shapelInput(),
              controller.shapeController.selected.value == 'persegi'
                  ? persegiInput()
                  : bundarInput(),
              heightInput(),
              registerButton(),
              SizedBox(
                height: 8,
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
