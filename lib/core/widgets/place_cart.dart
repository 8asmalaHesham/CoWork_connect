import 'package:co_work_connect/features/data/models/place_model.dart';
import 'package:co_work_connect/features/screens/cowork_screen.dart';
import 'package:flutter/material.dart';

class PlaceCart extends StatelessWidget {
  const PlaceCart({super.key, this.placeModel});
  final PlaceModel? placeModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CoWorkScreen(placeModel: placeModel!,);
            },
          ),
        );
      },
    child: Container(
  width: 200,
  margin: const EdgeInsets.symmetric(horizontal: 10),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 5,
        offset: Offset(0, 2),
      ),
    ],
  ),
  clipBehavior: Clip.antiAlias,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.network(placeModel!.imageUrl, fit: BoxFit.cover),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          placeModel!.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          placeModel!.address,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 11, color: Colors.grey),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${placeModel!.price}',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 14),
                Text(
                  '${placeModel!.rating}',
                  style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
