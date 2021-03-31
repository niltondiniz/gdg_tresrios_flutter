import 'package:appgdg/controllers/detail_controller.dart';
import 'package:appgdg/util/constants.dart';
import 'package:appgdg/models/covid_model.dart';
import 'package:appgdg/widgets/item_information.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final String sigla;
  final String state;

  const DetailPage({Key key, this.sigla, this.state}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoading = false;
  List<CovidModel> originalCovidDatas = [];
  List<CovidModel> covidDatas = [];
  String data;
  DetailController controller = DetailController();

  @override
  void initState() {
    super.initState();

    setState(() {
      isLoading = true;
    });

    /*setState(() {
      covidDatas.add(CovidModel(
        city: 'Três Rios',
        lastAvailableDate: '2021-01-01',
        lastAvailableConfirmed: 100,
        newConfirmed: 0,
        newDeaths: 0,
        lastAvailableDeaths: 0,
      ));
      isLoading = false;
    });*/

    controller.getDataByState(widget.sigla).then((value) {
      setState(() {
        covidDatas = controller.listCovid;
        originalCovidDatas = covidDatas;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textController;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.state),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 60,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 80,
                              child: TextField(
                                controller: textController,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Digite o nome da cidade',
                                  hintStyle: TextStyle(
                                    color: Colors.black38,
                                  ),
                                ),
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    covidDatas = originalCovidDatas
                                        .where((element) => element.city != null
                                            ? element.city
                                                .toUpperCase()
                                                .contains(value.toUpperCase())
                                            : false)
                                        .toList();
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(
                                FontAwesomeIcons.search,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, i) {
                      return Container(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: Text(
                                          '${covidDatas[i].city == null ? 'Totais ' + widget.sigla : covidDatas[i].city}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Último Boletim',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              controller.convertDate(
                                                  covidDatas[i]
                                                      .lastAvailableDate),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ItemInformation(
                                  title: 'Total de casos Confirmados',
                                  data: covidDatas[i]
                                      .lastAvailableConfirmed
                                      .toString(),
                                ),
                                ItemInformation(
                                  title: 'Novos Casos',
                                  data: covidDatas[i].newConfirmed.toString(),
                                ),
                                ItemInformation(
                                  title: 'Total de Óbitos',
                                  data: covidDatas[i]
                                      .lastAvailableDeaths
                                      .toString(),
                                ),
                                ItemInformation(
                                  title: 'Novos Óbitos',
                                  data: covidDatas[i].newDeaths.toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: covidDatas.length,
                  ),
                ),
              ],
            ),
    );
  }
}
