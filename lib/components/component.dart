import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
//import 'package:hmnews/Modules/web_view/webview_screen.dart';

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
Widget buildArticleItems(artcl, context) => InkWell(
  onTap: (){
    //navgate(context, webviewscreen(artcl['url']),);
  },
  child:   Padding(

        padding: const EdgeInsets.all(20.0),

        child: Row(

          children: [

            Container(

              width: 120.0,

              height: 120.0,

              decoration: BoxDecoration(

                borderRadius: BorderRadius.only(),

                image: DecorationImage(

                  image: NetworkImage('${artcl['urlToImage']}'),

                  fit: BoxFit.cover,

                ),

              ),

            ),

            SizedBox(

              width: 20.0,

            ),

            Expanded(

              child: Container(

                height: 120.0,

                child: Column(

                  mainAxisSize: MainAxisSize.min,

                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [

                    Expanded(

                      child: Text(

                        '${artcl['title']}',

                        style: Theme.of(context).textTheme.bodyText1,

                        maxLines: 4,

                        overflow: TextOverflow.ellipsis,

                      ),

                    ),

                    Text('${artcl['publishedAt']}')

                  ],

                ),

              ),

            ),

          ],

        ),

      ),
);

Widget buildARTList(l, context ,{search = false}) => ConditionalBuilder(
      condition: l.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItems(l[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10,
      ),
      fallback: (context) => search ? Container() : Center(child: CircularProgressIndicator()),
    );

void navgate(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
