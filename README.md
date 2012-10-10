# U.S. Census Return Rate Challenge
> This challenge is to develop a statistical model to predict census mail
> return rates at the Census block group level of geography. The Census Bureau
> will use this model for planning purposes for the decennial census and for
> demographic sample surveys. The model-based estimates of predicted mail
> return will be publicly released in a later version of the Census "planning
> database" containing updated demographic data.

## Data Cleaning
**State_name ambiguity**:
`sed -e "s/District of Co/District of Colu/;" data/test_filev1.csv > data/test_filev1.clean.csv`
**Currency columns**

## Well-correlated columns:

* State
* County
* Tract
* LAND_AREA
* URBANIZED_AREA_POP_CEN_2010
* Tot_Population_ACSMOE_06_10
* Pop_under_5_ACSMOE_06_10
* Hispanic_ACSMOE_06_10
* NH_White_alone_ACS_06_10
* NH_AIAN_alone_CEN_2010
* Pop_25yrs_Over_ACS_06_10
* Pop_25yrs_Over_ACSMOE_06_10
* Not_HS_Grad_ACSMOE_06_10
* College_ACS_06_10
* Pop_1yr_Over_ACS_06_10
* Diff_HU_1yr_Ago_ACSMOE_06_10
* ENG_VW_SPAN_ACS_06_10
* ENG_VW_SPAN_ACSMOE_06_10
* ENG_VW_OTHER_ACS_06_10
* Rel_Family_HHD_ACS_06_10
* Rel_Family_HHD_ACSMOE_06_10
* MrdCple_Fmly_HHD_ACS_06_10
* Not_MrdCple_HHD_ACSMOE_06_10
* Female_No_HB_CEN_2010
* Sngl_Prns_HHD_ACSMOE_06_10
* HHD_PPL_Und_18_ACSMOE_06_10
* Tot_Prns_in_HHD_ACSMOE_06_10
* Rel_Child_Under_6_CEN_2010
* HHD_Moved_in_ACSMOE_06_10
* PUB_ASST_INC_ACSMOE_06_10
* Med_HHD_Inc_BG_ACS_06_10
* Aggregate_HH_INC_ACS_06_10
* Tot_Housing_Units_ACSMOE_06_10
* Tot_Occp_Units_ACSMOE_06_10
* Tot_Vacant_Units_ACS_06_10
* Renter_Occp_HU_CEN_2012
* Owner_Occp_HU_ACS_06_10
* Single_Unit_ACS_06_10
* MLT_U2_9_STRC_ACS_06_10
* Crowd_Occp_U_ACS_06_10
* Aggr_House_Value_ACS_06_10
