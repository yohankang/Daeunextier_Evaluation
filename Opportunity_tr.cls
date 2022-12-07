/*
사전 준비
1. Account에 LeadSource__c MultiPicklist 필드를 생성하고 Opportunity의 LeadSource Picklist 값을 모두 추가
2. Account에 Grade__c Picklist 필드를 추가, 값은 A,B,C,D,E
3. Account에 GradeLastYear__c Picklist 필드를 추가, 값은 A,B,C,D,E


LeadSource는 'Other' 로 생성할 수 없음
LeadSource는 변경할 수 없음
단, 다른 클래스내에서 'Other' 로 생성할 수 있도록 처리가 되어야 함 (예외 처리를 할 수 있도록)


Opportunity가 IsWon 이고, ClosedDate가 올해인 Account 별 Amount 총액에 따라 Account의 GradeThisYear__c값에 Amount 총액별로 등급 업데이트
500만원미만 E, 500만원이상 D, 1000만원이상 C, 5000만원이상 B, 1억이상 A
단 작년등급 (GradeLastYear__c)가 높은 경우 작년등급으로 그대로 둠
예) Account "sample1" GradeLastYear__c 가 값이 없는 경우
Account "sample1" 에 IsWon된 Opportunity Amount 300만원 발생 -> Grade__c E
Account "sample1" 에 IsWon된 Opportunity Amount 300만원 추가발생 -> Grade__c D
Account "sample1" 에 IsWon된 Opportunity Amount 300만원 추가발생 -> Grade__c D 유지
Account "sample1" 에 IsWon된 Opportunity Amount 300만원 추가발생 -> Grade__c C
예) Account "sample1" GradeLastYear__c 가 D이고 Grade__c 가 D인 경우
Account "sample1" 에 IsWon된 Opportunity Amount 300만원 발생 -> Grade__c D 유지
Account "sample1" 에 IsWon된 Opportunity Amount 300만원 추가발생 -> Grade__c D 유지
Account "sample1" 에 IsWon된 Opportunity Amount 300만원 추가발생 -> Grade__c D 유지
Account "sample1" 에 IsWon된 Opportunity Amount 300만원 추가발생 -> Grade__c C


Opportunity가 등록될때마다 Opportunity의 LeadSource가 Account의 LeadSource__c에 포함되어 있지 않으면 Account의 LeadSource__c에 추가 선택된 걸로 업데이트

*/

public with sharing class Opportunity_tr {
	List<Opportunity> listNew = Trigger.new;
	List<Opportunity> listOld = Trigger.old;
	Map<Id, Opportunity> mapNew = (Map<Id, Opportunity>)Trigger.newMap;
	Map<Id, Opportunity> mapOld = (Map<Id, Opportunity>)Trigger.oldMap;
	
	public void run() {
		if(Trigger.isBefore && Trigger.isInsert) beforeInsert();
		else if(Trigger.isBefore && Trigger.isUpdate) beforeUpdate();
		else if(Trigger.isBefore && Trigger.isDelete) beforeDelete();
		else if(Trigger.isAfter && Trigger.isInsert) afterInsert();
		else if(Trigger.isAfter && Trigger.isUpdate) afterUpdate();
		else if(Trigger.isAfter && Trigger.isDelete) afterDelete();
		else if(Trigger.isAfter && Trigger.isUndelete) afterUndelete();
	}
	
	private void beforeInsert() {}
	private void beforeUpdate() {}
	private void beforeDelete() {}
	private void afterInsert() {}
	private void afterUpdate() {}
	private void afterDelete() {}
	private void afterUndelete() {}
}