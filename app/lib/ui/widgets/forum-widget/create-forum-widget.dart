import 'package:app/domain/viewmodel/forum-viewmodel.dart/add-forum-viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:app/domain/viewmodel/forum-viewmodel.dart/forum-viewmodel.dart';
import 'package:app/common/styles/style.dart';
import 'package:app/ui/widgets/drop-down-widget/drop-down-forum-field-widget.dart';
import 'package:app/ui/widgets/button-widget/rounded-long-button.dart';

class CreateUserForum extends StatelessWidget {
  const CreateUserForum({
    required this.model,
    Key? key,
  }) : super(key: key);

  final AddForumViewModel model;

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
              "Title",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (_) {
                model.eventEmitted(true);
              },
              controller: model.titleContoller,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              decoration: userPostFormStyle.copyWith(hintText: "Enter a title"),
              validator: (title) {
                if (title!.isEmpty) {
                  return "Enter a title";
                }
                model.blacklistCheck(title);
                if (model.blackListValidator) {
                  return "Title contains illicit words";
                }
              },
              onSaved: (title) {
                model.setUserForumModel =
                    model.userForumModel.copyWith(title: title);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Description",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (_) {
                model.eventEmitted(true);
              },
              maxLines: null,
              controller: model.descriptionController,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              decoration:
                  userPostFormStyle.copyWith(hintText: "Enter a description"),
              validator: (description) {
                if (description!.isEmpty) {
                  return "Enter a description";
                }
                model.blacklistCheck(description);
                if (model.blackListValidator) {
                  return "Description contains illicit words";
                }
              },
              onSaved: (description) {
                model.setUserForumModel =
                    model.userForumModel.copyWith(description: description);
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
                // if (dropDownValue == "Climate Awareness") {
                //   dropDownValue = "Climate";
                // }
                model.setUserForumModel =
                    model.userForumModel.copyWith(topic: dropDownValue);
              },
              editMode: model.isEdit,
              errorMessage: 'Please select a category',
              hint: model.userForumModel.topic.isEmpty
                  ? 'Select Category'
                  : model.userForumModel.topic,
              items: model.topicList,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BuildRoundedLongButton(
                title: model.userForumModel.forumId.isEmpty
                    ? 'Create Forum Post '
                    : 'Update',
                onPress: model.userForumModel.forumId.isEmpty
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
