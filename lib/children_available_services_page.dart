import 'package:flutter/material.dart';
import 'colors.dart' as color;

class ChildrenAvailableServicesPage extends StatefulWidget {
  const ChildrenAvailableServicesPage({super.key});

  @override
  State<ChildrenAvailableServicesPage> createState() => _ChildrenAvailableServicesPageState();
}

class _ChildrenAvailableServicesPageState extends State<ChildrenAvailableServicesPage> {
  // Children's grooming services
  final List<Map<String, dynamic>> childrenServices = [
    {
      'name': 'Kids Basic Haircut',
      'description': 'Simple and quick haircut for children',
      'duration': '20 min',
      'price': '₹15',
      'icon': Icons.child_care,
      'category': 'Hair'
    },
    {
      'name': 'Toddler First Haircut',
      'description': 'Gentle first haircut experience with certificate',
      'duration': '25 min',
      'price': '₹20',
      'icon': Icons.baby_changing_station,
      'category': 'Hair'
    },
    {
      'name': 'Kids Styling Cut',
      'description': 'Trendy haircut with styling for kids',
      'duration': '30 min',
      'price': '₹25',
      'icon': Icons.face_retouching_natural,
      'category': 'Hair'
    },
    {
      'name': 'Boy\'s Crew Cut',
      'description': 'Classic short cut, easy to maintain',
      'duration': '20 min',
      'price': '₹18',
      'icon': Icons.content_cut,
      'category': 'Hair'
    },
    {
      'name': 'Girl\'s Trim',
      'description': 'Hair trim with optional fringe cut',
      'duration': '25 min',
      'price': '₹20',
      'icon': Icons.cut,
      'category': 'Hair'
    },
    {
      'name': 'Kids Hair Wash',
      'description': 'Gentle shampoo and conditioning',
      'duration': '15 min',
      'price': '₹12',
      'icon': Icons.water_drop,
      'category': 'Care'
    },
    {
      'name': 'Buzz Cut',
      'description': 'Quick and easy clipper cut',
      'duration': '15 min',
      'price': '₹15',
      'icon': Icons.straighten,
      'category': 'Hair'
    },
    {
      'name': 'Kids Hair Design',
      'description': 'Creative hair designs and patterns',
      'duration': '35 min',
      'price': '₹30',
      'icon': Icons.draw,
      'category': 'Styling'
    },
    {
      'name': 'Hair Coloring (Temporary)',
      'description': 'Safe, washable hair color for kids',
      'duration': '30 min',
      'price': '₹35',
      'icon': Icons.color_lens,
      'category': 'Styling'
    },
    {
      'name': 'Spa Package for Kids',
      'description': 'Hair wash, cut, and gentle scalp massage',
      'duration': '40 min',
      'price': '₹40',
      'icon': Icons.spa,
      'category': 'Package'
    },
    {
      'name': 'Birthday Special',
      'description': 'Haircut with fun styling and temporary highlights',
      'duration': '45 min',
      'price': '₹45',
      'icon': Icons.cake,
      'category': 'Package'
    },
    {
      'name': 'Quick Trim',
      'description': 'Fast touch-up for bangs or sides',
      'duration': '10 min',
      'price': '₹10',
      'icon': Icons.speed,
      'category': 'Hair'
    }
  ];

  String selectedCategory = 'All';
  final List<String> categories = ['All', 'Hair', 'Care', 'Styling', 'Package'];

  List<Map<String, dynamic>> get filteredServices {
    if (selectedCategory == 'All') {
      return childrenServices;
    }
    return childrenServices.where((service) => service['category'] == selectedCategory).toList();
  }

  Color getCategoryColor(String category) {
    switch (category) {
      case 'Hair': return Colors.blue.shade400;
      case 'Care': return Colors.green.shade400;
      case 'Styling': return Colors.purple.shade400;
      case 'Package': return Colors.orange.shade400;
      default: return color.AppColor.gradientFirst;
    }
  }

  void _showServiceDetails(Map<String, dynamic> service) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: getCategoryColor(service['category']).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    service['icon'],
                    color: getCategoryColor(service['category']),
                    size: 30,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service['name'],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: color.AppColor.homePageTitle,
                        ),
                      ),
                      Text(
                        service['category'],
                        style: TextStyle(
                          fontSize: 14,
                          color: getCategoryColor(service['category']),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              service['description'],
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: color.AppColor.gradientFirst.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.access_time, size: 16, color: color.AppColor.gradientFirst),
                      SizedBox(width: 5),
                      Text(
                        service['duration'],
                        style: TextStyle(
                          color: color.AppColor.gradientFirst,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  service['price'],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: color.AppColor.gradientSecond,
                  ),
                ),
                Expanded(child: Container()),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // TODO: Navigate to booking page
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Booking ${service['name']}...'), backgroundColor: Colors.green,),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color.AppColor.gradientSecond,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: Text('Book Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: color.AppColor.homePageIcons,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Children Services",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: color.AppColor.homePageTitle,
                          ),
                        ),
                        Text(
                          "${childrenServices.length} services available",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),

                      ],
                    )

                  ),
                ],
              ),
              SizedBox(height: 30),

              // Category Filter
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    String category = categories[index];
                    bool isSelected = selectedCategory == category;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? color.AppColor.gradientSecond
                              : Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: color.AppColor.gradientSecond,
                            width: 0.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: isSelected
                                  ? color.AppColor.gradientSecond.withOpacity(0.3)
                                  : Colors.grey.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            category,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : color.AppColor.homePageTitle,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 25),

              // Services List
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredServices.length,
                itemBuilder: (context, index) {
                  final service = filteredServices[index];
                  return GestureDetector(
                    onTap: () => _showServiceDetails(service),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: color.AppColor.gradientSecond.withOpacity(0.1),
                            blurRadius: 15,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: getCategoryColor(service['category']).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              service['icon'],
                              color: getCategoryColor(service['category']),
                              size: 28,
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        service['name'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: color.AppColor.homePageTitle,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: getCategoryColor(service['category']).withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        service['category'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: getCategoryColor(service['category']),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  service['description'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 16,
                                          color: color.AppColor.gradientFirst,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          service['duration'],
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: color.AppColor.gradientFirst,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Text(
                                      service['price'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: color.AppColor.gradientSecond,
                                      ),
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
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}