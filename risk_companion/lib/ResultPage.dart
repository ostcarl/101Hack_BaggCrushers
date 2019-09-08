import 'package:flutter/material.dart';
import 'package:risk_companion/models/RealRisk.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'ScreenUtils.dart';

class ResultPage extends StatelessWidget {
  final RealRisk _realRisk;
  ResultPage(this._realRisk);
  
  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 90, 160, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
              width: 0,
            ),
            //RiskIndicatorWidget(_realRisk.riskscore),
            RiskIndicatorWidget(),
            SizedBox(
              height: ScreenUtils.getHeight(20),
              width: 0,
            ),
            AdviceTitleWidget(),
            Divider(),
            InformationCardWidget(
              title: "Change your route",
              body: "Your selected route is considered high risk.",
            ),
            InformationCardWidget(
              title: "Wait a moment",
              body: "The weather is not optimal for driving.",
            ),
          ],
        ),
      ),
    );
  }
}

class RiskIndicatorWidget extends StatelessWidget {
  final double _riskScore = 125;

  //RiskIndicatorWidget(this._riskScore);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: double.infinity,
      child: Card(
        elevation: 12.0,
        margin: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
        clipBehavior: Clip.antiAlias,
        shape: CircleBorder(),
        child: Stack(
          children: <Widget>[
            WaveWidget(
              config: CustomConfig(
                gradients: [
                  [
                    Color.fromRGBO(0, 90, 160, 1),
                    Color.fromRGBO(0, 90, 160, 1)
                  ],
                  [Color.fromRGBO(200, 6, 19, 1), Color.fromRGBO(227, 6, 19, 1)],
                  [Colors.orange, Color(0x66FF9800)],
                  [Colors.yellow, Color(0x55FFEB3B)]
                ],
                durations: [35000, 19440, 10800, 6000],
                //heightPercentages: [0, 0.20, 0.25, 0.30],
                heightPercentages: [0, 1-(_riskScore/250)-0.15, 1-(_riskScore/250)-0.10, 1-(_riskScore/250)-0.05],
                blur: MaskFilter.blur(BlurStyle.solid, 10),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 0,
              backgroundColor: Color.fromRGBO(0, 90, 160, 1),
              size: Size(double.infinity, double.infinity),
            ),
            Center(
                child: Text(
              riskText(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white70),
            )),
          ],
        ),
      ),
    );
  }
  String riskText(){
    if (_riskScore <= 100)
      return "Low Risk";
    else if (_riskScore <=150)
      return "Medium Risk";
    else if (_riskScore > 150)
      return "High Risk";
    return "";
  }
}

class InformationCardWidget extends StatelessWidget {
  final String title;
  final String body;

  InformationCardWidget({@required this.title, @required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtils.getWidth(10)),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        color: Color.fromRGBO(227, 6, 19, 0.8),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: ScreenUtils.getHeight(30),
              horizontal: ScreenUtils.getWidth(20)),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: ScreenUtils.getFontSize(21),
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: ScreenUtils.getHeight(5),
                    ),
                    Text(
                      body,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: ScreenUtils.getFontSize(15),
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdviceTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Minimize your risk",
          style: TextStyle(
              fontSize: ScreenUtils.getFontSize(20), color: Colors.grey),
        ),
        SizedBox(
          width: ScreenUtils.getWidth(2),
        ),
        Icon(
          Icons.trending_down,
          size: ScreenUtils.getWidth(30),
        ),
      ],
    );
  }
}
