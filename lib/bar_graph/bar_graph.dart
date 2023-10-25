import 'package:bargraph/bar_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget{
  final List weeklysummary;
  //constructors
  const MyBarGraph({super.key,required this.weeklysummary});
  //build function
  Widget build (BuildContext context){
    //creating an instance of BarData class
    BarData myBarData=BarData(sunAmount: weeklysummary[0], monAmount: weeklysummary[1], tueAmount: weeklysummary[2], wedAmount: weeklysummary[3], thurAmount: weeklysummary[4], friAmount: weeklysummary[5], satAmount: weeklysummary[6]);
   //calling the method of BarData class
    myBarData.initialisedBarData();
    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        gridData:const FlGridData(show: false),
        borderData:FlBorderData(show:false),
        titlesData:const  FlTitlesData(
          show:true,
          topTitles: AxisTitles(sideTitles:   SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles:  SideTitles(showTitles: false)),
            rightTitles:  AxisTitles(sideTitles:  SideTitles(showTitles: false)),
            bottomTitles:  AxisTitles(sideTitles:  SideTitles(
                showTitles:true,
                getTitlesWidget:getBottomTitles )),
        ),
        barGroups: myBarData.barData.map((data) => BarChartGroupData(
            x: data.x,
            barRods: [BarChartRodData(toY: data.y,
                color: Colors.green,
                width: 24,
                borderRadius: BorderRadius.circular(4))
            ],


        )).toList(),

      )
    );
  }
}

Widget getBottomTitles(double value,TitleMeta meta){
  const style=TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 16
  );
  Widget text;
  switch(value.toInt()){
    case 1:
      text =const Text("S",style: style,);
    case 2:
      text =const Text("M",style: style,);
    case 3:
      text =const Text("T",style: style,);
    case 4:
      text =const Text("W",style: style,);
    case 5:
      text =const Text("T",style: style,);
    case 6:
      text =const Text("F",style: style,);
    case 7:
      text =const Text("M",style: style,);
    default:
      text =const Text("",style: style,);
  }
  return  SideTitleWidget(child:text,axisSide:meta.axisSide);
}

