# Dart Study

## 1. Important concepts
* 모든 variable은 object이다. 모든 object는 class의 instance이다. numbers, functions, null 까지도. 즉, 모든 object는 Object class로부터 상속받는다.

* Dart의 type annotations는 optional이다. Dart가 types를 알아서 추론하기 때문.

* [null safety](https://dart.dev/null-safety) 를 사용할 수 있다. 사용방법은 type + question mark(?).  
예시 : ```int? // might be an integer, or it might be null```   
만약, 내가 expression이 null이 아닌걸 아는데, Dart가 disagree하는 경우 ```!``` 를 붙이면 강제로 null이 아님을 표시할 수 있다.

* 모든 type이 올 수 있음을 명시하고 싶을 때는 ```Object?``` 또는 ```Object``` 또는 [special type](https://dart.dev/guides/language/effective-dart/design#avoid-using-dynamic-unless-you-want-to-disable-static-checking) ```dynamic```를 쓰면 된다.

* generic types를 지원한다.  
예시: ```List<Object> // a list of integers``` 

* top-level functions 를 지원한다.

* JAVA와 달리, ```public, protected, private```를 사용하지 않는다. 대신에 underscore로 identifier를 시작하면 private하게 된다. 자세한건 [Libraries and visibility](https://dart.dev/guides/language/language-tour#libraries-and-visibility) 참조.

* Identifiers는 letter, underscore로 시작해야 하며, character와 digits의 combination이 가능하다.

* Dart에는 problems를 report하는 tool로 warnings 와 errors가 있다.  
Warnings : code가 일하지는 않지만, 프로그램 실행을 막지는 않아  
Errors : compile 또는 runtime에 발생하는데, compile-time error는 모든 code의 실행을 막는다. run-time error는 code 실행 중 exception을 발생시킨다.

## 2. Keywords
keywords가 궁금하다면 이 [문서](https://dart.dev/guides/language/language-tour#keywords)에서 찾아보자.

## 3. Variables
* ```var name = 'Bob';``` 이런 식으로 초기화한다. 이 경우, name variable은 String으로 infer하게 된다.

* single type으로 restricted되는게 아니라면, ```Object``` 또는 ```dynamic```을 써서 표현할 수 있다.

* 초기화되지 않은 variable(nullable type)은 자동으로 ```null```을 값으로 가지게 된다.

* ```late``` modifier가 Dart 2.12에 추가되었다. type 앞에 붙여서 사용한다. 다음과 같은 상황에서 사용된다.  
1) non-nullable variable을 선언하는데, 이 variable의 initialize를 delaration 후에 하는 경우
2) variable의 initialize를 늦게 할 경우 (변수가 필요하긴 한데 함수의 return값을 값으로 가지는 경우, 함수가 불러지기 전에는 굳이 variable을 선언해서 cost를 늘릴 필요가 없기 때문에 사용하는 것 같다)

* ```final``` variable은 한 번만 set이 가능하다

* ```const``` variable은 variable이 compile-time constants가 되기를 원할 때 사용한다.  
non-constant variable이 constant 값을 가질 경우, 값을 수정하는 것이 가능하다.  
constant variable은 값을 수정하는 것이 불가능하다.

## 4. Built-in Types
* [Numbers](https://dart.dev/guides/language/language-tour#numbers) (```int, double```)  
int : integer values no larger than 64bits  
double : 64-bit floating-point numbers  
int 와 double은 ```num```이라는 subtypes를 가지고 있다. 
* [Strings](https://dart.dev/guides/language/language-tour#strings) (```String```)
* [Booleans](https://dart.dev/guides/language/language-tour#booleans) (```bool```)
* [Lists](https://dart.dev/guides/language/language-tour#lists) (```List```, also known as _arrays_ )  
zero-based indexing 이다  
spread operator (...) 와 null-aware spread operator (...?) 가 있다. 자세한건 [문서](https://github.com/dart-lang/language/blob/master/accepted/2.3/spread-collections/feature-specification.md) 참조.  
__collection if__ 와 __collection for__ 를 지원한다.
* [Sets](https://dart.dev/guides/language/language-tour#sets) (```Set```)  
파이썬처럼 ```{}``` 를 사용한다
* [Maps](https://dart.dev/guides/language/language-tour#maps) (```Map```)  
파이썬의 dictionary와 비슷한 듯하다. key - value 형식.
* [Runes](https://dart.dev/guides/language/language-tour#characters) (```Runes```; often replaced by the ```characters``` API)  
얘를 사용하면 이모지 등 unicode를 나타낼 수 있다.
* [Symbols] (https://dart.dev/guides/language/language-tour#symbols) (```Symbol```)  
```#``` 을 붙여서 사용가능하다. ```#bar``` 이런 식. 
* null (```NULL```) 

## 5. Functions
* Dart는 객체 지향 언어이다. 함수도 객체이며, Function 이라는 type을 지닌다. 즉, 함수에 variable이 assign 되거나 다른 function의 arguments로 pass 될 수 있다.