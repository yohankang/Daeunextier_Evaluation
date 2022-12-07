trigger Opportunity on Opportunity (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
	new Opportunity_tr().run();
}














































/*
	Opportunity_tr2() 100건 insert 5번 테스트 결과   :    1.5576
		1.613
		1.441
		1.489
		1.384
		1.861
		
	Opportunity_tr() 100건 insert 5번 테스트 결과   :    0.9592
		0.991
		0.905
		0.954
		1.020
		0.926
	
	100개를 업데이트하는데, 대상이 1개, Amount만 변경될 경우 테스트
	Opportunity_tr2() 100건 5번 테스트 결과   :    0.5954
		0.578
		0.569
		0.637
		0.575
		0.618

		
	Opportunity_tr() 100건 5번 테스트 결과   :    0.565
		0.589
		0.519
		0.549
		0.574
		0.594
		
	100개를 업데이트하는데, 대상이 10개, Amount, LeadSource 모두 변경될 경우 테스트
	Opportunity_tr2() 100건 5번 테스트 결과   :    0.7008
		0.776
		0.667
		0.767
		0.653
		0.641


		
	Opportunity_tr() 100건 5번 테스트 결과   :    0.654
		0.692
		0.633
		0.676
		0.665
		0.604


 */