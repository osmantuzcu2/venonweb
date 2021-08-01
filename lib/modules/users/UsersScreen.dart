import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venonweb/modules/users/UsersListController.dart';
import 'package:venonweb/screens/general-components/general-components.dart';
import 'package:venonweb/screens/main/components/side_menu.dart';

import '../../constants.dart';
import 'UsersModel.dart';

class UsersListScreen extends StatelessWidget {
  final UsersListController c = Get.put(UsersListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: kernel(
          "Kullanıcılar",
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
                          child: formButton("Yeni Kullanıcı Ekle",
                              Icon(Icons.add), Colors.blue, () {
                            c.clearForm();
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return GetBuilder<UsersListController>(
                                      builder: (_) {
                                    return dialog(
                                        context,
                                        Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: secondaryColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  child: DropdownButton<int>(
                                                    isExpanded: true,
                                                    value:
                                                        c.selectedValue!.code,
                                                    onChanged: (val) {
                                                      c.select(val);
                                                    },
                                                    items: userType.map((item) {
                                                      return DropdownMenuItem<
                                                          int>(
                                                        value: item.code,
                                                        child: new Text(
                                                            item.type!),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            genInput("Adı", c.nameCont, false),
                                            genInput(
                                                "Soyadı", c.surnameCont, false),
                                            emailInput("E-Mail", c.mailCont),
                                            phoneInput("Telefon", c.phoneCont),
                                            genInput(
                                                "Parola", c.passwordCont, true),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: formButton(
                                                    "Kaydet",
                                                    Icon(Icons.save),
                                                    Colors.blue, () {
                                                  c.createUser(
                                                      c.selectedValue!.code,
                                                      c.passwordCont.text,
                                                      c.nameCont.text,
                                                      c.surnameCont.text,
                                                      c.mailCont.text,
                                                      c.phoneCont.text);
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
                      GetBuilder<UsersListController>(
                          init: UsersListController(),
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
                            } else if (c.userList!.data!.length == 0) {
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
                                            label: Text("Kullanıcı"),
                                          ),
                                          DataColumn(
                                            label: Text("E-Mail"),
                                          ),
                                          DataColumn(
                                            label: Text("Ayarlar"),
                                          ),
                                        ],
                                        rows: List.generate(
                                          c.userList!.data!.length,
                                          (index) => recentFileDataRow(
                                              c.userList!.data![index],
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

DataRow recentFileDataRow(Datum users, context, UsersListController c) {
  return DataRow(
    cells: [
      DataCell(Text(users.name!)),
      DataCell(Text(users.eMail!)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                c.createFrom(users);
                showDialog(
                    context: context,
                    builder: (context) {
                      return dialog(
                          context,
                          Column(
                            children: [
                              genText("Kullanıcı Id " + users.id!.toString()),
                              genInput("Kullanıcı Adı", c.userNameCont, false),
                              genText("Kullanıcı Tipi : " +
                                  users.userType!.toString()),
                              genInput("Adı", c.nameCont, false),
                              genInput("Soyadı", c.surnameCont, false),
                              genInput("E-Mail", c.mailCont, false),
                              genInput("Telefon", c.phoneCont, false),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: formButton(
                                    "Güncelle", Icon(Icons.update), Colors.blue,
                                    () {
                                  c.updateUser(
                                    users.id!,
                                    c.userNameCont.text,
                                    users.userType!,
                                    c.nameCont.text,
                                    c.surnameCont.text,
                                    c.mailCont.text,
                                    c.phoneCont.text,
                                  );
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
                      onPressed: () => c.deleteUser(users.id),
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
