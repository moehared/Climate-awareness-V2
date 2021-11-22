import 'package:app/common/styles/textfield-form.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/quick-carbon-viewmodel/quick-carbon-viewmodel.dart';
import 'package:app/ui/widgets/slider-widget/slider_widget.dart';
import 'package:flutter/material.dart';

class QuickCarbonView extends StatelessWidget {
  static const routeName = '/QuickCarbonView';
  const QuickCarbonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<QuickCarbonViewModel>(
      onModelReady: (model) => model.initState(),
      builder: (ctx, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Quick carbon estimate'),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'START WITH A QUICK CARBON FOOTPRINT ESTIMATE',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '1. Where do you live?',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: model.textController,
                  focusNode: model.textFocusNode,
                  textAlign: TextAlign.center,
                  decoration: kTextFieldform.copyWith(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    hintText: 'Enter your city or zip code',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              RowAndTitleWidget(
                label: '2. How many people live in your household?',
                helpButton: () {},
              ),
              SliderWidget(
                value: 0,
                onChange: (_) {},
                step: 5,
                max: 5,
                label: '',
              ),
              RowAndTitleWidget(
                label: '3. What is your gross annual household income?',
                helpButton: () {},
              ),
              SliderWidget(
                value: 0,
                onChange: (_) {},
                step: 5,
                max: 5,
                label: '',
              ),
            ],
          ),
        ),
        floatingActionButton: Visibility(
          visible: model.textFocusNode.hasFocus == false,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.padded,
                    primary: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {},
                  child: Text('Calculate Carbon'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.padded,
                    primary: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: model.refineEstimate,
                  child: Text('Refine Your Estimate'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RowAndTitleWidget extends StatelessWidget {
  const RowAndTitleWidget({
    required this.label,
    required this.helpButton,
    Key? key,
  }) : super(key: key);
  final String label;
  final Function() helpButton;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        IconButton(onPressed: helpButton, icon: Icon(Icons.help))
      ],
    );
  }
}
