import 'parent.dart';
import 'child.dart';

//To represent a relationship between objects
class Association {
  //Parent instance of the association
  final Parent parent;
  //Child instance of the association
  final Child child;
  //Primary keys
  List _parentKeys;
  //Child instances
  List<Map<String, dynamic>> _childInstances;

  //The instance of the association used
  Association({
    this.child,
    this.parent,
  });

  Future<void> initialize() async {
    //Load primary keys
    await parent.loadPrimaryKeys();
    _parentKeys = parent.primaryKeys;

    //Load child data as Map<String,dynamic>
    await child.loadChildData();
    _childInstances =
        child.childInstances.map((instance) => instance.toJSON()).toList();
  }

  //Process the data
  void process() {
    //Child foreign key
    var foreignKey = child.foreignKey;

    //Loop through all instances retrieving the child with associated parents
    _parentKeys.forEach((parentKey) {
      List _vals = _childInstances
          .where((instance) => instance[foreignKey][0] == parentKey)
          .toList();
      print('ParentKey: $parentKey');
      print('Children: ');
      _vals?.forEach(print);
    });
  }
}
