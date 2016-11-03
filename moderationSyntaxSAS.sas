libname plos 'C:\Users\Mike\Documents\Stanford';

/*
aveHealthy_t1 	aveUnhealthy_t1	 aveHealthy_t2	 aveUnhealthy_t2	 aveHealthy_t2_repeated 	aveUnhealthy_t2_repeated	 aveHealthy_t2_novel	 
aveUnhealthy_t2_novel 	aveHealthy_t3	 aveUnhealthy_t3	 aveHealthy_t3_repeated 	aveUnhealthy_t3_repeated 	
aveHealthy_t3_novel 	aveUnhealthy_t3_novel	 candyTaken 	percievedHealthy 

data plos;
set plos.foodSPSS_toPublish;
run;
*/
 

proc glm data=plos;
class condition;
model aveHealthy_t1 = condition | bmi;
run;

proc glm data=plos;
class condition;
model aveUnhealthy_t1 = condition | bmi;
run;

proc glm data=plos;
class condition;
model aveHealthy_t2 = condition | bmi;
run;

proc glm data=plos;
class condition;
model aveUnhealthy_t2 = condition | bmi;
run;

proc glm data=plos;
class condition;
model aveHealthy_t2_repeated = condition | bmi;
run;

proc glm data=plos;
class condition;
model aveUnhealthy_t2_repeated = condition | bmi;
run;

proc glm data=plos;
class condition;
model aveHealthy_t2_novel = condition | bmi;
run;

proc glm data=plos;
class condition;
model aveUnhealthy_t2_novel = condition | bmi;
run;

proc glm data=plos;
class condition;
model aveHealthy_t3 = condition | bmi;
run;

proc glm data=plos;
class condition;
model aveUnhealthy_t3 = condition | bmi;
run;

proc glm data=plos;
class condition;
model aveHealthy_t3_repeated = condition | bmi;
run;

proc glm data=plos;
class condition;
model aveUnhealthy_t3_repeated = condition | bmi;
run;

proc glm data=plos;
class condition;
model aveHealthy_t3_novel = condition | bmi;
run;

proc glm data=plos;
class condition;
model aveUnhealthy_t3_novel = condition | bmi;
run;

proc glm data=plos;
class condition;
model candyTaken = condition | bmi;
run;

proc glm data=plos;
class condition;
model percievedHealthy = condition | bmi;
run;

   proc print data=plos;
   run;
proc contents data=plos;
	run;
