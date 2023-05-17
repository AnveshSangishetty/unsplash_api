import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class images extends StatefulWidget {
  @override
  _imagesState createState() => _imagesState();
}

// ignore: camel_case_types
class _imagesState extends State<images> {

  ScrollController _scrollController=ScrollController();

  var data;
  var images=[];

  @override
  void initState() {
    // TODO: implement initState
    fetchtwo();
    super.initState();

    _scrollController.addListener(() {
        if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
          fetchtwo();
        }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  void fetchimages() async{
    var url=Uri.parse("https://api.unsplash.com/search/photos?per_page=100&client_id=4YpBBkbOfcRA5vItrp68bIkSeOE87UpPStlUMi3x1z4&query=Wallpapers");
    var fetchedData=await http.get(url);
    print(fetchedData);
    var jsondata=json.decode(fetchedData.body);

    setState(() {
      data=jsondata['results'];
    });
    for(int i=0;i<data.length;i++){
      images.add(data[i]);
    }
  }
  void fetchtwo(){
    for(int i=0;i<2;i++){
      fetchimages();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data==null?Center(child: CircularProgressIndicator()):GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1,),
        controller: _scrollController,
          itemCount:data==null?0:images.length,
          itemBuilder: (context,index){
            return Container(width:100,child: Image.network(images[index]['urls']['small']));
          }),
    );
  }
}
