@IsTest
private class Opportunity_tr_test {
	static testMethod void doTest() {
		Account objAccount = new Account();
		objAccount.Name = '테스트Account';
		insert objAccount;
		
		Opportunity obj = new Opportunity();
		obj.Name = '테스트Opportunity';
		obj.AccountId = objAccount.Id;
		obj.StageName = 'Closed Won';
		obj.CloseDate = System.today();
		
		test.startTest();
		
		insert obj;
		update obj;
		delete obj;
		undelete obj;
		
		test.stopTest();
	}
}