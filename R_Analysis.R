## Syntax for conformity results in: "Social norms shift food preferences for healthy and unhealthy foods"
## by: Emma Templeton, Michael Stanton, & Jamil Zaki (2016)
## Updated: August 1, 2016
## Contact: emtempleton@gmail.com

##########........................................................##########

#Load packages

install.packages("ggplot2")
install.packages("plyr")
install.packages("lme4")
install.packages("car")
install.packages("lmerTest")
install.packages("dplyr")

require(ggplot2)
require(plyr)
require(lme4)
require(car)
require(lmerTest)
require(dplyr)

##########..........................................................#########

# Name directories and files, edit to point to local directory
root_dir = '~/Dropbox/FoodStudyAnalysis'
data_dir = sprintf('%s/R_Analysis', root_dir)
all_sub_behav_file = sprintf('%s/peersHigherRepeated.csv', data_dir)

#Load file into dataframe
beh_d = read.csv(all_sub_behav_file, header=T)

# Inspect data frame
head(beh_d) #show first 6 lines
summary(beh_d) #show overall structure
names(beh_d) #what are all the column names of my data frame

##########.........................................................##########

# Ensure that variables of interest are numeric
beh_d$r1_num = as.numeric(as.character(beh_d$ratingR1))
beh_d$r2_num = as.numeric(as.character(beh_d$ratingR2))
beh_d$r3_num = as.numeric(as.character(beh_d$ratingR3))
beh_d$f_num = as.numeric(as.character(beh_d$feedback))
beh_d$delta_r = as.numeric(as.character(beh_d$t1_v_t2))
beh_d$delta_r3 = as.numeric(as.character(beh_d$t1_v_t3))
beh_d$delta_t1f = as.numeric(as.character(beh_d$group_v_t1))
beh_d$candy = as.numeric(as.character(beh_d$candy))
beh_d$conformity_score = as.numeric(as.character(beh_d$conformity_score))

# Reverse direction of delta_r and delta_r3 (T1-T2 --> T2-T1)
beh_d$delta_r = with(beh_d, delta_r*-1)
beh_d$delta_r3 = with(beh_d, delta_r3*-1)

# Create feedback bins
  # Peers_Lower = differences between feedback and preference is less than 1
  # Peers_Higher = difference between feedback and preference is greater than 1
  # Peers_Same = difference between feedback and preference is 0 or 1
beh_d$feedback_bin = 'none'
beh_d$feedback_bin[beh_d$delta_t1f == 0] = 'same'
beh_d$feedback_bin[beh_d$delta_t1f ==  1] = 'same'
beh_d$feedback_bin[beh_d$delta_t1f ==  -1] = 'same'
beh_d$feedback_bin[beh_d$delta_t1f > 1] = 'higher'
beh_d$feedback_bin[beh_d$delta_t1f < -1] = 'lower'
beh_d$feedback_bin = factor(beh_d$feedback_bin, levels = c('lower', 'same','higher'))

# reference group is Peers_Same
beh_d$feedback_bin=relevel(beh_d$feedback_bin,ref="same") 

##########..............................................................##########

# Explore mean, standard deviation, and SEM 
# across all trials for each feedback bin type

mean(subset(beh_d, beh_d$feedback_bin=="same")$delta_r)
mean(subset(beh_d, beh_d$feedback_bin=="higher")$delta_r)
mean(subset(beh_d, beh_d$feedback_bin=="lower")$delta_r)

sd_same <- sd(subset(beh_d, beh_d$feedback_bin=="same")$delta_r); sd_same
sd_higher <- sd(subset(beh_d, beh_d$feedback_bin=="higher")$delta_r); sd_higher
sd_lower <- sd(subset(beh_d, beh_d$feedback_bin=="lower")$delta_r); sd_lower

sem_same <- sd_same/sqrt(4107); sem_same
sem_higher <- sd_higher/sqrt(2478); sem_higher
sem_lower <- sd_lower/sqrt(3015); sem_lower

############..................................................................................############

### MAIN ANALYSIS ###

# Change from initial rating to follow-up rating for each item (delta_r) is predicted by the 
# feedback_bin (whether the feedback was higher, lower, or same as initial rating), 
# controlling for initial rating (r1_num) to account for potential regression to the mean

fitNC_lmer = lmer(delta_r ~ r1_num + feedback_bin + (1 | subID), data=subset(beh_d,REML=F));summary(fitNC_lmer); anova(fitNC_lmer);

# test vcov
vcov(fitNC_lmer)

##########............................................................................##########

#find mean delta_r for Peers Same trials for each participant
meanPeersSame <- aggregate(beh_d[beh_d$feedback_bin=="same","delta_r"],list(subID=beh_d[beh_d$feedback_bin == "same","subID"]),mean)

# one-sample t-test to see if participants shifted their preferences for items that were rating the same
t.test(meanPeersSame$x)

#find mean delta_r for Peers Lower trials for each participant
meanPeersLower <- aggregate(beh_d[beh_d$feedback_bin=="lower","delta_r"],list(subID=beh_d[beh_d$feedback_bin == "lower","subID"]),mean)

#paired-sample t-test between delta_r for Peers Same and Peers Lower items
t.test(meanPeersSame$x,meanPeersLower$x,paired=TRUE)

############..................................................................................############

# Same analysis, three days after intevention

fitNC_lmer = lmer(delta_r3 ~ r1_num + feedback_bin + (1 | subID), data=subset(beh_d,REML=F));summary(fitNC_lmer); anova(fitNC_lmer);

##########................................................................................##########

# Plots! (averaged across all participants)

# follow-up (same day)
qplot(data=subset(beh_d), y=delta_r, x=feedback_bin, stat='summary', fun.y='mean', geom='bar')

# three days later
qplot(data=subset(beh_d), y=delta_r3, x=feedback_bin, stat='summary', fun.y='mean', geom='bar')

##########...............................................................................##########

# Done :)
