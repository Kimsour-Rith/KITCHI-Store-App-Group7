import 'package:flutter/material.dart';
import 'package:multi_store_app/utilities/categ_list.dart';
import '../../widgets/categ_widgets.dart';

class BagCategory extends StatelessWidget {
  const BagCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(children: [
        Positioned(
          bottom: 0,
          left: 0,
          top: 0,
          child: SizedBox(
            height: size.height * 0.85,
            width: size.width * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategHeaderLabel(headerLabel: 'Bag'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: GridView.count(
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 15,
                      crossAxisCount: 3,
                      children: List.generate(bags.length - 1, (index) {
                        return SubCategModel(
                          assetName: 'images/bags/bags$index.jpg',
                          mainCategName: 'bags',
                          subCategName: bags[index + 1],
                          subcategLabel: bags[index + 1],
                        );
                      })),
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: SliderBar(size: size, maincategName: 'bags'))
      ]),
    );
  }
}
