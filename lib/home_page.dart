import 'package:bargraph/bar_graph/bar_graph.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget{
   const HomePage({super.key});
   @override
   State<HomePage> createState()=>_HomePageState();
}
class _HomePageState extends State<HomePage>{

  List<double> weeklySummary=[80.0,2.70,42.00,10.20,100.00,89.20,90.10];
  @override
  Widget build(BuildContext context){
    return Scaffold(
   body: SizedBox(
       height: 400,
       child: MyBarGraph(
         weeklysummary: weeklySummary,
       )),
    );
  }
}