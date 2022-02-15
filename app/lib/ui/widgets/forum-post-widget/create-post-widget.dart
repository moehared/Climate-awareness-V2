import 'dart:io';
import 'package:app/common/styles/style.dart';
import 'package:app/domain/viewmodel/add-posts-viewmodel/add-post-view-model.dart';
import 'package:app/ui/widgets/button-widget/rounded-long-button.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/widgets/drop-down-widget/drop-down-widget.dart';

import 'package:app/ui/widgets/reusable-widget/build_button.dart';
import 'package:flutter/services.dart';
import 'package:app/ui/widgets/drop-down-widget/drop-down-forum-field-widget.dart';

class CreateUserPost extends StatelessWidget {
  const CreateUserPost({
    required this.model,
    Key? key,
  }) : super(key: key);

  final AddPostViewModel model;

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
              onChanged: (_) {
                model.eventEmitted(true);
              },
              controller: model.urlController,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              decoration: userPostFormStyle.copyWith(
                  hintText: "Enter a article URL or Video URL"),
              validator: (url) {
                if (url!.isEmpty) {
                  return "Enter a URL";
                }
                model.blacklistCheck(url);
                if (model.blackListValid) {
                  return "URL contains illicit words";
                }
                model.checkArticleURL(url);
                print("valid DO I Fail here" + model.articleValid.toString());
                if (!model.articleValid) {
                  return "URL is not valid";
                }
              },
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
            FormFieldDropDownWidget(
              onChanged: (dropDownValue) {

                model.eventEmitted(true);
                model.setUserPostObj =
                    model.userPostsModel.copyWith(category: dropDownValue);
                print("do I fail at selecting? 81 ");
              },
              editMode: model.isEdit,
              errorMessage: 'Please select a category',
              hint: model.userPostsModel.category.isEmpty
                  ? 'Select Category'
                  : model.userPostsModel.category,
              items: model.categoryList,
            ),
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
              controller: model.descriptionContoller,
              style: TextStyle(color: Colors.white),
              decoration:
                  userPostFormStyle.copyWith(hintText: "Enter a Description"),
              maxLines: null,
              onChanged: (_) {
                model.eventEmitted(true);
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              validator: (description) {
                if (description!.isEmpty) {
                  return "Add a Description";
                }
                model.blacklistCheck(description);
                if (model.blackListValid == true) {
                  return "Description contains illicit words";
                }
                return null;
              },
              onSaved: (description) {
                
                model.setUserPostObj =
                    model.userPostsModel.copyWith(description: description);
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
                          image: FileImage(model.image as File)),
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
                    child: model.imageController.text.isEmpty &&
                            model.imageValid == false &&
                            model.imageUpload == false
                        ? Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Enter URL or upload image from your phone',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        : Image.network(
                            model.imageController.text,
                            fit: BoxFit.cover,
                          ),
                  ),

                Expanded(
                  child: TextFormField(
                    onChanged: (_) {
                      model.eventEmitted(true);
                    },
                    focusNode: model.imageURLFocusNode,
                    controller: model.imageController,
                    style: TextStyle(color: Colors.white),
                    decoration: userPostFormStyle.copyWith(
                        hintText: "Enter a Image URL"),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).unfocus();
                    },
                    onEditingComplete: model.onEditComplete,
                    validator: (url) {
                      if (url!.isEmpty) {
                        return "Enter a Image URL";
                      }
                      model.blacklistCheck(url);
                      if (model.blackListValid) {
                        return "Image URL contains illicit words";
                      }
                      model.checkImageURL(url);
                      print("valid OR over 196 " + model.imageValid.toString());
                      if (!model.imageValid) {
                        return "Image URL is not valid";
                      }
                    },
                    onSaved: (imageURL) {
                      model.setUserPostObj =
                          model.userPostsModel.copyWith(imageUrl: imageURL);
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
              child: BuildRoundedLongButton(
                title: model.userPostsModel.postId.isEmpty
                    ? 'Create Post'
                    : 'Update',
                onPress: model.userPostsModel.postId.isEmpty
                    ? model.submit
                    : !model.isEdit
                        ? null
                        : model.updatePost,

                /* isBusy: widget.model.viewState == ViewState.BUSY,*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}
