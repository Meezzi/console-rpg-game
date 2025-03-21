# 🚀 콘솔 쇼핑몰
이 프로젝트는 콘솔 환경에서 작동하는 RPG Game입니다.
플레이어는 캐릭터를 생성하고, 다양한 몬스터들과 차례로 전투를 하며 살아남는 것이 목표입니다.

![image](https://github.com/user-attachments/assets/789b831e-d289-4c06-9417-be3386253955)


<br>

## 프로젝트 구조

```
/bin
  ├─ utils/
  │    └─ input.dart
  ├─ domain/
  │    └─ usecase/
  │         ├─ character.dart
  │         ├─ monster.dart
  │         └─ game.dart
  └─ main.dart
/resource
  ├─ characters.txt
  ├─ monsters.txt
  └─ result.txt

```

<br>

## 🛠️ 기능 목록
### 1) 캐릭터 생성 및 로딩

사용자가 이름을 입력하면 characters.txt에서 해당 캐릭터의 스탯 정보를 로드합니다.
캐릭터는 heal, attack, defense를 가집니다.

![image](https://github.com/user-attachments/assets/6c176485-3bd7-4f40-976a-a6080141a579)


### 2)  몬스터 데이터 로딩

monsters.txt에서 여러 마리의 몬스터 정보를 로드합니다.몬스터는 이름, 체력, 최대 공격력을 가지며, 전투 시 랜덤으로 등장합니다.

![image](https://github.com/user-attachments/assets/9a41126d-2d52-44b7-a880-375b17ee5668)


### 3) 전투 시스템

턴제로 전투가 진행됩니다.
먼저 플레이어의 턴이 시작되며, 행동을 선택합니다.1: 공격 2: 방어 (몬스터 공격력의 10%만큼 체력 회복) 3: 아이템 사용 (공격력 2배, 단 1회 제한)
 
행동 선택 후, 몬스터의 턴이 시작됩니다.
몬스터는 랜덤 공격력으로 공격하며, 초기 방어력은 0이지만, 3턴마다 방어력이 2씩 증가합니다.

![image](https://github.com/user-attachments/assets/ba9b3be1-eaf9-4758-b737-bded8e8c7cf9)


### 4) 아이템 시스템

아이템은 한 번만 사용 가능하며, 사용 시 공격력이 2배로 증가합니다.
한 번 공격 후 다시 원래의 공격력으로 돌아갑니다.

![image](https://github.com/user-attachments/assets/81797b54-b9cd-4029-82cc-29f75ccfa7ed)



### 5) 게임 저장 기능

전투 도중이나 게임이 끝난 후, 결과를 result.txt에 저장합니다.
캐릭터 이름, 남은 체력, 승패 여부를 저장하며,아직 전투가 끝나지 않았다면 남은 몬스터들의 정보도 저장합니다.

![image](https://github.com/user-attachments/assets/b2205fa9-7321-4d23-88e4-78fafc902636)

```
dev, 39, false
Batman, 30, 0, 0, 20
```


### 6) 기타 기능

전투 후 계속 싸울지 여부를 선택할 수 있으며, 30% 확률로 게임 시작 시 캐릭터 체력이 10 (보너스 회복) 회복됩니다.

![image](https://github.com/user-attachments/assets/ee59566f-6ee4-4028-b552-e7bc403087bb)



