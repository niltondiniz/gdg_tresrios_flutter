import 'package:appgdg/util/constants.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset(
                'assets/images/logo_gdg.png',
              ),
              width: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'GDG Três Rios Covid19',
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
      body: ListView.separated(
        itemCount: listEstados.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              print(listEstados[i]['sigla']);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    sigla: listEstados[i]['sigla'],
                    state: listEstados[i]['nome'],
                  ),
                ),
              );
            },
            child: ListTile(
              title: Text(
                listEstados[i]['nome'],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              leading: Icon(
                Icons.coronavirus,
                color: Colors.red,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Colors.black26,
        ),
      ),
    );
  }
}
