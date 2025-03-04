USE students_mental_health;

#CLEANING DATA
#CHANGE COLUMN NAMES
ALTER TABLE students_mental_health
CHANGE COLUMN `Choose your gender` gender VARCHAR(50),
CHANGE COLUMN `Your current year of Study` year_of_study VARCHAR(50),
CHANGE COLUMN `What is your CGPA?` CGPA VARCHAR(50),
CHANGE COLUMN `Marital status` marital_status VARCHAR(50),
CHANGE COLUMN `Do you have Depression?` Depression VARCHAR(50),
CHANGE COLUMN `Do you have Anxiety?` Anxiety VARCHAR(50),
CHANGE COLUMN `Do you have Panic attack?` Panic_attack VARCHAR(50),
CHANGE COLUMN `Did you seek any specialist for a treatment?` professional_treatment VARCHAR(50);

SHOW COLUMNS FROM students_mental_health;

#REMOVE TEXT FROM INTEGRAL COLUMNS.
UPDATE students_mental_health
SET year_of_study = CAST(REGEXP_REPLACE(year_of_study, '[^0-9]+', '') AS UNSIGNED)
WHERE year_of_study REGEXP '[0-9]';
ALTER TABLE students_mental_health
MODIFY COLUMN year_of_study INT;

#CHECK DATATYPES
DESCRIBE students_mental_health;

#ANALYSIS

#PERCENTAGE OF STUDENTS WITH DEPRESSION
SELECT
    SUM(CASE WHEN Depression = 'yes' THEN 1 ELSE 0 END) / COUNT(*) AS percentage_yes,
    SUM(CASE WHEN Depression = 'no' THEN 1 ELSE 0 END) / COUNT(*) AS percentage_no
FROM
    students_mental_health;
    
#RESULT= YES 35%, NO 65%

#PERCENTAGE OF MEN AND WOMEN WITH DEPRESSION
SELECT
    gender,
    COUNT(*) / (SELECT COUNT(*) FROM students_mental_health WHERE Depression = 'yes') * 100 AS percentage
FROM
    students_mental_health
WHERE
    Depression = 'yes'
GROUP BY
    gender;
    
#RESULT= Female: 82,8% - Male: 17.1%

#Courses with more people with depression
SELECT
    course,
    COUNT(*) AS count
FROM
    students_mental_health
WHERE
    Depression = 'yes'
GROUP BY
    course
ORDER BY
    count DESC;
    
#RESULT: Engineering=7, BIT=5, BCS=5, KOE=2, BENL=2
    
#Average age of people with depression
SELECT
    AVG(Age) AS average_age
FROM
    students_mental_health
WHERE
    Depression = 'yes';
    
#RESULT= 20.2

#Standard deviation of age of people with depression
SELECT
    STDDEV(Age) AS std_dev_age
FROM
    students_mental_health
WHERE
    Depression = 'yes';
    
#RESULT= 2.36

#CGPA percentages of people with depression
SELECT
    CGPA,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM students_mental_health WHERE Depression = 'yes') AS percentage
FROM
    students_mental_health
WHERE
    Depression = 'yes'
GROUP BY
    CGPA
ORDER BY
    CGPA DESC;
#RESULT= 3.00-3.49=54.28%, 3.5-4.0=37%, 2.5-2.9=8.5%


#Years of study with more people with Depression
SELECT
    year_of_study,
    COUNT(*) AS count
FROM
    students_mental_health
WHERE
    Depression = 'yes'
GROUP BY
    year_of_study
ORDER BY
	count DESC;
#RESULT: 1 year=14, 3 year=10, 2 year=10, 4 year=1

#People with depression with professional_treatment
SELECT
    professional_treatment,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM students_mental_health WHERE Depression = 'yes') AS percentage
FROM
    students_mental_health
WHERE
    Depression = 'yes'
GROUP BY
    professional_treatment;
#RESULT: NO=82.8%, YES= 17.14%

##Anxiety

#PERCENTAGE OF STUDENTS WITH ANXIETY
SELECT
    SUM(CASE WHEN Anxiety = 'yes' THEN 1 ELSE 0 END) / COUNT(*) AS percentage_yes,
    SUM(CASE WHEN Anxiety = 'no' THEN 1 ELSE 0 END) / COUNT(*) AS percentage_no
FROM
    students_mental_health;
    
#RESULT= YES 34%, NO 66%

#PERCENTAGE OF MEN AND WOMEN WITH ANXIETY
SELECT
    gender,
    COUNT(*) / (SELECT COUNT(*) FROM students_mental_health WHERE Anxiety = 'yes') * 100 AS percentage
FROM
    students_mental_health
WHERE
    Anxiety = 'yes'
GROUP BY
    gender;
    
#RESULT= Female: 70,58% - Male: 29,41%

#Courses with more people with anxiety
SELECT
    course,
    COUNT(*) AS count
FROM
    students_mental_health
WHERE
    Anxiety = 'yes'
GROUP BY
    course
ORDER BY
    count DESC;
    
#RESULT: BIT=8, BCS=6, Engineering=4, KOE=4, Psichology=2
    
#Average age of people with anxiety
SELECT
    AVG(Age) AS average_age
FROM
    students_mental_health
WHERE
    Anxiety = 'yes';
    
#RESULT= 20.2

#Standard deviation of age of people with anxiety
SELECT
    STDDEV(Age) AS std_dev_age
FROM
    students_mental_health
WHERE
    Anxiety = 'yes';
    
#RESULT= 2.47

#CGPA percentages of people with anxiety
SELECT
    CGPA,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM students_mental_health WHERE Anxiety = 'yes') AS percentage
FROM
    students_mental_health
WHERE
    Anxiety = 'yes'
GROUP BY
    CGPA;
#RESULT= 3.5-4.0=52.9%, 3.00-3.49=44.1%, 2.5-2.9=2.9%


#Years of study with more people with anxiety
SELECT
    year_of_study,
    COUNT(*) AS count
FROM
    students_mental_health
WHERE
    Anxiety = 'yes'
GROUP BY
    year_of_study;
#RESULT: 1 year=14, 2 year=10, 3 year=8, 4 year=2

#People with anxiety with professional_treatment
SELECT
    professional_treatment,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM students_mental_health WHERE Anxiety = 'yes') AS percentage
FROM
    students_mental_health
WHERE
    Anxiety = 'yes'
GROUP BY
    professional_treatment;
#RESULT: NO=91.17%, YES= 8.8%


##Panic attacks

#PERCENTAGE OF STUDENTS WITH PANIC ATTACKS
SELECT
    SUM(CASE WHEN Panic_attack = 'yes' THEN 1 ELSE 0 END) / COUNT(*) AS percentage_yes,
    SUM(CASE WHEN Panic_attack = 'no' THEN 1 ELSE 0 END) / COUNT(*) AS percentage_no
FROM
    students_mental_health;
    
#RESULT= YES 33%, NO 67%

#PERCENTAGE OF MEN AND WOMEN WITH PANIC ATTACKS
SELECT
    gender,
    COUNT(*) / (SELECT COUNT(*) FROM students_mental_health WHERE Panic_attack = 'yes') * 100 AS percentage
FROM
    students_mental_health
WHERE
    Panic_attack = 'yes'
GROUP BY
    gender;
    
#RESULT= Female: 75.7% - Male: 24.2%

#Courses with more people with panic attacks
SELECT
    course,
    COUNT(*) AS count
FROM
    students_mental_health
WHERE
    Panic_attack = 'yes'
GROUP BY
    course
ORDER BY
    count DESC;
    
#RESULT: Engineering=5, BCS=5, BIT=4, KOE=2, Pendidikan Islam=1
    
#Average age of people with panic attacks
SELECT
    AVG(Age) AS average_age
FROM
    students_mental_health
WHERE
    Panic_attack = 'yes';
    
#RESULT= 20.7

#Standard deviation of age of people with panic attacks
SELECT
    STDDEV(Age) AS std_dev_age
FROM
    students_mental_health
WHERE
    Panic_attack = 'yes';
    
#RESULT= 2.56

#CGPA percentages of people with panic attacks
SELECT
    CGPA,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM students_mental_health WHERE Panic_attack = 'yes') AS percentage
FROM
    students_mental_health
WHERE
    Panic_attack = 'yes'
GROUP BY
    CGPA;
#RESULT=  3.5-4.0=57.54%, 3.00-3.49=27.27%, 2.5-2.99=9%, 2.0-2.49=3%, 0-1.99% = 3%


#Years of study with more people with panic attacks
SELECT
    year_of_study,
    COUNT(*) AS count
FROM
    students_mental_health
WHERE
    Panic_attack = 'yes'
GROUP BY
    year_of_study;
#RESULT: 1 year=14, 3 year=10, 2 year=8, 4 year=1

#People with panic attacks with professional_treatment
SELECT
    professional_treatment,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM students_mental_health WHERE Panic_attack = 'yes') AS percentage
FROM
    students_mental_health
WHERE
    Panic_attack = 'yes'
GROUP BY
    professional_treatment;
#RESULT: NO=87.87%, YES= 12.14%

#Count by age of people with depression
SELECT Age, COUNT(*) AS count
FROM students_mental_health
WHERE Depression = 'Yes'
GROUP BY Age
ORDER BY Age ASC;


#Count by age of people with Anxiety
SELECT Age, COUNT(*) AS count
FROM students_mental_health
WHERE Anxiety = 'Yes'
GROUP BY Age
ORDER BY Age ASC;

#Count by age of people with Panic Attacks
SELECT Age, COUNT(*) AS count
FROM students_mental_health
WHERE Panic_Attack = 'Yes'
GROUP BY Age
ORDER BY Age ASC;


#Count of people with depression according to CGPA
SELECT CGPA, COUNT(*) AS count
FROM students_mental_health
WHERE Depression = 'Yes'
GROUP BY CGPA
ORDER BY CGPA ASC;
