import 'package:flutter/material.dart';
import 'package:netflix/src/constant/global.dart';
import 'package:netflix/src/ui/widgets/category.dart';
import 'package:netflix/src/ui/widgets/movie_list.dart';
import 'package:netflix/src/utils/scroll_behavior.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('res/img/netflix_logo.png'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        child: ScrollConfiguration(
          behavior: MyScrollBehaviour(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                MovieCategory(),
                Padding(padding: EdgeInsets.only(top: 10)),
                _buildMyList(context),
                Padding(padding: EdgeInsets.only(top: 10)),
                _buildPopularList(context),

              ],
            ),
          ),
        ),
      ),
    );
  }
  _buildMyList(context){
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(left:20 , right:20 ) ,
          child:Row(

            children: [
              Expanded(
                  child: Text("My List",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),

                  )


              ),
              Icon(
                Icons.arrow_forward , color:Colors.black,
              ),
            ],
          ),
          ),
          MovieList(type:MovieListType.topRated ,  onItemInteraction: null)
        ],
      ),
    );
  }

  _buildPopularList(context){
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(left:20 , right:20 ) ,
            child:Row(

              children: [
                Expanded(
                    child: Text("Popular List",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),

                    )


                ),
                Icon(
                  Icons.arrow_forward , color:Colors.black,
                ),
              ],
            ),
          ),
          MovieList(type:MovieListType.nowPlaying , onItemInteraction: null,)
        ],
      ),
    );
  }
}
