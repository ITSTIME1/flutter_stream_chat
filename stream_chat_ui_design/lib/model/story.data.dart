import 'package:flutter/material.dart';

///[Immutable]
/// => Immutable 이라는건 해석했을때 '변하지 않는' 이라는 뜻을 가지고 있고
/// 실제로 우리가 램에 값을 할당할때 name = '이름' 이라는 값을 저장시켜 개발자가 name이라는 라벨링을 설정하고
/// 실제로 그 라벨링은 램에서 주소 값으로 생각할 수 있다.
/// 만약 immutable란 그럼 변경이 가능한 이유는 뭘까
/// 변경이 가능하다는 것은 실제로 램의 주소가 달라진 다는걸 의미한다.
/// 즉 2000번 째의 이름 거기서 변경한 값은 20001번째에 저장을 해둔다는 의미이다.
/// 즉 name의 주소 값이 바뀌는 것이지 저장되었던 데이터는 변하지 않습니다.
///[Mutable]
/// => Mutable 하다는 것은 대표적으로 List를 예로 들 수 있는데
/// 리스트 안에 값에 c [123,] 이 들어 있다고 할때 c.add(1)을 해주어도
/// 메모리 상의 주소는 그대로에 데이터를 변경을 해줄 수 있습니다.

@immutable
class StoryData {
  final String name;
  final String url;

  const StoryData({
    required this.name,
    required this.url,
  });
}
