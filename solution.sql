-- SQL MURDER MYSTERY --

-- 1.  Retrieve Crime Scene Report:
-- Task: Run a query to retrieve the crime scene report for the murder that occurred on Jan.15, 2018, in SQL City. Gather all available details from the report.
SELECT *
FROM crime_scene_report
WHERE date = 20180115 and city = 'SQL City'



-- 2. Witness Personal Details:
-- Task: Check the personal details of witnesses involved in the case. Retrieve their names, addresses, and any other relevant information.
-- Witness 1
SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
-- Morty Schapiro is the 1st witness because he owns the last house with id = 14887

-- Witness 2
SELECT *
FROM person
WHERE name LIKE '%Annabel%' AND address_street_name = 'Franklin Ave'
-- Annabel Miller is the 2nd witness with id = 16371



-- 3. View Witness Interviews:
-- Task: Access the recorded interviews of witnesses conducted after the murder. Gather insights into their statements and potential clues.
SELECT *
FROM interview
WHERE person_id IN (14887, 16371)



-- 4. Check Gym Database:
-- Task: Investigate the gym database using details obtained from the crime scene report and witness interviews. Look for any gym-related information that might be relevant.
-- Clue 1
SELECT *
FROM get_fit_now_member
WHERE id LIKE '48Z%' AND membership_status = 'gold'
-- Clue 2
SELECT *
FROM get_fit_now_check_in
WHERE check_in_date = '20180109'
-- Joe Germuska(id=48Z7A) and Jeremy Bowers(id=48Z55) are two potential persons that can be killers



-- 5. Check Car Details:
-- Task: Examine the car details associated with the crime scene. Retrieve information about the vehicles present during the incident.
SELECT *
FROM drivers_license
WHERE plate_number LIKE '%H42W%'
-- 3 persons having id's 183779, 423327, 664760; id here is license_id not person_id


-- 6. Personal Details:
-- Task: Identify and collect personal details mentioned in the previous query. This includes names, addresses, and any additional details.
SELECT *
FROM person
WHERE license_id IN (183779, 423327, 664760)
-- 3 persons Tushar Chandra, Jeremy Bowers, Maxine Whitely with id's 51739, 67318, 78193 respectively



-- 7. Membership Status at the Gym:
-- Task: Determine who is identified in the previous query as a member of the gym. Utilize the gym database to confirm their membership status.
-- Jeremy Bowers is the person which is common and have the gym membership
SELECT *
FROM get_fit_now_member
WHERE name = 'Jeremy Bowers'
-- YES! he is a gym member with gold membership and have a bag starting from 48Z and having Chevrolet-Spark LS with plate number 0H42W2



-- 8. Analyze and Draw Conclusions:
-- Task: Analyze the collected data, including crime scene reports, witness interviews, gym records, and car details. Draw conclusions or hypotheses based on the information available.
-- So the conclusion is Jeremy Bowers is the KILLER concluded from the gathered information.



-- 9. Document Findings:
-- Task: Document your findings and any insights gained from the SQL investigation. Summarize the key details that lead you to your conclusions.
/*
Jeremy Bowers is found guilty based on following evidences:
1. He is a gym member with gold membership
2. He owns a gym bag 48Z55
3. He have a car Chevrolet-Spark LS with plate number 0H42W2
4. He was presented in gym on 9th of January, 2018
5. He was witnessed by Annabel Miller when he was commiting murder
6. Another witness Morty Schapiro saw plate no. while he flew in his car from the incident
*/


-- 10. Prepare a Report:
-- Task: Prepare a detailed report for the detective, summarizing the events, suspects, and your conclusions. Present the evidence and rationale behind your findings.
/*
On Jan.15, 2018 a murder was commited in SQL City. When security footage was checked by police, they found that there were 2 witnesses named Annabel Miller from Franklin Ave and Morty Schapiro from last house from Northwestern Dr. When police interviewed them, Morty Schapiro told them that he heard the gunfire sounds and saw a man run out with 'Get Fit Now Gym' bag with membership number on the bag started with '48Z' those kind of bag only possesed ny gold members of gym and saw that the man got into a car with a plate that included 'H42W'. Annabel Miller was presented on the crime scene, he saw the murder happen and he recognizes the killer from his gym when he was working out last week on January the 9th. When police gathered the information from gym on 9th Jan 2018 there were 2 suspects that were presented at that time. And there were 3 suspects from the plate number including 'H42W' when police checked the personal information of all 3 from the license number there was one name which was common from the gym. It was 'Jeremy Bowers' and everything matched perfectly and thus police resolved this murder mystery.
*/

