import 'dart:io';
import 'package:app/common/styles/textfield-form.dart';
import 'package:app/ui/widgets/button-widget/login-sign-button.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/widgets/forum-post-widget/drop-down-widget.dart';
import 'package:app/domain/viewmodel/forum-posts-viewmodel/forum_posts_viewmodel.dart';
import 'package:app/common/utils/input_validator.dart';
import 'package:app/ui/widgets/reusable-widget/build_button.dart';
import 'package:flutter/services.dart';


class CreateForumPost extends StatelessWidget {
  const CreateForumPost({
    required this.model,
    Key? key,
  }) : super(key: key);

  final ForumPostViewModel model;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Form(
        key: model.formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "URL",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              decoration: userPostFormStyle.copyWith(hintText: "Enter a article URL"),
              maxLines: null,
              onFieldSubmitted: (_) {},
              //validator: (url) {
              //   if (url!.isEmpty) {
               //    return "Add a article url";
               //  } else if (!url.isValidUrl()) {
               //  return "Enter a Valid URL in the form of https://wwww.Example.com";
               // }
             // },
              onSaved: (postUrl) {
                model.setUserPostObj =
                    model.userPostsModel.copyWith(url: postUrl);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Select a Catergory",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            DropDownMenuWidget(onChanged: (dropDownValue) {
              debugPrint("Drop down value" + dropDownValue);
              model.setUserPostObj =
                  model.userPostsModel.copyWith(category: dropDownValue);
            }),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Description",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration:
                  userPostFormStyle.copyWith(hintText: "Enter a Description"),
              maxLines: null,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              onFieldSubmitted: (_) {},
              validator: (description) {
                if (description!.isEmpty) {
                  return "Add a Description";
                }
                return null;
              },
              onSaved: (description) {
                model.setUserPostObj = model.userPostsModel
                    .copyWith(description: description);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // _image != null && _imageUrlController.text.isEmpty
               if (model.isUserUpload)
          
                      Container(
                        width: 100.0,
                        height: 100.0,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(model.image as File) 
                              
                           ),
                        ),
                      ),
               
                    // _image == null && _imageUrlController.text.isNotEmpty
                    if (model.isUserUpload == false)
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: 8, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: model.imageController.text.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.all( 10.0),
                                child: Text(
                                    'Enter URL or upload image from your phone',style: Theme.of(context).textTheme.bodyText1,),
                              )
                            : Image.network(
                                model.imageController.text,
                                fit: BoxFit.cover,
                              ),
                      ),

                Expanded(
                  child: TextFormField(
                    controller: model.imageController,
                    style: TextStyle(color: Colors.white),
                    decoration: userPostFormStyle.copyWith(
                    hintText: "Enter a Image URL"),
                    maxLines: null,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    onFieldSubmitted: (_) {},
                      //  validator: (url) {
                      //   if (url!.isEmpty) {
                      //     return "Add a article url";
                      //   } else if (!url.isValidUrl()) {
                      //   return "Enter a Valid URL in the form of https://wwww.Example.com";
                      //   }
                      // },
                    onSaved: (imageURL) {
                      model.setUserPostObj = model.userPostsModel
                          .copyWith(imageUrl: imageURL);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),

            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: BuildButton(
                  title: "Upload From Gallery",
                  icon: Icons.image_outlined,
                  onClicked: () => model.pickImage()),
            ),
            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LoginOrSignUpButton(title: 'Create Post', onPress: model.submit,/* isBusy: widget.model.viewState == ViewState.BUSY,*/)
            ),

        
          ],
        ),
      ),
    );
  }
}
