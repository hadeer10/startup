import 'package:flutter/material.dart';
import 'package:flutter_auth/models/home_post_model.dart';
import 'package:flutter_auth/modeproviderr.dart';
import 'package:provider/provider.dart';

class PostDetailsScreen extends StatelessWidget {
  HomePostsItemModel model;
  PostDetailsScreen(this.model);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
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
      ),
    );
  }
}
