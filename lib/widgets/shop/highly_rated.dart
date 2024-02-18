import 'package:flutter/material.dart';
import 'package:soko_beauty/widgets/common/star_rating.dart';

class HighlyRated extends StatelessWidget {
  const HighlyRated({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 250,        
      margin: EdgeInsets.symmetric(horizontal: 8),

      decoration: BoxDecoration(
        
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        color: Theme.of(context).cardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
             Container(
             margin: EdgeInsets.only(top:15),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/250?random=1'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text('Shop Name', style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(
              width: 150,
              child: Text('Dealing with manicure and pedicure', 
              textAlign: TextAlign.center,
              style: TextStyle(
                overflow: TextOverflow.clip,
                
              ),),
            ),
            StarRating(rating: 4.5, starCount: 5, color: Colors.amber,),
            
            GestureDetector(
              child: Container(
                color: Colors.green,
                height: 50,
                width: 250,
                child: Center(child: Text('Visit Shop'))
                
                ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}