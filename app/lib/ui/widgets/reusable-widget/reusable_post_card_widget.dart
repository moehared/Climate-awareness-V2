import 'dart:io';

import 'package:app/domain/models/user_post_model.dart';
import 'package:flutter/material.dart';

class ReusablePostCard extends StatelessWidget {
  final UserPostModel post;
  final String id;
  final String uuid;

  const ReusablePostCard({
    required this.post,
    required this.id,
    required this.uuid,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Text(
                post.type,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),

            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.all(5)),
              onPressed: () {},
              child: Text(
                'edit',
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.w900,
                  fontFamily: 'Roboto-Regular',
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
            // )
          ],
        ),
        Container(
          height: media.height * 0.25,
          // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: const BorderRadius.all(
              Radius.circular(32),
            ),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32),
                ),
                child: post.imageUrl.isNotEmpty
                    ? Image.network(
                        post.imageUrl,
                        width: double.infinity,
                        height: media.height * 0.4,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(post.imagePath),
                        width: double.infinity,
                        height: media.height * 0.4,
                        fit: BoxFit.cover,
                      ),
              ),
              Positioned(
                bottom: 20,
                // right: 10,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Container(
                      color: Colors.black54,
                      width: media.width * 0.60,
                      margin: const EdgeInsets.only(left: 5.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Text(
                        'post.desc',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: TextButton(
                    child: Text(
                      'type here',
                      // post.type == ARTICLE ? 'read' : 'watch',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}