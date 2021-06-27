import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/animation.dart';
import 'package:flutter_auth/models/home_post_model.dart';

class PostDetailsScreen extends StatelessWidget {
  HomePostsItemModel model;
  PostDetailsScreen(this.model);
  
  @override
  Widget build(BuildContext context) {
    String score=((model.dataset.score * 100).toString())
                                      .substring(0, 2);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(),
        body: /*Card(
          elevation: 10.0,
          color: Provider.of<Myproiderr>(context).backofcard,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Text(
                    model.created_at,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    model.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: DecorationImage(
                        image: NetworkImage(
                            /*model.image*/ 'https://image.freepik.com/free-photo/start-up-business-creative-people_31965-1843.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    model.content,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Text('Score : '),
                            Text(' ${model.dataset.score}')
                          ],
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Text('country : '),
                            Text(' ${model.dataset.country_code}')
                          ],
                        )),
                        SizedBox(
                          width: 3,
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            Text('category  : '),
                            Text('${model.dataset.category_list}')
                          ],
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Text('funding_rounds : '),
                            Text(' ${model.dataset.funding_rounds}')
                          ],
                        )),
                        SizedBox(
                          width: 3,
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            Text('funding_total_usd  : '),
                            Text('${model.dataset.funding_total_usd}')
                          ],
                        ))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        )*/
        SingleChildScrollView(
          child: Column(
            children: [
             SlideFadeTransition(
               delayStart: Duration(milliseconds: 500),
               animationDuration: Duration(seconds: 1),
               child:  Container(
               margin: EdgeInsets.only(top:0 ,bottom:10 ,right:5 ,left:5 ),
               height: 200.0,
               width: double.infinity,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(3), topRight: Radius.circular(3),bottomLeft: Radius.circular(18),bottomRight: Radius.circular(18)),
                 image: DecorationImage(
                     image: NetworkImage(
                       /*model.image*/ 'https://image.freepik.com/free-photo/start-up-business-creative-people_31965-1843.jpg'),
                     fit: BoxFit.cover),
               ),
             ),
             ),
              Card(
                elevation: 10.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(13), topRight: Radius.circular(13))),
                color: Colors.white,
                child: SlideFadeTransition(
                  delayStart: Duration(milliseconds: 500),
                  animationDuration: Duration(seconds: 1),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.access_time,
                                    //color: ,
                                  ),
                                  Text(
                                    ( model.created_at).substring(0,19),
                                  ),
                                ],
                              ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                           model.title,
                            style: new TextStyle(fontWeight: FontWeight.bold) ,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            model.content,
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                         //start
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Category',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  model.dataset.category_list,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Country',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  model.dataset.country_code,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Percentage',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  ('$score %'),
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // end
                     //start
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Total Funding',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  model.dataset.funding_total_usd.toString(),
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Funding Rounds',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  model.dataset.funding_rounds.toString(),
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                         
                        ],
                      ),
                    ),
                    // end
                        ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )

      ),
    );
  }
}
