import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:venonweb/responsive.dart';
import 'package:venonweb/screens/dashboard/components/header.dart';
import 'package:venonweb/screens/main/components/side_menu.dart';

import '../../constants.dart';
import '../../helper.dart';

Widget genInput(String hint, TextEditingController cont, bool obs) {
  return Container(
    padding: pdd(),
    child: TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Bu alan boş bırakılamaz';
        }
        return null;
      },
      obscureText: obs,
      controller: cont,
      decoration: inpDecoration(hint),
    ),
  );
}

Widget emailInput(String hint, TextEditingController cont) {
  return Container(
    padding: pdd(),
    child: TextFormField(
      decoration: inpDecoration(hint),
      controller: cont,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (!GetUtils.isEmail(value!))
          return "Geçersiz bir E-mail adresi girdiniz.";
        else
          return null;
      },
    ),
  );
}

Widget genTextArea(String hint, TextEditingController cont, bool obs) {
  return Container(
    padding: pdd(),
    child: TextFormField(
      minLines: 3,
      maxLines: 5,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Bu alan boş bırakılamaz';
        }
        return null;
      },
      obscureText: obs,
      controller: cont,
      decoration: inpDecoration(hint),
    ),
  );
}

Widget phoneInput(String hint, TextEditingController cont) {
  return Container(
    padding: pdd(),
    child: TextFormField(
      decoration: inpDecoration(hint),
      controller: cont,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (!GetUtils.isPhoneNumber(value!))
          return "Geçersiz bir Telefon numarası girdiniz.";
        else
          return null;
      },
    ),
  );
}

Widget genText(String text) {
  return Row(
    children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
          margin: EdgeInsets.all(2),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text(text),
        ),
      ),
    ],
  );
}

EdgeInsets pdd() => EdgeInsets.all(2);

InputDecoration inpDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    fillColor: secondaryColor,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
  );
}

Widget formButton(String txt, Icon icn, Color clr, Function() func) {
  return ElevatedButton.icon(
    style: TextButton.styleFrom(
      backgroundColor: clr,
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 1.5, vertical: defaultPadding),
    ),
    onPressed: func,
    icon: icn,
    label: Text(txt),
  );
}

Widget dialog(context, Widget w) {
  return Dialog(
    insetPadding: EdgeInsets.only(
        top: screenW(0.05, context),
        bottom: screenW(0.03, context),
        left: screenW(0.2, context),
        right: screenW(0.2, context)),
    child: Container(margin: EdgeInsets.all(30), child: w),
  );
}

Widget kernel(String title, context, Widget w) {
  return SafeArea(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // We want this side menu only for large screen
        if (Responsive.isDesktop(context))
          Expanded(
            // default flex = 1
            // and it takes 1/6 part of the screen
            child: SideMenu(),
          ),
        Expanded(
          // It takes 5/6 part of the screen
          flex: 5,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Header(title),
                ),
                w,
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
