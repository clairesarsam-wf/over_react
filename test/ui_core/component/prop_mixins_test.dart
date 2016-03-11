library prop_mixins_test;

import 'dart:collection' show MapView;

import 'package:test/test.dart';
import 'package:web_skin_dart/ui_core.dart';

import '../../wsd_test_util/prop_utils.dart';

main() {
  group('ReactProps', () {
    testKeys(const $PropKeys(ReactPropsMixin), (() => new ReactPropMixinsTest({})));

    group('prop: key can have its value set to', () {
      test('an int and be read as a String', () {
        var reactPropsMap = new ReactPropMixinsTest({})
          ..key = 1;

        expect(reactPropsMap.key, equals('1'));
      });

      test('a String and be read as a String', () {
        var reactPropsMap = new ReactPropMixinsTest({})
          ..key = '1';

        expect(reactPropsMap.key, equals('1'));
      });

      test('null and be read as a null', () {
        var reactPropsMap = new ReactPropMixinsTest({})
          ..key = null;

        expect(reactPropsMap.key, isNull);
      });
    });
  });

  group('CssClassProps', () {
    testKeys(const $PropKeys(CssClassPropsMixin), (() => new CssClassPropMixinsTest({})));
  });

  group('DomPropsMixin', () {
    testKeys(const $PropKeys(DomPropsMixin), (() => new DomPropMixinsTest({})));
  });

  group('SvgPropsMixin', () {
    testKeys(const $PropKeys(SvgPropsMixin), (() => new SvgPropMixinsTest({})));
  });

  group('UbiquitousProps', () {
    testKeys(const $PropKeys(UbiquitousDomPropsMixin), (() => new UbiquitousPropMixinsTest({})));
  });

  group('AriaProps', () {
      test('cannot set / read values that are not its prop map', () {
        var instance = new AriaPropMixinsTest({});
        expect(() {instance['notThere'];}, throws);
      });

      for (var propKey in const $PropKeys(AriaPropsMixin)) {
        test('prop: $propKey can have its value set / read', () {
          var instance = new AriaPropMixinsTest({});
          testProp(new Symbol(propKey.replaceFirst('aria-', '')), propKey, instance, null);
        });
      }
  });
}

class DomPropMixinsTest extends MapView with DomPropsMixin {
  /// Create a new instance backed by the specified map.
  DomPropMixinsTest(Map map) : super(map);

  /// The props to be manipulated via the getters/setters.
  /// In this case, it's the current MapView object.
  @override
  Map get props => this;

  @override
  operator [](key) {
    if (!this.containsKey(key)) {
      throw 'Map does not contain this key: $key';
    }
    return super[key];
  }
}

class SvgPropMixinsTest extends MapView with SvgPropsMixin {
  /// Create a new instance backed by the specified map.
  SvgPropMixinsTest(Map map) : super(map);

  /// The props to be manipulated via the getters/setters.
  /// In this case, it's the current MapView object.
  @override
  Map get props => this;

  @override
  operator [](key) {
    if (!this.containsKey(key)) {
      throw 'Map does not contain this key: $key';
    }
    return super[key];
  }
}

class ReactPropMixinsTest extends MapView with ReactPropsMixin {
  /// Create a new instance backed by the specified map.
  ReactPropMixinsTest(Map map) : super(map);

  /// The props to be manipulated via the getters/setters.
  /// In this case, it's the current MapView object.
  @override
  Map get props => this;

  @override
  operator [](key) {
    if (!this.containsKey(key)) {
      throw 'Map does not contain this key: $key';
    }
    return super[key];
  }
}

class CssClassPropMixinsTest extends MapView with CssClassPropsMixin {
  /// Create a new instance backed by the specified map.
  CssClassPropMixinsTest(Map map) : super(map);

  /// The props to be manipulated via the getters/setters.
  /// In this case, it's the current MapView object.
  @override
  Map get props => this;

  @override
  operator [](key) {
    if (!this.containsKey(key)) {
      throw 'Map does not contain this key: $key';
    }
    return super[key];
  }
}

class UbiquitousPropMixinsTest extends MapView with UbiquitousDomPropsMixin {
  UbiquitousPropMixinsTest(Map map) : super (map);

  /// The props to be manipulated via the getters/setters.
  /// In this case, it's the current MapView object.
  @override
  Map get props => this;

  @override
  operator [](key) {
    if (!this.containsKey(key)) {
      throw 'Map does not contain this key: $key';
    }
    return super[key];
  }
}

class AriaPropMixinsTest extends MapView with AriaPropsMixin {
  AriaPropMixinsTest(Map map) : super (map);

  /// The props to be manipulated via the getters/setters.
  /// In this case, it's the current MapView object.
  @override
  Map get props => this;

  @override
  operator [](key) {
    if (!this.containsKey(key)) {
      throw 'Map does not contain this key: $key';
    }
    return super[key];
  }
}
