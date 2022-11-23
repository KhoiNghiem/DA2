/**
8. 	I have an array like this: var arr1 = [{ make: 'audi', model: 'r8', year: '2012' }, { make: 'audi', model: 'rs5', year: '2013' }, { make: 'ford', model: 'mustang', year: '2012' }, { make: 'ford', model: 'fusion', year: '2015' }, { make: 'kia', model: 'optima', year: '2012' }]
	Please write a function that has 2 input parameters, 1st param is an array like the above array, and the 2nd param is the name of any property in each object of the array.
	Example: myFunc('make', arr1);
	That will return a new object like this (each property is an array, and this array includes objects corresponding to that property):
	{
		"audi": [
			{
			"make": "audi",
			"model": "r8",
			"year": "2012"
			},
			{
			  "make": "audi",
			  "model": "rs5",
			  "year": "2013"
			}
		],
		"ford": [
			{
			  "make": "ford",
			  "model": "mustang",
			  "year": "2012"
			},
			{
			  "make": "ford",
			  "model": "fusion",
			  "year": "2015"
			}
		],
		"kia": [
			{
			  "make": "kia",
			  "model": "optima",
			  "year": "2012"
			}
		]
	}
*/

void main() {
  var arr1 = [
    {"make": 'audi', "model": 'r8', "year": '2012'},
    {"make": 'audi', "model": 'rs5', "year": '2013'},
    {"make": 'ford', "model": 'mustang', "year": '2012'},
    {"make": 'ford', "model": 'fusion', "year": '2015'},
    {"make": 'kia', "model": 'optima', "year": '2012'},
  ];

  Map<String, dynamic> myFunc(String keyword, List<Map> arr1) {
    if (!arr1[0].containsKey(keyword)) return {};
    Map<String, dynamic> mapReturn = arr1.fold(
      <String, List<dynamic>>{},
      (acc, element) {
        String key = element[keyword];

        if (isMapContainKeyElement(key, acc)) {
          acc[key]!.add(element);
        } else {
          acc[key] = [element];
        }
        ;
        return acc;
      },
    );
    return mapReturn;
  }

  print(myFunc('year', arr1));
  print(myFunc('make', arr1));
}

bool isMapContainKeyElement(String key, Map map) {
  if (map.isNotEmpty) {
    if (map.containsKey(key)) return true;
  }
  return false;
}
