import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venonweb/modules/dealers/map.dart';
import 'package:venonweb/screens/general-components/general-components.dart';
import 'package:venonweb/screens/main/components/side_menu.dart';

import '../../constants.dart';
import 'DealersListController.dart';
import 'DealersModel.dart';

class DealersListScreen extends StatelessWidget {
  final DealersListController c = Get.put(DealersListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: kernel(
          "Bayiler",
          context,
          SafeArea(
              child: Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: formButton(
                              "Yeni Bayi Ekle", Icon(Icons.add), Colors.blue,
                              () {
                            c.clearForm();
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return GetBuilder<DealersListController>(
                                      builder: (_) {
                                    return dialog(
                                        context,
                                        Column(
                                          children: [
                                            genInput("Bayi Tanımı", c.titleCont,
                                                false),
                                            genTextArea(
                                                "Adresi", c.addressCont, false),
                                            emailInput("E-Mail", c.mailCont),
                                            phoneInput("Telefon", c.phoneCont),
                                            Container(
                                                height: 150,
                                                child: GoogleMap()),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: formButton(
                                                    "Kaydet",
                                                    Icon(Icons.save),
                                                    Colors.blue, () {
                                                  c.createDealer(
                                                      c.titleCont.text,
                                                      c.mailCont.text,
                                                      c.phoneCont.text,
                                                      c.addressCont.text,
                                                      42,
                                                      1,
                                                      c.lat,
                                                      c.long);
                                                }),
                                              ),
                                            )
                                          ],
                                        ));
                                  });
                                });
                          }),
                        ),
                      ),
                      GetBuilder<DealersListController>(
                          init: DealersListController(),
                          builder: (_) {
                            if (c.isLoading == true) {
                              return Center(
                                  child: Container(
                                      padding: EdgeInsets.all(300),
                                      child: CircularProgressIndicator()));
                            } else if (c.error == true) {
                              return Center(
                                  child: Container(
                                      padding: EdgeInsets.all(300),
                                      child: Text("Sunucuya Ertişilemiyor")));
                            } else if (c.dealerList!.data!.length == 0) {
                              return Center(
                                  child: Container(
                                      padding: EdgeInsets.all(300),
                                      child: Text("Datalara erişilemiyor")));
                            } else {
                              return Container(
                                padding: EdgeInsets.all(defaultPadding),
                                margin: EdgeInsets.all(defaultPadding),
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: DataTable2(
                                        columnSpacing: defaultPadding,
                                        minWidth: 600,
                                        columns: [
                                          DataColumn(
                                            label: Text("Bayi Tanımı"),
                                          ),
                                          DataColumn(
                                            label: Text("E-Mail"),
                                          ),
                                          DataColumn(
                                            label: Text("Ayarlar"),
                                          ),
                                        ],
                                        rows: List.generate(
                                          c.dealerList!.data!.length,
                                          (index) => recentFileDataRow(
                                              c.dealerList!.data![index],
                                              context,
                                              c),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }),
                    ],
                  )))),
    );
  }
}

DataRow recentFileDataRow(Datum Dealers, context, DealersListController c) {
  return DataRow(
    cells: [
      DataCell(Text(Dealers.title!)),
      DataCell(Text(Dealers.eMail!)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                c.createFrom(Dealers);
                showDialog(
                    context: context,
                    builder: (context) {
                      return dialog(
                          context,
                          Column(
                            children: [
                              genText("Bayi Id " + Dealers.id!.toString()),
                              genInput("Bayi Tanımı", c.titleCont, false),
                              genInput("Adres", c.addressCont, false),
                              genInput("E-Mail", c.mailCont, false),
                              genInput("Telefon", c.phoneCont, false),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: formButton(
                                    "Güncelle", Icon(Icons.update), Colors.blue,
                                    () {
                                  c.updateDealer(
                                      Dealers.id,
                                      c.titleCont.text,
                                      c.mailCont.text,
                                      c.phoneCont.text,
                                      c.addressCont.text,
                                      42,
                                      1,
                                      c.lat,
                                      c.long);
                                }),
                              )
                            ],
                          ));
                    });
              },
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                Get.dialog(AlertDialog(
                  title: Text('Emin misiniz?'),
                  content: Text("Silmek istediğinizden emin misiniz?"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Get.back(),
                      child: Text('Hayır'),
                    ),
                    TextButton(
                      onPressed: () => c.deleteDealer(Dealers.id),
                      child: Text('Evet'),
                    ),
                  ],
                ));
              },
              icon: Icon(Icons.delete)),
        ],
      )),
    ],
  );
}
