@IsTest
private class Evaluation1_test {
	static testMethod void doTest() {
		//필요한 레코드 생성
		test.startTest();
		
		System.assertEquals(new Evaluation1().getResult3And5(10), 33);
		System.assertEquals(new Evaluation1().getResult3And5(20), 98);
		
		System.assertEquals(new Evaluation1().getStrPatternIntegerToString(123, 5), '00123');
		System.assertEquals(new Evaluation1().getStrPatternIntegerToString(123, 2), '123');
		System.assertEquals(new Evaluation1().getStrPatternIntegerToString(1234, 8), '00001234');
		
		System.assertEquals(new Evaluation1().getStrFormatYyyyMmDd(Date.newInstance(2022, 10, 4)), '20221004');
		System.assertEquals(new Evaluation1().getStrFormatYyyyMmDd(Date.newInstance(2022, 1, 4)), '20220104');
		System.assertEquals(new Evaluation1().getStrFormatYyyyMmDd(Date.newInstance(2022, 12, 25)), '20221225');
		System.assertEquals(new Evaluation1().getStrFormatYyyyMmDd(Date.newInstance(2022, 1, 2)), '20220102');
		
		test.stopTest();
	}
}