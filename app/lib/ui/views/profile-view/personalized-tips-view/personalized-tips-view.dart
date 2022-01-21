import 'package:app/common/utils/url_link.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/profile_viewmodel/personalized-tips-viewmodel.dart/personalized-viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PersonalizedTipsDetailsView extends StatelessWidget {
  static const routeName = '/PersonalizedTipsDetailsView';
  const PersonalizedTipsDetailsView({Key? key, required this.id})
      : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    return BuildViewModel<PersonalizedTipViewModelDetails>(
        onModelReady: (model) => model.getDetailsTips(id),
        builder: (ctx, model, child) => Scaffold(
              appBar: AppBar(
                title: Text('${model.category.title}'),
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: id,
                      child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: Image.asset(
                            model.category.imageAsset,
                            // width: double.infinity,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Understand what is at stake',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Roboto-Medium',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(model.category.desc),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'Click here to Learn more',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              launchInBrowser(model.category.learn);
                            },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
