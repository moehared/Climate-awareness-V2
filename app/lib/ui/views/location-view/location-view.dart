import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/location_viewmodel/location_viewmodel.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:flutter/material.dart';

class LocationView extends StatelessWidget {
  static const routeName = '/LocationView';
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<LocationViewModel>(
      builder: (ctx, model, ch) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const Text('Location View'),
        ),
        body: BackgroundImage(
          backgroundImage: 'images/space2.png',
          child: SafeArea(
            child: ch!,
          ),
        ),
      ),
      child: Center(
        child: Text('Location View'),
      ),
    );
  }
}
