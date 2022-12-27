import 'package:flutter/material.dart';
import '../spash/constants.dart';
import '../spash/size_config.dart';
import '../../model/detailProduct_Model.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Images> data;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.data[0].IDProduct.toString(),
              child: Image.network(widget.data[selectedImage].URlImage.toString()),
            ),
          ),
        ),SizedBox(height: 10,),
        // SizedBox(height: getProportionateScreenWidth(20)),
        Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.data.length,
                    (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(10),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.network(widget.data[index].URlImage.toString()),
      ),
    );
  }
}