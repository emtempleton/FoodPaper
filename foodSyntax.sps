#####RESULTS########

***************************************************

## CONFORMITY ##

Trial-by-trail conformity analyses and data file are in R.

***************************************************

## PREFERENCES ##

Differences between condition for preferences for healthy and unhealthy foods at Time 1 

ONEWAY aveHealthy_t1 aveUnhealthy_t1 BY 
    condition
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=LSD ALPHA(0.05).

T-TEST GROUPS=condition(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t1 aveUnhealthy_t1
  /CRITERIA=CI(.95).

T-TEST GROUPS=condition(1 3)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t1 aveUnhealthy_t1
  /CRITERIA=CI(.95).

T-TEST GROUPS=condition(2 3)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t1 aveUnhealthy_t1
  /CRITERIA=CI(.95).

***************************************************

## FOLLOW-UP RATINGS ##

Overall pattern of preferences for healthy and unhealthy foods at Time 2

ONEWAY aveHealthy_t2 aveUnhealthy_t2 BY 
    condition
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=LSD ALPHA(0.05).

T-TEST GROUPS=condition(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t2 aveUnhealthy_t2
  /CRITERIA=CI(.95).

T-TEST GROUPS=condition(1 3)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t2 aveUnhealthy_t2
  /CRITERIA=CI(.95).

T-TEST GROUPS=condition(2 3)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t2 aveUnhealthy_t2
  /CRITERIA=CI(.95).


***************************************************

## REPEATED VS. NOVEL IMAGES ##

Overall preferences for healthy and unhealthy novel foods at Time 2

ONEWAY aveHealthy_t2_novel aveUnhealthy_t2_novel BY condition
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=LSD ALPHA(0.05).

T-TEST GROUPS=condition(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t2_novel aveUnhealthy_t2_novel
  /CRITERIA=CI(.95).

T-TEST GROUPS=condition(1 3)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t2_novel aveUnhealthy_t2_novel
  /CRITERIA=CI(.95).

T-TEST GROUPS=condition(2 3)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t2_novel aveUnhealthy_t2_novel
  /CRITERIA=CI(.95).

Comparing preferences for reapted images with preferences to novel images, within each condition

SORT CASES  BY condition.
SPLIT FILE SEPARATE BY condition.

T-TEST PAIRS=aveHealthy_t2_repeated aveUnhealthy_t2_repeated WITH aveHealthy_t2_novel 
    aveUnhealthy_t2_novel (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

SPLIT FILE OFF.

***************************************************

## PERSISTENCE OF INFLUENCE AFTER A 3-DAY DELAY ##

Overall pattern of preferences for healthy and unhealthy foods at Time 3

ONEWAY aveHealthy_t3 aveUnhealthy_t3 BY 
    condition
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=LSD ALPHA(0.05).

T-TEST GROUPS=condition(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t3 aveUnhealthy_t3
  /CRITERIA=CI(.95).

T-TEST GROUPS=condition(1 3)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t3 aveUnhealthy_t3
  /CRITERIA=CI(.95).

T-TEST GROUPS=condition(2 3)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t3 aveUnhealthy_t3
  /CRITERIA=CI(.95).

Comparing preferences for reapted images with preferences to novel images, within each condition

SORT CASES  BY condition.
SPLIT FILE SEPARATE BY condition.

T-TEST PAIRS=aveHealthy_t3_repeated aveUnhealthy_t3_repeated WITH aveHealthy_t3_novel 
    aveUnhealthy_t3_novel (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

SPLIT FILE OFF.

***************************************************

## HEALTH PERCEPTION ##

Comparing differences in health perception between groups

ONEWAY percievedHealthy percievedUnhealthy BY condition
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=LSD ALPHA(0.05).

T-TEST GROUPS=condition(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=percievedHealthy percievedUnhealthy
  /CRITERIA=CI(.95).

T-TEST GROUPS=condition(1 3)
  /MISSING=ANALYSIS
  /VARIABLES=percievedHealthy percievedUnhealthy
  /CRITERIA=CI(.95).

T-TEST GROUPS=condition(2 3)
  /MISSING=ANALYSIS
  /VARIABLES=percievedHealthy percievedUnhealthy
  /CRITERIA=CI(.95).

***************************************************

## IN-LAB EATING BEHAVIOR ##

Comparing grams of M&Ms taken by participants in each condition 

ONEWAY candyTaken BY condition
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=LSD ALPHA(0.05).

T-TEST GROUPS=condition(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=candyTaken
  /CRITERIA=CI(.95).

T-TEST GROUPS=condition(1 3)
  /MISSING=ANALYSIS
  /VARIABLES=candyTaken
  /CRITERIA=CI(.95).

T-TEST GROUPS=condition(2 3)
  /MISSING=ANALYSIS
  /VARIABLES=candyTaken
  /CRITERIA=CI(.95).

***************************************************

## TEST FOR BMI MODERATION ##



***************************************************

## INVESTIGATE GENDER DIFFERENCES WITHIN EACH CONDITION ##

SORT CASES  BY condition.
SPLIT FILE SEPARATE BY condition.

T-TEST GROUPS=gender(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t1 aveUnhealthy_t1 aveHealthy_t2 aveUnhealthy_t2 aveHealthy_t2_repeated 
    aveUnhealthy_t2_repeated aveHealthy_t2_novel aveUnhealthy_t2_novel aveHealthy_t3 aveUnhealthy_t3 
    aveHealthy_t3_repeated aveUnhealthy_t3_repeated aveHealthy_t3_novel aveUnhealthy_t3_novel 
    candyTaken percievedHealthy percievedUnhealthy bmi age
  /CRITERIA=CI(.95).

SPLIT FILE OFF.

***************************************************

## MORE M&M TESTS ##

USE ALL.
COMPUTE filter_$=(candyTaken ~= 0).
VARIABLE LABELS filter_$ 'candyTaken ~= 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

ONEWAY ZSco15 candyTaken BY condition
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=LSD ALPHA(0.05).

USE ALL.
COMPUTE filter_$=(candyTaken = 0).
VARIABLE LABELS filter_$ 'candyTaken = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

ONEWAY ZSco15 candyTaken BY condition
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=LSD ALPHA(0.05).


***************************************************

1. Participants in the healthy norm condition decrease their preferences for unhealthy foods relative to participants in the unhealthy norm and no norm conditions.

ONEWAY aveHealthy_t1 aveUnhealthy_t1 aveHealthy_t2 aveUnhealthy_t2 aveHealthy_t3 aveUnhealthy_t3 BY 
    condition
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=LSD ALPHA(0.05).

2. These preference differences extended to novel food images as well, further suggesting that participants were able to learn the health norm.

ONEWAY aveHealthy_t2_novel aveUnhealthy_t2_novel BY condition
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=LSD ALPHA(0.05).

SORT CASES  BY condition.
SPLIT FILE SEPARATE BY condition.

T-TEST PAIRS=aveHealthy_t2_repeated aveUnhealthy_t2_repeated WITH aveHealthy_t2_novel 
    aveUnhealthy_t2_novel (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

T-TEST PAIRS=aveHealthy_t3_repeated aveUnhealthy_t3_repeated WITH aveHealthy_t3_novel 
    aveUnhealthy_t3_novel (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

T-TEST PAIRS=aveHealthy_t2_repeated aveUnhealthy_t2_repeated WITH  aveHealthy_t1 aveUnhealthy_t1 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

T-TEST PAIRS=aveHealthy_t3_repeated aveUnhealthy_t3_repeated WITH  aveHealthy_t1 aveUnhealthy_t1 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

T-TEST PAIRS=aveHealthy_t3 aveUnhealthy_t3 WITH  aveHealthy_t1 aveUnhealthy_t1 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

T-TEST PAIRS=aveHealthy_t3 aveUnhealthy_t3 WITH  aveHealthy_t2 aveUnhealthy_t2 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

T-TEST PAIRS=aveHealthy_t3_repeated aveUnhealthy_t3_repeated WITH  aveHealthy_t2_repeated aveUnhealthy_t2_repeated (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

3.	Participant preferences are stable in the absence of feedback, even three days later.

See (1)

4. Use R.

5. Participants in the unhealthy norm condition rate unhealthy foods as being significantly healthier than other participants.

SPLIT FILE OFF.

ONEWAY percievedHealthy percievedUnhealthy BY condition
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=LSD ALPHA(0.05).

6.	No differences in M&Ms after the task or reported food consumption between conditions. 

ONEWAY candyTaken BY condition
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=LSD ALPHA(0.05).






% t-test between absolute differene in group and t1 ratings AND absolute difference in group and t2 ratings. uses 60 repeated images.

DATASET ACTIVATE DataSet0.

T-TEST GROUPS=condition(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=diff_group_t1 diff_group_t2
  /CRITERIA=CI(.95).


% t-test between correlation between group responses and t1 responses AND correlation between group responses and t2 responses. uses 60 repeated images.

T-TEST GROUPS=condition(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=corr_group_t1 corr_group_t2
  /CRITERIA=CI(.95).

% uses all images and categorizes them by healthy or unhealthy. compares average preferences or each category at t1 and t2

T-TEST GROUPS=condition(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t1 aveUnhealthy_t1 aveHealthy_t2 aveUnhealthy_t2
  /CRITERIA=CI(.95).

% paird test to determine general conformity to a rule. ignores condition. 

T-TEST PAIRS=corr_group_t1 diff_group_t1 WITH corr_group_t2 diff_group_t2 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.












T-TEST GROUPS=condition(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t1 aveUnhealthy_t1 aveHealthy_t2 aveUnhealthy_t2 aveHealthy_t2_repeated 
    aveUnhealthy_t2_repeated aveHealthy_t2_novel aveUnhealthy_t2_novel aveHealthy_t3 aveUnhealthy_t3
  /CRITERIA=CI(.95).

T-TEST GROUPS=condition(2 3)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t1 aveUnhealthy_t1 aveHealthy_t2 aveUnhealthy_t2 aveHealthy_t2_repeated 
    aveUnhealthy_t2_repeated aveHealthy_t2_novel aveUnhealthy_t2_novel aveHealthy_t3 aveUnhealthy_t3
  /CRITERIA=CI(.95).

T-TEST GROUPS=condition(1 3)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t1 aveUnhealthy_t1 aveHealthy_t2 aveUnhealthy_t2 aveHealthy_t2_repeated 
    aveUnhealthy_t2_repeated aveHealthy_t2_novel aveUnhealthy_t2_novel aveHealthy_t3 aveUnhealthy_t3
  /CRITERIA=CI(.95).





USE ALL.
COMPUTE filter_$=(candyTaken ~= 0).
VARIABLE LABELS filter_$ 'candyTaken ~= 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

ONEWAY ZSco15 candyTaken BY condition
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS
  /POSTHOC=LSD ALPHA(0.05).

T-TEST GROUPS=condition(1 3)
  /MISSING=ANALYSIS
  /VARIABLES=aveHealthy_t2_repeated aveUnhealthy_t2_repeated
  /CRITERIA=CI(.95).

***************************************************

## TEST FOR BMI MODERATION ##

# aveHealthy_t1.
UNIANOVA aveHealthy_t1 BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA aveHealthy_t1 BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA aveHealthy_t1 BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

# aveUnhealthy_t1.
UNIANOVA aveUnhealthy_t1 BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA aveUnhealthy_t1 BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA aveUnhealthy_t1 BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.


# aveHealthy_t2.
UNIANOVA aveHealthy_t2 BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA aveHealthy_t2 BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA aveHealthy_t2 BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

# aveUnhealthy_t2.
UNIANOVA aveUnhealthy_t2 BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA aveUnhealthy_t2 BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA aveUnhealthy_t2 BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

# aveHealthy_t2_repeated.
UNIANOVA aveHealthy_t2_repeated BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA aveHealthy_t2_repeated BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA aveHealthy_t2_repeated BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

# aveUnhealthy_t2_repeated.
UNIANOVA aveUnhealthy_t2_repeated BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA aveUnhealthy_t2_repeated BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA aveUnhealthy_t2_repeated BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

# aveHealthy_t2_novel.
UNIANOVA aveHealthy_t2_novel BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA aveHealthy_t2_novel BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA aveHealthy_t2_novel BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

# aveUnhealthy_t2_novel.
UNIANOVA aveUnhealthy_t2_novel BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA aveUnhealthy_t2_novel BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA aveUnhealthy_t2_novel BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

# aveUnhealthy_t3_novel.
UNIANOVA aveUnhealthy_t3_novel BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA aveUnhealthy_t3_novel BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA aveUnhealthy_t3_novel BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.


# aveHealthy_t3_repeated.
UNIANOVA aveHealthy_t3_repeated BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA aveHealthy_t3_repeated BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA aveHealthy_t3_repeated BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

# aveUnhealthy_t3_repeated.
UNIANOVA aveUnhealthy_t3_repeated BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA aveUnhealthy_t3_repeated BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA aveUnhealthy_t3_repeated BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

# aveHealthy_t3_novel.
UNIANOVA aveHealthy_t3_novel BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA aveHealthy_t3_novel BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA aveHealthy_t3_novel BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

# aveHealthy_t3.
UNIANOVA aveHealthy_t3 BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA aveHealthy_t3 BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA aveHealthy_t3 BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

# aveUnhealthy_t3.
UNIANOVA aveUnhealthy_t3 BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA aveUnhealthy_t3 BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA aveUnhealthy_t3 BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

# aveHealthy_t3_repeated.
UNIANOVA aveHealthy_t3_repeated BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA aveHealthy_t3_repeated BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA aveHealthy_t3_repeated BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

# aveUnhealthy_t3_repeated.
UNIANOVA aveUnhealthy_t3_repeated BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA aveUnhealthy_t3_repeated BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA aveUnhealthy_t3_repeated BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

# candyTaken.
UNIANOVA candyTaken BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA candyTaken BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA candyTaken BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

# percievedHealthy.
UNIANOVA percievedHealthy BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA percievedHealthy BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA percievedHealthy BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

# percievedUnhealthy.
UNIANOVA percievedUnhealthy BY condition
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition.

UNIANOVA percievedUnhealthy BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=condition bmi bmi*condition.

UNIANOVA percievedUnhealthy BY condition WITH bmi
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(condition) WITH(bmi=MEAN) COMPARE ADJ(LSD)
  /PRINT=ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=bmi condition.

***************************************************

