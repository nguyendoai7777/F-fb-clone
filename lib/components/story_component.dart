import 'package:_new/constants/Color.dart';
import 'package:_new/models/Story.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final Story story;
  final int id;
  final int length;
  const StoryCard({Key key, @required this.story, this.id, this.length})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 110,
          height: 200,
          margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: id == 0 ? 10.5 : 3.5,
              right: id == length - 1 ? 10.5 : 3.5),
          /* left: 3.5,
              right: 3.5), */
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(story.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: id == 0 ? 15 : 8,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(width: 2, color: FACEBOOKBLUE),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image(
                image: NetworkImage(story.avatarUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          child: Text(
            story.textContent,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        )
      ],
    );
  }
}

/* 
Stack buildStory(
      int index, String avatarUrl, String imageUrl, String textContent) {
  
  } */
