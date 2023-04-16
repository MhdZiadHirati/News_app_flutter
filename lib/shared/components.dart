import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';
import 'package:news_app/shared/constants.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({Key? key, required this.article}) : super(key: key);

  final Map article;

  @override
  Widget build(BuildContext context) {
    String imageUrl = ('${article['image']}' == 'null')
        ? 'https://pbs.twimg.com/profile_images/1108430392267280389/ufmFwzIn_400x400.png'
        : '${article['image']}';
    return InkWell(
      onTap: (){
         navigateTo(context, WebViewScreen(url: article['url']),);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: SizedBox(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      '${article['published_at']}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ArticleBuilder extends StatelessWidget {
   const ArticleBuilder({Key? key,required this.list,this.isSearch = false}) : super(key: key);
  final List list;
  final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return (list.isNotEmpty)
        ?ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ArticleItem(
            article: list[index],
          );
        },
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          );
        },
        itemCount: list.length):
    ((isSearch)?Container():
    const Center(
      child: CircularProgressIndicator(),
    ));
  }
}
