import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:instagram_ui/model/post_model.dart';
import 'package:instagram_ui/model/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  final List<Story> _story = [
    Story('assets/images/feed_1.jpeg', 'Justin'),
    Story('assets/images/feed_2.jpeg', 'Ella'),
    Story('assets/images/feed_3.jpeg', 'Mark'),
    Story('assets/images/feed_1.jpeg', 'Li'),
    Story('assets/images/feed_2.jpeg', 'Jonny'),
    Story('assets/images/feed_3.jpeg', 'Anna'),
  ];

  final List<Post> _post = [
    Post("assets/images/user_1.jpeg", "Justin", "assets/images/feed_1.jpeg",
        "The answer is text-only images are actually a built-in, if not immediately obvious, feature on the platform. You just have to know where to find it."),
    Post("assets/images/user_2.jpeg", "Ella", "assets/images/feed_2.jpeg",
        "The answer is text-only images are actually a built-in, if not immediately obvious, feature on the platform. You just have to know where to find it."),
    Post("assets/images/user_3.jpeg", "Mark", "assets/images/feed_3.jpeg",
        "The answer is text-only images are actually a built-in, if not immediately obvious, feature on the platform. You just have to know where to find it."),
    Post("assets/images/user_1.jpeg", "Li", "assets/images/feed_1.jpeg",
        "The answer is text-only images are actually a built-in, if not immediately obvious, feature on the platform. You just have to know where to find it."),
    Post("assets/images/user_2.jpeg", "Jonny", "assets/images/feed_2.jpeg",
        "The answer is text-only images are actually a built-in, if not immediately obvious, feature on the platform. You just have to know where to find it."),
    Post("assets/images/user_3.jpeg", "Anna", "assets/images/feed_3.jpeg",
        "The answer is text-only images are actually a built-in, if not immediately obvious, feature on the platform. You just have to know where to find it."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Divider(),
                //#stories watch all
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Stieds ",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const Text(
                        "Watch All",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                //#storyList
                Container(
                  // color: Colors.red,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: _story.map((story) {
                      return _itemOfStory(story);
                    }).toList(),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _post.length,
                    itemBuilder: (context, index) {
                      return itemOfPost(_post[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _itemOfStory(Story story) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: const Color(0xFF8e44ad),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                width: 70,
                height: 70,
                image: AssetImage(story.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          story.name,style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  Widget itemOfPost(Post post) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          //#header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        width: 40,
                        height: 40,
                        image: AssetImage(post.userImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      post.username,
                      style:TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Icon(
                  SimpleLineIcons.options,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          FadeInImage(
              width: MediaQuery.of(context).size.width,
              placeholder: AssetImage('assets/images/placeholder.png'),
              image: AssetImage(post.postImage)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesome.heart_o,
                        color: Colors.grey,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesome.comment_o,
                        color: Colors.grey,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesome.send_o,
                        color: Colors.grey,
                      )),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesome.bookmark_o,
                    color: Colors.grey,
                  ))
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(children: [
                TextSpan(
                  text: 'Liked By  ',
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: 'Mark, ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Lili, ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Jonny, ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ]),
            ),
          ),
          //#caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(children: [
                TextSpan(
                    text: post.username ,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: post.caption,
                    style: TextStyle(
                        color: Colors.grey,)),
              ]),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: Text(
              "February 2020",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
