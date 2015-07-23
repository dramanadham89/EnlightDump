/*****************************************************************************
  Name: BudgetWrapper.cls
  
  Author: HumanTouch.llc
  
  ============================================================================
  Purpose:
  -------
  
  Wrapper Class used to wrap budget values to be upserted from Intiative Budget
  --> Investment Budget --> Program Budget --> BusinessLineBudget objects in 
  budget trigger handlers.

  This file also includes a test class for BudgetWrapper.
  
  ============================================================================
  
  ============================================================================
  History:
  -------
  
  VERSION 	AUTHOR       		DATE        	DETAIL            FEATURES/CSR
      1.0 	HumanTouch.llc     	12/29/2014    	Initial Release
  
  ============================================================================
         
 *****************************************************************************/
public with sharing class BudgetWrapper {
    
    //Creation of the various budget fields, shared by the budgets
    public Decimal DM_E_Grow_Budget{get;set;}
    public Decimal DM_E_Transform_Budget{get;set;} 
    public Decimal O_M_Run_Budget{get;set;}
    public Decimal Spend{get;set;}
    public Decimal Forecast_Amount{get;set;}
    
    public BudgetWrapper(){}
    
    //Constructor for BudgetWrapper using less variables, unused in Budget upsert
    public BudgetWrapper( Decimal DM_E_Grow_Budget, Decimal  DM_E_Transform_Budget, Decimal O_M_Run_Budget ){
        
        this.DM_E_Grow_Budget = DM_E_Grow_Budget != null ? DM_E_Grow_Budget : 0 ;
        this.DM_E_Transform_Budget = DM_E_Transform_Budget != null ? DM_E_Transform_Budget : 0 ;
        this.O_M_Run_Budget = O_M_Run_Budget != null ? O_M_Run_Budget : 0 ;
    }
    
    //Constructor for BudgetWrapper with all Budget fields, used by InitiativeBudget, InvestmentBudget, and ProgramBudget for vaule upsert
    public BudgetWrapper( Decimal DM_E_Grow_Budget, Decimal  DM_E_Transform_Budget, Decimal O_M_Run_Budget,
                          Decimal Spend, Decimal Forecast_Amount){
        
        this.DM_E_Grow_Budget = DM_E_Grow_Budget != null ? DM_E_Grow_Budget : 0 ;
        this.DM_E_Transform_Budget = DM_E_Transform_Budget != null ? DM_E_Transform_Budget : 0 ;
        this.O_M_Run_Budget = O_M_Run_Budget != null ? O_M_Run_Budget : 0 ;
        
        this.Spend = Spend != null ? Spend : 0 ;
        this.Forecast_Amount = Forecast_Amount != null ? Forecast_Amount : 0 ;
    }
    
    /*** test method ***/
    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        BudgetWrapper bWrapper1 = new BudgetWrapper(10, 10, 10 );
        BudgetWrapper bWrapper2 = new BudgetWrapper(10, 10, 10, 10, 10 );
        
        System.assert(bWrapper1.DM_E_Grow_Budget == 10);
    }
        
}