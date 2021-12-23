import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/goods-viewmodel/goods-services-viewmodel.dart';
import 'package:app/ui/widgets/button-widget/rounded-long-button.dart';
import 'package:app/ui/widgets/button-widget/simple_or_advance_button.dart';
import 'package:app/ui/widgets/drop-down-widget/drop-down-widget.dart';
import 'package:app/ui/widgets/reusable-widget/row_with_textfield_and_child.dart';
import 'package:app/ui/widgets/slider-widget/slider_widget.dart';
import 'package:app/ui/widgets/spacing_widget/verticle_space.dart';
import 'package:app/ui/widgets/text-widgets/label_title_widget.dart';
import 'package:app/ui/widgets/text-widgets/text-and-row-widget.dart';
import 'package:flutter/material.dart';

class GoodsServicesView extends StatelessWidget {
  const GoodsServicesView({
    Key? key,
    required this.next,
    required this.prev,
  }) : super(key: key);
  final Function() next;
  final Function() prev;

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<GoodsServicesViewModel>(
      builder: (ctx, model, child) => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: LabelTitleWidget(
                  title: 'HOW MUCH DO YOU SPEND ON EACH OF THE FOLLOWING?'),
            ),
            const BuildSpacing(),
            BuildSimpleOrAdvanceWidget(
              onAdvanceClick: model.onAdvanceClick,
              onSimpleClick: model.onSimpleClick,
              isSimple: model.isSimple,
            ),
            const BuildSpacing(),
            BuildTitleAndHelpButton(
              label: 'Goods',
              rightIconButton: model.showGoodsAndServiceHelpInfo,
            ),
            const BuildSpacing(),
            if (model.isSimple)
              BuildSliderWidget(
                value: model.goodsValue,
                onChange: (val) => model.onGoodsChange(val),
                max: 3920,
                step: 3920,
                label: '\$${model.goodsValue.toStringAsFixed(0)} / Month',
              ),
            if (!model.isSimple)
              ...List.generate(
                model.goodsList.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelTitleWidget(
                      title: model.goodsList[index].title,
                    ),
                    RowWithTextFieldAndChild(
                      controller: model.goodsList[index].textEditingController,
                      onChanged: (_) {},
                      focusNode: model.goodsList[index].focusNode,
                      child: DropDownMenuWidget(
                        hideDropdownIcon: true,
                        items: ['Month'],
                        hintText: model.goodsList[index].dropdownValue,
                        color: Colors.black,
                      ),
                      hintText: model.goodsList[index].hintText,
                    ),
                  ],
                ),
              ),
            const BuildSpacing(space: 15),
            BuildTitleAndHelpButton(
              label: 'Services',
              rightIconButton: model.showGoodsAndServiceHelpInfo,
            ),
            const BuildSpacing(),
            if (model.isSimple)
              BuildSliderWidget(
                value: model.servicesValue,
                onChange: (val) => model.onServiceChange(val),
                max: 7215,
                step: 7215,
                label: '\$${model.servicesValue.toStringAsFixed(0)} / Month',
              ),
            if (!model.isSimple)
              ...List.generate(
                model.servicesList.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelTitleWidget(
                      title: model.servicesList[index].title,
                    ),
                    RowWithTextFieldAndChild(
                      controller:
                          model.servicesList[index].textEditingController,
                      onChanged: (_) {},
                      focusNode: model.servicesList[index].focusNode,
                      child: DropDownMenuWidget(
                        items: ['Month'],
                        hideDropdownIcon: true,
                        hintText: model.servicesList[index].dropdownValue,
                        color: Colors.black,
                      ),
                      hintText: model.servicesList[index].hintText,
                    ),
                  ],
                ),
              ),
            const BuildSpacing(space: 15),
            BuildRichText(
              label:
                  'Greenhouse gas emission factors from the Comprehensive Environmental Data Archive for Economic and Environmental Systems Analysis ',
              linkLabel: '(CEDA 3.0 Climate).',
              onTap: model.onTextLink,
            ),
            BuildSpacing(space: 30),
            BuildRoundedLongButton(
              title: 'Continue',
              onPress: model.onContinue,
            ),
          ],
        ),
      ),
    );
  }
}
