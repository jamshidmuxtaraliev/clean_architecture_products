import 'package:clan_arch_shop/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProdItemView extends StatelessWidget {
  final ProductModel item;

  const ProdItemView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(.2), spreadRadius: 1, blurRadius: 4, blurStyle: BlurStyle.outer),
      ]),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                // child: SizedBox(child: Image.asset("assets/images/${widget.item.image}")),
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.grey.shade200,
                    height: 80,
                    width: 80,
                    child: Image.network(item.images.first, fit: BoxFit.contain)),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(fontSize: 16, fontFamily: "p_semi"),
                    ),
                    Text(
                      item.description,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
