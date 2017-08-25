Code Book
===========================================================
This code book is to indicate all the variables used in the project, and summeries calculated, along with 
units, and any other relevant information.

Variables
------------------------------------------------------------
-（+*）`test_x`,`test_y`,`train_x`,`train_y`contains the measured data for testing samples and training samples.
-（+*）`test_subject`,`train_subject` contains ID of the test/train subjects. 
-（+*）`mrg_test`, `mrg_train` are the merged data of `test_y`+`test_subject`+`test_x` and 
`train_y`+`train_subject`+`train_x`.
-（+*）`features` are the names of variables of merged data. 
-（+*）`activity_labels` are the types of activities.
-（+*）select
-（+*）`mrg_test_msd`, `mrg_train_msd` are the selected data which only contains measurements
on the means and standard deviations.
-（+*）`all_data` is the combination of all testing and training data
-（+*）`average_data` is the tidy data set with the average of each variable for each activity and each subject.
-（+*）finally, wrote the above data to `average.txt`.
