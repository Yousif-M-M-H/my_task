import 'package:flutter/material.dart';

class CourierReq {
  final String name;
  final int stars;
  final double rides;
  final double pickup;
  final double price;

  const CourierReq({
    required this.name,
    required this.stars,
    required this.rides,
    required this.pickup,
    required this.price,
  });
}

final List<CourierReq> requests = [
  CourierReq(
    name: 'Yosif Mohamedain',
    stars: 3,
    rides: 12,
    pickup: 10,
    price: 12,
  ),
  CourierReq(
    name: 'Hatim Mustafa',
    stars: 3,
    rides: 12,
    pickup: 10,
    price: 12,
  ),
  CourierReq(
    name: 'Ibrahim Ali',
    stars: 3,
    rides: 12,
    pickup: 10,
    price: 12,
  ),
];

class CourierBids2 extends StatelessWidget {
  const CourierBids2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Courier Bids",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: requests.length,
          itemBuilder: (context, index) {
            final request = requests[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(color: Colors.green),
                      ],
                    ),
                    child: ExpansionTile(
                      // backgroundColor: Colors.red,
                      textColor: Theme.of(context).textTheme.bodyText2!.color,
                      collapsedIconColor: Colors.white,
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/person.jpg'),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            request.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.star_outlined,
                                  color: Colors.amber, size: 20),
                              SizedBox(width: 4),
                              Text(
                                "Ratings ",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${request.stars}'.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 16),
                              Icon(Icons.car_repair_outlined,
                                  color: Colors.white),
                              Text(
                                " Rides: ",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${request.rides.round().toString()}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.calendar_today, size: 20),
                                    SizedBox(width: 8),
                                    Text("Pick-up Date: ",
                                        style: TextStyle(fontSize: 16)),
                                    Text(request.pickup.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  children: [
                                    Icon(Icons.access_time, size: 20),
                                    SizedBox(width: 8),
                                    Text("Pick-up time: ",
                                        style: TextStyle(fontSize: 16)),
                                    Text(request.pickup.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  children: [
                                    Icon(Icons.attach_money, size: 20),
                                    SizedBox(width: 8),
                                    Text("Price: ",
                                        style: TextStyle(fontSize: 16)),
                                    Text('${request.price}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Accept",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Decline",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
