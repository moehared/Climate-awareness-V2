import 'package:app/common/enums/view_state.dart';
import 'package:app/common/styles/textfield-form.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/quick-carbon-viewmodel/quick-carbon-viewmodel.dart';
import 'package:app/ui/widgets/button-widget/elevated-button.dart';
import 'package:app/ui/widgets/button-widget/text-button.dart';
import 'package:app/ui/widgets/form/text-field-widget.dart';
import 'package:app/ui/widgets/overlay-widget/prediction-places.dart';
import 'package:app/ui/widgets/slider-widget/slider_widget.dart';
import 'package:app/ui/widgets/text-widgets/text-and-row-widget.dart';
import 'package:flutter/material.dart';

class QuickCarbonView extends StatelessWidget {
  static const routeName = '/QuickCarbonView';
  const QuickCarbonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<QuickCarbonViewModel>(
      onModelReady: (model) => model.initState(context),
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
              TextFieldWidget(
                onChanged: (_) {},
                focusNode: model.textFocusNode,
                controller: model.textController,
                hintText: 'Enter a postal code in the city you live',
              ),
              // Visibility(
              //   visible: model.placeList.isNotEmpty,
              //   child: PredictionPlaceWidget(
              //     onSelected: (city) => model.onSelectedCity(city),
              //     predictionPlace: model.placeList,
              //   ),
              // ),
              FittedBox(
                child: TitleAndHelpButton(
                  label: '2. How many people live in your household?',
                  helpButton: model.showHousePeopleInfo,
                ),
              ),
              SliderWidget(
                value: model.houseHoldSize,
                onChange: (val) => model.onHouseHoldSizeValueChange(val),
                step: 5,
                max: 5,
                label: model.getHouseHoldSizeLabel(model.houseHoldSize.toInt()),
              ),
              FittedBox(
                child: TitleAndHelpButton(
                  label: '3. What is your gross annual household income?',
                  helpButton: model.showHouseHoldIncomeInfo,
                ),
              ),
              SliderWidget(
                value: model.houseHoldIncome,
                onChange: (val) => model.onHouseHoldIncomeValueChange(val),
                step: 10,
                max: 10,
                label: model
                    .getHouseHoldIncomeLabel(model.houseHoldIncome.toInt()),
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               ElevatedButtonWidget(
                label: 'Calculate Carbon',
                onPress: model.quickCarbonEstimate,
                isBusy: model.viewState == ViewState.BUSY,
              ),
              TextButtonWidget(
                onPress: model.refineEstimate,
                label: 'Refine Your Estimate',
                includeBorder: true,
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
