/*
요구사항 - lightning component로 개발
개발된 컴포넌트는 Opportunity Record Page에 노출

화면
┌───────────────┬───────────────┬───────────────┬───────────────┬───────────────┬───────────────┬───────────────┬───────────────┐
│ Seq           │ Product       │ List Price    │ Unit Price    │ Quantity      │ TotalPrice    │ Description   │ Action [+ Button]│
├───────────────┼───────────────┼───────────────┼───────────────┼───────────────┼───────────────┼───────────────┼───────────────┤
│[seq]          │[Search Product│[List Price]   │[Input]        │[Input]        │[Auto]         │[Input]        │[-,▲,▼ Button] │
└───────────────┴───────────────┴───────────────┴───────────────┴───────────────┴───────────────┴───────────────┴───────────────┘

[Cancel] [Save]

로딩시 이미 저장되어 있는 OpportunityLineItem 레코드를 불러 화면에 뿌려줌
필드 : SortOrder, Product2Id, ListPrice, UnitPrice, Quantity, TotalPrice, Description

+ 버튼 클릭시 맨 아래에 빈라인이 생성이 되면서 Seq(SortOrder)는 가장큰 Seq(SortOrder)+1 로 생성이 됨

Product를 검색하여 선택한 경우 Product에 등록되어 있는 ListPrice를 불어와 화면에 노출

UnitPrice와 Quantity 입력 또는 수정시 TotalPrice는 자동 계산

- 버튼 클릭시 해당 라인은 삭제

▲ 버튼은 맨 상단은 노출안함

▲ 버튼 클릭시 해당라인을 위 라인으로 이동하면서 Seq(SortOrder) 조정

▼ 버튼은 맨 하단은 노출안함

▼ 버튼 클릭시 해당라인을 아래 라인으로 이동하면서 Seq(SortOrder) 조정

Cancel 버튼 클릭시 현재까지 수정된 사항은 취소되고 초기화

Save 버튼 클릭시 현재까지 입력된 사항 저장

기타 필요한 사항이 있다고 판단이 되면 추가
*/
/*
Evaluation3 작업 이후 작업
OpportunityLineItem에 아래 필드 추가
Exchange Rate (ExchangeRate__c Number(10,8))
USD TotalPrice (UsdTotalPrice__c Number(16,2))
┌───────────────┬───────────────┬───────────────┬───────────────┬───────────────┬───────────────┬───────────────┬───────────────┬───────────────┬───────────────┐
│ Seq           │ Product       │ List Price    │ Unit Price    │ Quantity      │ TotalPrice    │ Description   │ Exchange Rate │ USD TotalPrice│ Action [+ Button]│
├───────────────┼───────────────┼───────────────┼───────────────┼───────────────┼───────────────┼───────────────┼───────────────┼───────────────┼───────────────┤
│[seq]          │[Search Product│[List Price]   │[Input]        │[Input]        │[Auto]         │[Input]        │[Auto]         │[Auto]         │[-,▲,▼ Button] │
└───────────────┴───────────────┴───────────────┴───────────────┴───────────────┴───────────────┴───────────────┴───────────────┴───────────────┴───────────────┘

[Cancel] [Save] [환율 Reset]

라인이 추가될때 Evaluation3에서 만든 API를 호출하여 (웹서비스로 호출) Exchange Rate 및 USD TotalPrice를 계산하여 넣는다.
USD TotalPrice는 TotalPrice * (1 / Exchange Rate)
이후 TotalPrice가 변경될때마다 USD TotalPrice를 자동으로 계산하여 보여준다.
USD TotalPrice를 소수점3자리에서 반올림 처리하여 2자리까지만 보여준다.

환율 Reset 버튼을 클릭하면 비동기식 방식으로 (Queueable 방식) Evaluation3에서 만든 API를 하나씩 호출하며 한 라인씩 업데이트한다.
화면에서 한 라인씩 호출하여야 하며 화면에서는 완료될때까지 pending 처리를 한다.

저장시 Exchange Rate 및 USD TotalPrice까지 저장한다.


*/
public with sharing class Evaluation2 {

}