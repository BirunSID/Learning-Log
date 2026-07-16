-- Keep a log of any SQL queries you execute as you solve the mystery.

-- Used the first command to find out all the incidents that have happened
-- the crime reports to be specific.
-- cmd001

SELECT *
  FROM crime_scene_reports;

-- I then found a total of 301 rows meaning that there were 301 incident entries.

-- NEW CLUES:      incident date: July 28, 2025 
--           incident street name: Humphrey Street.
-- These 2 informations translates to in sqlite3 query as: 
--                                                          time_day: 28
--                                                        time_month: 7
--                                                         time_year: 2025 
--                                                       thief_street: Humphrey Street
-- I then plugged these filters inside of the previous command `cmd001`

SELECT *     
  FROM crime_scene_reports
 WHERE year = 2025 
   AND month = 7
   AND day = 28 
   AND street = 'Humphrey Street';

-- This command narrowed it down to only 2 entries
/*
+-----+------+-------+-----+-----------------+--------------------------------------------------------------+
| id  | year | month | day |     street      |                         description                          |
+-----+------+-------+-----+-----------------+--------------------------------------------------------------+
| 295*| 2025 | 7     | 28  | Humphrey Street | Theft of the CS50 duck took place at 10:15am at the Humphrey |
|     |      |       |     |                 |  Street bakery. Interviews were conducted today with three w |
|     |      |       |     |                 | itnesses who were present at the time – each of their interv |
|     |      |       |     |                 | iew transcripts mentions the bakery.                         |
+-----+------+-------+-----+-----------------+--------------------------------------------------------------+
| 297 | 2025 | 7     | 28  | Humphrey Street | Littering took place at 16:36. No known witnesses.           |
+-----+------+-------+-----+-----------------+--------------------------------------------------------------+
*/
-- The littering incident can be dismissed as it provides no clue.
-- NEW CLUES:       time of report: 10:15AM
--                  place of theft: Humphrey Street bakery
--                       witnesse count: totalling three(3)
--         witness transcript clue: {place of theft}
--
-- the next viable table to check would be the interviews table. so we shall execute the raw total command first to get all entries here.
-- but upon reading the schemas. I can safely assume that I need the three interviews only from the {place of theft} if i can and the dates if i can or both or either one
-- i shall use the metrics {time_day} and {time_month} and {time_year} to narrow down search results to the exact three interview entries.

SELECT * 
  FROM interviews
 WHERE day = 28
   AND month = 7
   AND year = 2025;

-- There were 7 entries in this particular query result, fromw which, i need only three of them that is related to the {place of theft}
-- I can use the {witness transcript clue} to narrow down interviews here.SO, that makes things easier.
/*
+-----+---------+------+-------+-----+--------------------------------------------------------------+
| id  |  name   | year | month | day |                          transcript                          |
+-----+---------+------+-------+-----+--------------------------------------------------------------+
| 158 | Jose    | 2025 | 7     | 28  | “Ah,” said he, “I forgot that I had not seen you for some we |
|     |         |      |       |     | eks. It is a little souvenir from the King of Bohemia in ret |
|     |         |      |       |     | urn for my assistance in the case of the Irene Adler papers. |
|     |         |      |       |     | ”                                                            |
+-----+---------+------+-------+-----+--------------------------------------------------------------+
| 159 | Eugene  | 2025 | 7     | 28  | “I suppose,” said Holmes, “that when Mr. Windibank came back |
|     |         |      |       |     |  from France he was very annoyed at your having gone to the  |
|     |         |      |       |     | ball.”                                                       |
+-----+---------+------+-------+-----+--------------------------------------------------------------+
| 160 | Barbara | 2025 | 7     | 28  | “You had my note?” he asked with a deep harsh voice and a st |
|     |         |      |       |     | rongly marked German accent. “I told you that I would call.” |
|     |         |      |       |     |  He looked from one to the other of us, as if uncertain whic |
|     |         |      |       |     | h to address.                                                |
+-----+---------+------+-------+-----+--------------------------------------------------------------+
| 161*| Ruth    | 2025 | 7     | 28  | Sometime within ten minutes of the theft, I saw the thief ge |
|     |         |      |       |     | t into a car in the bakery parking lot and drive away. If yo |
|     |         |      |       |     | u have security footage from the bakery parking lot, you mig |
|     |         |      |       |     | ht want to look for cars that left the parking lot in that t |
|     |         |      |       |     | ime frame.                                                   |
+-----+---------+------+-------+-----+--------------------------------------------------------------+
| 162*| Eugene  | 2025 | 7     | 28  | I don't know the thief's name, but it was someone I recogniz |
|     |         |      |       |     | ed. Earlier this morning, before I arrived at Emma's bakery, |
|     |         |      |       |     |  I was walking by the ATM on Leggett Street and saw the thie |
|     |         |      |       |     | f there withdrawing some money.                              |
+-----+---------+------+-------+-----+--------------------------------------------------------------+
| 163*| Raymond | 2025 | 7     | 28  | As the thief was leaving the bakery, they called someone who |
|     |         |      |       |     |  talked to them for less than a minute. In the call, I heard |
|     |         |      |       |     |  the thief say that they were planning to take the earliest  |
|     |         |      |       |     | flight out of Fiftyville tomorrow. The thief then asked the  |
|     |         |      |       |     | person on the other end of the phone to purchase the flight  |
|     |         |      |       |     | ticket.                                                      |
+-----+---------+------+-------+-----+--------------------------------------------------------------+
| 191 | Lily    | 2025 | 7     | 28  | Our neighboring courthouse has a very annoying rooster that  |
|     |         |      |       |     | crows loudly at 6am every day. My sons Robert and Patrick to |
|     |         |      |       |     | ok the rooster to a city far, far away, so it may never both |
|     |         |      |       |     | er us again. My sons have successfully arrived in Paris.     |
+-----+---------+------+-------+-----+--------------------------------------------------------------+
*/
-- 158Jose, 159Eugene, 160Barbara, 191Lily can be easily ruled out

-- NEW CLUES: 161Ruth
--                    Ruth recognized: False
--                 update on incident:{time of report}: = time of theft
--        Within ten minutes of theft: (10:15 ---> 10:25) = RUTH theft time frame
-- NEW suspect list: RUTH (intelligent enough to tell the cops to check the sec. footage from the parking lot, REASONING: deception probably.)
--                   vehicle(car): cars that left within {RUTH theft time frame}
--   RUTH theft time frame_action: THIEF GETS IN CAR IN BAKERY PARKING LOT AND DRIVES AWAY
--   RUTH theft time frame_action_activity: exit/leave/drive_away(depends on whether or not the activity is explicitly logged or not)

-- NEW CLUES: 162Eugene
--                     Eugene recognized: TRUE
--    time of 2nd last monitor by Eugene: earlier in the morning
--   place of 2nd last monitor by Eugene: Emma's bakery
--      thief position On Eugene monitor: ATM on Leggett Street
--        thief action On Eugene monitor: withdrawing some money at {thief position On Eugene monitor}

-- NEW CLUES: 163Raymond
--                      Raymond recognized: False
--                      thief action On Raymond monitor_CALL: called someone who talked to them
--                      thief action On Raymond monitor_CALL_DURATION: duration of {thief action On Raymond monitor_CALL} = less than a minute
--                      thief action On Raymond monitor_plan: planning to take the earliest flight out of Fiftyville on action {thief action On Raymond monitor_CALL}
--                      thief action On Raymond monitor_plan_time: tomorrow on action {thief action On Raymond monitor_plan}
--                      thief action On Raymond monitor_ASK: purchase the flight ticket for action {thief action On Raymond monitor_plan}
--                      vechicle(plane): status is TRUE, but no other details to confirm here.


-- got a lot of clues. an astronomical amount of clues.


-- {suspect list}: {RUTH}, none else.
-- Now im going to first use the {161Ruth} clues to see what I can find
-- So, we need {vehicle(car)} information which could be found in the table bakery_security_logs and people too.
-- i have to make use of the clues 
--                               {time of report}
--                                              time_hour (from {time of report} = 10)
--                                              time_minute (from {time of report} & {RUTH theft time frame} = 15 to 25)
--                                              {RUTH theft time frame_action}
--                               {RUTH theft time frame}
--                               {time_day}
--                               {time_month}
--                               {time_year}
-- INSPECTING schemas reveal that i can use the filters and get these vital infos from only {bakery_security_logs} and {people}
-- such as (from {bakery_security_logs}):
--                         activity
--                         license_plate
-- such as (from {people}):
--                         name
--                         phone_number
--                         passport_number
--                         license_plate
-- NO MORE tables can be used as ruth information bottlenecked at these two as per my informations gathered.
-- Checking all the infos from {bakery_security_logs}
-- realized that i can use the following to narrow down search results and filer by {RUTH theft time frame}
--                         time_year
--                         time_month
--                         time_day
--                         time_hour
--                         time_minute
--                         {RUTH theft time frame_action_activity}

SELECT id, license_plate
  FROM bakery_security_logs
 WHERE year = 2025
   AND month = 7
   AND day = 28
   AND hour = 10
   AND minute BETWEEN 15 AND 25 
   AND activity = 'exit';

-- Only took the license plate and id number and nothing else because everything else is just useless information.
/*
+-----+---------------+
| id  | license_plate |
+-----+---------------+
| 260 | 5P2BI95       |
| 261 | 94KL13X       |
| 262 | 6P58WS2       |
| 263 | 4328GD8       |
| 264 | G412CB7       |
| 265 | L93JTIZ       |
| 266 | 322W7JE       |
| 267 | 0NTHK55       |
+-----+---------------+
*/
-- to turn the license_plate to useful information. we have to use it on people table and join them somehow
-- we will use the same command with some changes and join on license plate number cause it is same across the two tables.
-- licensed+people query

SELECT p.id, p.name, p.phone_number, p.passport_number, p.license_plate
  FROM people AS p
  join bakery_security_logs AS b
    ON p.license_plate = b.license_plate
 WHERE year = 2025
   AND month = 7
   AND day = 28
   AND hour = 10
   AND minute BETWEEN 15 AND 25 
   AND activity = 'exit';

--  Found a lot of potential suspects.
/*
+--------+---------+----------------+-----------------+---------------+
|   id   |  name   |  phone_number  | passport_number | license_plate |
+--------+---------+----------------+-----------------+---------------+
| 221103 | Vanessa | (725) 555-4692 | 2963008352      | 5P2BI95       |
| 686048 | Bruce   | (367) 555-5533 | 5773159633      | 94KL13X       |
| 243696 | Barry   | (301) 555-4174 | 7526138472      | 6P58WS2       |
| 467400 | Luca    | (389) 555-5198 | 8496433585      | 4328GD8       |
| 398010 | Sofia   | (130) 555-0289 | 1695452385      | G412CB7       |
| 396669 | Iman    | (829) 555-5269 | 7049073643      | L93JTIZ       |
| 514354 | Diana   | (770) 555-1861 | 3592750733      | 322W7JE       |
| 560886 | Kelsey  | (499) 555-9472 | 8294398571      | 0NTHK55       |
+--------+---------+----------------+-----------------+---------------+
*/
-- {suspect list}: yeah. {RUTH} is clear.
-- {suspect list}: {}
-- now, As we can see from the table, 8 person are suspects here.
-- {suspect list}: {221103Vanessa}, {686048Bruce}, {243696Barry}, {467400Luca}, {398010Sofia}, {396669Iman}, {514354Diana}, {560886Kelsey}




-- Now im going to first use the {162Eugene} clues to see what I can find
-- I have to make use of the clues:
--                                 {thief position On Eugene monitor}
--                                 {thief action On Eugene monitor}
-- tables that i can use here in conjunction to the clues are bank_accounts, atm_transactions and {people} again
-- INSPECTING schemas reveal that i can use the filters and get these vital infos and of course. we have to keep our search results within only these 8 suspects for now.
-- {people}
--          id
--          name
--          phone_number
--          passport_number
--          license_plate
-- {atm_transactions}
--          id
--          account_number
--          atm_location
--          transaction_type
--          amount
-- {bank_accounts}
--          person_id
--          account_number
--          creation_year

-- Need to cross match results from the previous 8 suspects with every other table here.
-- but before that. i shall execute some commands to check if the results of this id and person_id are the same across these three above mentioned table or not.

  SELECT *    
    FROM bank_accounts
ORDER BY person_id; 
-- checked bank account id

  SELECT * 
    FROM people
ORDER BY id;

-- yes. people seems to be in order with bank accounts. last table to go . atm transactions.

  SELECT *             
    FROM atm_transactions
ORDER BY id 
   LIMIT 100;

-- This id is not the same as the other 2 and rather, the bank account is the same with bank accounts table. Interesting.
-- This query is going to be insanely big and sophisticated. but before that. i have to explain it.
/*
The vehicle that exited from 10:15 to 10:25 can be queried out with the {licensed+people query}. 
This gives us 8 person who are probable suspects
Now, we take the {licensed+people query} and then we join bank_accounts table too using the person_id and {people} table's id.  so we get the bank accounts too now. lets do this one first.
*/
-- bank_account_query

SELECT p.id, p.name, ba.account_number, ba.creation_year
  FROM people AS p
  join bakery_security_logs AS b
    ON p.license_plate = b.license_plate
  join bank_accounts AS ba
    ON ba.person_id = p.id
 WHERE year = 2025
   AND month = 7
   AND day = 28
   AND hour = 10
   AND minute BETWEEN 15 AND 25 
   AND activity = 'exit';

-- results are good. 3 people dont even have bank accounts. So, they can be ruled out. 
/*
+--------+-------+----------------+---------------+
|   id   | name  | account_number | creation_year |
+--------+-------+----------------+---------------+
| 686048 | Bruce | 49610011       | 2010          |
| 514354 | Diana | 26013199       | 2012          |
| 396669 | Iman  | 25506511       | 2014          |
| 467400 | Luca  | 28500762       | 2014          |
| 243696 | Barry | 56171033       | 2018          |
+--------+-------+----------------+---------------+
*/
-- {suspect list} MINUS: {221103Vanessa}, {398010Sofia}, {560886Kelsey} are ruled out
-- {suspect list} UPDATE: {686048Bruce}, {514354Diana}, {396669Iman}, {467400Luca}, {243696Barry} remains.
-- 5 people are suspects.

/*
okay. we go the {bank_account_query} too and since {bank_accounts} table's account number is the same as {atm_transactions} table's account_number. we join these on it. and now we have 2 more vital piece of information, {thief position On Eugene monitor} which is the atm_location column of the {atm_transactions} table and {thief action On Eugene monitor} which is the transaction_type in {atm_transactions} table. Now we can make the ultimate query.
*/

-- Before running the main query, we need to inspect the atm_transactions table to see if my deductions on atm_transaction table's  atm_location and transaction_type are even correct or not.

SELECT *                            
   ...> FROM atm_transactions
   ...> LIMIT 100;

-- Okay. My suspicions are correct. lets do this query now.

-- atm_query.
SELECT p.id, p.name, ba.account_number
  FROM people AS p
  join bakery_security_logs AS b
    ON p.license_plate = b.license_plate
  join bank_accounts AS ba
    ON ba.person_id = p.id
  join atm_transactions AS atm
    ON atm.account_number = ba.account_number
 WHERE b.year = 2025
   AND b.month = 7
   AND b.day = 28
   AND b.hour = 10
   AND b.minute BETWEEN 15 AND 25 
   AND b.activity = 'exit'
   AND atm.year = 2025
   AND atm.month = 7
   AND atm.day = 28
   AND atm.atm_location = 'Leggett Street'
   AND atm.transaction_type = 'withdraw';

/*
+--------+-------+----------------+
|   id   | name  | account_number |
+--------+-------+----------------+
| 686048 | Bruce | 49610011       |
| 514354 | Diana | 26013199       |
| 396669 | Iman  | 25506511       |
| 467400 | Luca  | 28500762       |
+--------+-------+----------------+
*/

-- {suspect list} MINUS: {243696Barry}
-- {suspect list} UPDATE: {686048Bruce}, {514354Diana}, {396669Iman}, {467400Luca} remains





-- We are out of luck with RUTH and eugene. and so we have to use Raymond clues now.
-- Now im going to first use the {163Raymond} clues to see what I can find
-- {163Raymond} clues to use:
--                          {thief action On Raymond monitor_CALL}
--                          {thief action On Raymond monitor_CALL_DURATION}
--                          {thief action On Raymond monitor_plan}
--                          {thief action On Raymond monitor_plan_time}
--                          {thief action On Raymond monitor_ASK}
--                          {vechicle(plane)}
-- The tables that i can use here are: airports, flights, passengers, phone_calls and the {atm_query}
-- {airports}
--           id
--           abbreviation
--           full_name
--           city
-- {flights}
--           id
--           origin_airport_id
--           destination_airport_id
--           year
--           month
--           day
--           hour
--           minute
-- {phone_calls}
--           id
--           caller
--           receiver
--           year
--           month
--           day
--           duration
--
-- First of all, we need to use the {phone_calls} table on the suspects and narrow down it more.
-- only the caller of the {phone_calls} table can be matched with the {people} table's {phone_number}
-- the duration is in seconds so, 1 minute = 120 seconds. and so we have to find queries that are less than 120 seconds.
-- phone_call_query_by_duration

SELECT p.id, p.name, pc.caller, pc.receiver, pc.duration
  FROM people AS p

  join bakery_security_logs AS b
    ON p.license_plate = b.license_plate

  join bank_accounts AS ba
    ON ba.person_id = p.id

  join atm_transactions AS atm
    ON atm.account_number = ba.account_number

  join phone_calls  AS pc
    ON pc.caller = p.phone_number

 WHERE b.year = 2025
   AND b.month = 7
   AND b.day = 28
   AND b.hour = 10
   AND b.minute BETWEEN 15 AND 25 
   AND b.activity = 'exit'
   AND atm.year = 2025
   AND atm.month = 7
   AND atm.day = 28
   AND atm.atm_location = 'Leggett Street'
   AND atm.transaction_type = 'withdraw'
   AND pc.duration < 60;

-- great results, we now have a good table of callers who called for a duration of less than a minute.
/*
+--------+-------+----------------+----------------+----------+
|   id   | name  |     caller     |    receiver    | duration |
+--------+-------+----------------+----------------+----------+
| 686048 | Bruce | (367) 555-5533 | (375) 555-8161 | 45       |
| 686048 | Bruce | (367) 555-5533 | (455) 555-5315 | 31       |
| 514354 | Diana | (770) 555-1861 | (725) 555-3243 | 49       |
+--------+-------+----------------+----------------+----------+
*/
-- voila! we now have only 2 subjects remaining.

-- {suspect list} MINUS: {396669Iman}, {467400Luca} ruled out.
-- {suspect list} UPDATE: {686048Bruce}, {514354Diana} remains

-- both of them cannot be criminal here as they called totally different people. but we did not narrow the search by date yet. we need to do that.

-- phone_call_query_by_duration_&_date

SELECT p.id, p.name, pc.caller, pc.receiver, pc.duration
  FROM people AS p

  join bakery_security_logs AS b
    ON p.license_plate = b.license_plate

  join bank_accounts AS ba
    ON ba.person_id = p.id

  join atm_transactions AS atm
    ON atm.account_number = ba.account_number

  join phone_calls  AS pc
    ON pc.caller = p.phone_number

 WHERE b.year = 2025
   AND b.month = 7
   AND b.day = 28
   AND b.hour = 10
   AND b.minute BETWEEN 15 AND 25 
   AND b.activity = 'exit'

   AND atm.year = 2025
   AND atm.month = 7
   AND atm.day = 28
   AND atm.atm_location = 'Leggett Street'
   AND atm.transaction_type = 'withdraw'

   AND pc.duration < 60
   AND pc.year = 2025
   AND pc.month = 7
   AND pc.day = 28;

-- results narrowed down by a lot again. because the receiver of the calls decreased.
/*
+--------+-------+----------------+----------------+----------+
|   id   | name  |     caller     |    receiver    | duration |
+--------+-------+----------------+----------------+----------+
| 686048 | Bruce | (367) 555-5533 | (375) 555-8161 | 45       |
| 514354 | Diana | (770) 555-1861 | (725) 555-3243 | 49       |
+--------+-------+----------------+----------------+----------+
*/

-- Now we have to find the receiver of these calls and gather information of what they will be doing tomorrow. and then we can instantly get both results of who the thief is and who their accomplice is.

-- this is easy becaue we only need the callers phone number and ping the {people} table again to see who these 2 receivers are and we can check their flight stuffs and easily figure it out where these 2 are going on 29th of july

-- NEW CLUE: 
--         flight_time: 29th of july 2025

-- people_query_by_(phone_call_query_by_duration_&_date)

SELECT *
FROM people
WHERE phone_number IN (
                      
                      SELECT pc.receiver
                        FROM people AS p
                      
                        join bakery_security_logs AS b
                          ON p.license_plate = b.license_plate
                      
                        join bank_accounts AS ba
                          ON ba.person_id = p.id
                      
                        join atm_transactions AS atm
                          ON atm.account_number = ba.account_number
                      
                        join phone_calls  AS pc
                          ON pc.caller = p.phone_number
                      
                       WHERE b.year = 2025
                         AND b.month = 7
                         AND b.day = 28
                         AND b.hour = 10
                         AND b.minute BETWEEN 15 AND 25 
                         AND b.activity = 'exit'
                      
                         AND atm.year = 2025
                         AND atm.month = 7
                         AND atm.day = 28
                         AND atm.atm_location = 'Leggett Street'
                         AND atm.transaction_type = 'withdraw'
                      
                         AND pc.duration < 60
                         AND pc.year = 2025
                         AND pc.month = 7
                         AND pc.day = 28
                      );

-- and bingo!
/*
+--------+--------+----------------+-----------------+---------------+
|   id   |  name  |  phone_number  | passport_number | license_plate |
+--------+--------+----------------+-----------------+---------------+
| 847116 | Philip | (725) 555-3243 | 3391710505      | GW362R6       |
| 864400 | Robin  | (375) 555-8161 |                 | 4V16VO0       |
+--------+--------+----------------+-----------------+---------------+
*/



---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


/*
i made a massive mistake and accidently got innocent people caught here. robin's the main culprit here. My main mistake was to identify her as a non-accomplice . that was a mistake. you dont need passport number to get someone else a flith ticket. it was robin because of the flights log showing that the thief would book the earliest flight. and so diana is innocent because she takes the evening flight as we found below using those queries. now we have to change every metric to bruce and robin.
*/


SELECT *     
  FROM crime_scene_reports
 WHERE year = 2025 
   AND month = 7
   AND day = 28 
   AND street = 'Humphrey Street'
   AND (description LIKE '%theft%' 
   OR description LIKE '%duck%');
/*INCIDENT REPORT
+-----+------+-------+-----+-----------------+--------------------------------------------------------------+
| id  | year | month | day |     street      |                         description                          |
+-----+------+-------+-----+-----------------+--------------------------------------------------------------+
| 295 | 2025 | 7     | 28  | Humphrey Street | Theft of the CS50 duck took place at 10:15am at the Humphrey |
|     |      |       |     |                 |  Street bakery. Interviews were conducted today with three w |
|     |      |       |     |                 | itnesses who were present at the time ΓÇô each of their interv |
|     |      |       |     |                 | iew transcripts mentions the bakery.                         |
+-----+------+-------+-----+-----------------+--------------------------------------------------------------+
*/

SELECT * 
  FROM interviews
 WHERE day = 28
   AND month = 7
   AND year = 2025
   AND (transcript LIKE '%theft%'
   OR transcript LIKE '%thief%');
/*INCIDENT INTERVIEWS, CLUES GATHERED AND SUSPECT IDENTIFIED to be "Bruce"
+-----+---------+------+-------+-----+--------------------------------------------------------------+
| id  |  name   | year | month | day |                          transcript                          |
+-----+---------+------+-------+-----+--------------------------------------------------------------+
| 161 | Ruth    | 2025 | 7     | 28  | Sometime within ten minutes of the theft, I saw the thief ge |
|     |         |      |       |     | t into a car in the bakery parking lot and drive away. If yo |
|     |         |      |       |     | u have security footage from the bakery parking lot, you mig |
|     |         |      |       |     | ht want to look for cars that left the parking lot in that t |
|     |         |      |       |     | ime frame.                                                   |
+-----+---------+------+-------+-----+--------------------------------------------------------------+
| 162 | Eugene  | 2025 | 7     | 28  | I don't know the thief's name, but it was someone I recogniz |
|     |         |      |       |     | ed. Earlier this morning, before I arrived at Emma's bakery, |
|     |         |      |       |     |  I was walking by the ATM on Leggett Street and saw the thie |
|     |         |      |       |     | f there withdrawing some money.                              |
+-----+---------+------+-------+-----+--------------------------------------------------------------+
| 163 | Raymond | 2025 | 7     | 28  | As the thief was leaving the bakery, they called someone who |
|     |         |      |       |     |  talked to them for less than a minute. In the call, I heard |
|     |         |      |       |     |  the thief say that they were planning to take the earliest  |
|     |         |      |       |     | flight out of Fiftyville tomorrow. The thief then asked the  |
|     |         |      |       |     | person on the other end of the phone to purchase the flight  |
|     |         |      |       |     | ticket.                                                      |
+-----+---------+------+-------+-----+--------------------------------------------------------------+
*/

SELECT *
  FROM people
  WHERE name = 'Bruce';
/*Bruce INFORMATIONS FROM 'people' TABLE.
+--------+-------+----------------+-----------------+---------------+
|   id   | name  |  phone_number  | passport_number | license_plate |
+--------+-------+----------------+-----------------+---------------+
| 686048 | Bruce | (367) 555-5533 | 5773159633      | 94KL13X       |
+--------+-------+----------------+-----------------+---------------+
*/

SELECT *
  FROM bank_accounts as ba1
  JOIN people AS p1
  ON p1.id = ba1.person_id
 WHERE ba1.person_id = '686048';
/*Bruce BANK ACCOUNT INFORMATIONS FROM 'bank_accounts' TABLE.
+----------------+-----------+---------------+--------+-------+----------------+-----------------+---------------+
| account_number | person_id | creation_year |   id   | name  |  phone_number  | passport_number | license_plate |
+----------------+-----------+---------------+--------+-------+----------------+-----------------+---------------+
| 49610011       | 686048    | 2010          | 686048 | Bruce | (367) 555-5533 | 5773159633      | 94KL13X       |
+----------------+-----------+---------------+--------+-------+----------------+-----------------+---------------+
*/

SELECT *
  FROM atm_transactions as at1
 WHERE at1.account_number = '49610011';
/*Bruce ATM TRANSACTIONS LOG FROM 'atm_transactions' TABLE.
+-----+----------------+------+-------+-----+----------------+------------------+--------+
| id  | account_number | year | month | day |  atm_location  | transaction_type | amount |
+-----+----------------+------+-------+-----+----------------+------------------+--------+
| 39  | 49610011       | 2025 | 7     | 26  | Leggett Street | withdraw         | 10     |
| 267 | 49610011       | 2025 | 7     | 28  | Leggett Street | withdraw         | 50     |
+-----+----------------+------+-------+-----+----------------+------------------+--------+
*/

SELECT p1.name, bk1.id, bk1.year, bk1.month, bk1.day, bk1.hour, bk1.minute, bk1.activity, bk1.license_plate 
  FROM bakery_security_logs as bk1
  JOIN people AS p1
  ON p1.license_plate = bk1.license_plate
 WHERE bk1.license_plate = '94KL13X';
/*Bruce PARKING AND LEAVE LOG FROM THE SECURITY SURVEILLANCE.
+-------+-----+------+-------+-----+------+--------+----------+---------------+
| name  | id  | year | month | day | hour | minute | activity | license_plate |
+-------+-----+------+-------+-----+------+--------+----------+---------------+
| Bruce | 232 | 2025 | 7     | 28  | 8    | 23     | entrance | 94KL13X       |
| Bruce | 261 | 2025 | 7     | 28  | 10   | 18     | exit     | 94KL13X       |
+-------+-----+------+-------+-----+------+--------+----------+---------------+
*/

SELECT p1.name AS 'Caller_name', pc.caller AS 'Caller_phoneNumber', p2.name AS 'Receiver_name', pc.receiver AS 'receiver_phoneNumber', pc.year, pc.month, pc.day, pc.duration AS 'Time_seconds'
  FROM phone_calls AS pc
  JOIN people AS p1
  ON pc.caller = p1.phone_number
  JOIN people AS p2
  ON pc.receiver = p2.phone_number
 WHERE caller = '(367) 555-5533';
/*Bruce CALL LOG WITH EXPLICIT NAME AND RECEIVER CALL INFORMATIONS.
+-------------+--------------------+---------------+----------------------+------+-------+-----+--------------+
| Caller_name | Caller_phoneNumber | Receiver_name | receiver_phoneNumber | year | month | day | Time_seconds |
+-------------+--------------------+---------------+----------------------+------+-------+-----+--------------+
| Bruce       | (367) 555-5533     | Pamela        | (113) 555-7544       | 2025 | 7     | 25  | 469          |
| Bruce       | (367) 555-5533     | Joseph        | (238) 555-5554       | 2025 | 7     | 26  | 84           |
| Bruce       | (367) 555-5533     | Tyler         | (660) 555-3095       | 2025 | 7     | 26  | 399          |
| Bruce       | (367) 555-5533     | Thomas        | (286) 555-0131       | 2025 | 7     | 26  | 444          |
| Bruce       | (367) 555-5533     | Robin         | (375) 555-8161       | 2025 | 7     | 28  | 45           |
| Bruce       | (367) 555-5533     | Deborah       | (344) 555-9601       | 2025 | 7     | 28  | 120          |
| Bruce       | (367) 555-5533     | Gregory       | (022) 555-4052       | 2025 | 7     | 28  | 241          |
| Bruce       | (367) 555-5533     | Carl          | (704) 555-5790       | 2025 | 7     | 28  | 75           |
| Bruce       | (367) 555-5533     | Charlotte     | (455) 555-5315       | 2025 | 7     | 30  | 31           |
| Bruce       | (367) 555-5533     | Karen         | (841) 555-3728       | 2025 | 7     | 30  | 511          |
| Bruce       | (367) 555-5533     | Bryan         | (696) 555-9195       | 2025 | 7     | 31  | 261          |
+-------------+--------------------+---------------+----------------------+------+-------+-----+--------------+
*/

SELECT p1.name AS 'Caller_name', pc.caller AS 'Caller_phoneNumber', p2.name AS 'Receiver_name', pc.receiver AS 'receiver_phoneNumber', pc.year, pc.month, pc.day, pc.duration AS 'Time_seconds'
  FROM phone_calls AS pc
  JOIN people AS p1
    ON pc.caller = p1.phone_number
  JOIN people AS p2
    ON pc.receiver = p2.phone_number
 WHERE caller = '(375) 555-8161';
/*ACCOMPLICE RULED TO BE "Robin".
Robin CALL LOG WITH EXPLICIT NAME AND RECEIVER CALL INFORMATIONS
+-------------+--------------------+---------------+----------------------+------+-------+-----+--------------+
| Caller_name | Caller_phoneNumber | Receiver_name | receiver_phoneNumber | year | month | day | Time_seconds |
+-------------+--------------------+---------------+----------------------+------+-------+-----+--------------+
| Robin       | (375) 555-8161     | Jonathan      | (211) 555-3762       | 2025 | 7     | 26  | 57           |
| Robin       | (375) 555-8161     | Alexander     | (801) 555-9266       | 2025 | 7     | 29  | 419          |
| Robin       | (375) 555-8161     | Beverly       | (342) 555-9260       | 2025 | 7     | 29  | 454          |
+-------------+--------------------+---------------+----------------------+------+-------+-----+--------------+
*/

    SELECT *
      FROM people
WHERE name = 'Robin';
/*Robin INFORMATIONS FROM 'people' TABLE.
+--------+-------+----------------+-----------------+---------------+
|   id   | name  |  phone_number  | passport_number | license_plate |
+--------+-------+----------------+-----------------+---------------+
| 864400 | Robin | (375) 555-8161 |                 | 4V16VO0       |
+--------+-------+----------------+-----------------+---------------+
*/

SELECT *
  FROM bank_accounts as ba1
  JOIN people AS p1
    ON p1.id = ba1.person_id
 WHERE ba1.person_id = '864400';
/*Robin BANK ACCOUNT INFORMATIONS FROM 'bank_accounts' TABLE.
+----------------+-----------+---------------+--------+-------+----------------+-----------------+---------------+
| account_number | person_id | creation_year |   id   | name  |  phone_number  | passport_number | license_plate |
+----------------+-----------+---------------+--------+-------+----------------+-----------------+---------------+
| 94751264       | 864400    | 2019          | 864400 | Robin | (375) 555-8161 |                 | 4V16VO0       |
+----------------+-----------+---------------+--------+-------+----------------+-----------------+---------------+
*/

SELECT *
  FROM atm_transactions as at1
 WHERE at1.account_number = '94751264';
/*Robin ATM TRANSACTIONS LOG FROM 'atm_transactions' TABLE.
+------+----------------+------+-------+-----+----------------------+------------------+--------+
|  id  | account_number | year | month | day |     atm_location     | transaction_type | amount |
+------+----------------+------+-------+-----+----------------------+------------------+--------+
| 104  | 94751264       | 2025 | 7     | 26  | Daboin Sanchez Drive | withdraw         | 25     |
| 242  | 94751264       | 2025 | 7     | 27  | Carvalho Road        | deposit          | 55     |
| 417  | 94751264       | 2025 | 7     | 29  | Blumberg Boulevard   | deposit          | 90     |
| 585  | 94751264       | 2025 | 7     | 30  | Daboin Sanchez Drive | deposit          | 10     |
| 652  | 94751264       | 2025 | 7     | 30  | Leggett Street       | withdraw         | 10     |
| 671  | 94751264       | 2025 | 7     | 30  | Humphrey Lane        | deposit          | 15     |
| 822  | 94751264       | 2025 | 7     | 31  | Carvalho Road        | deposit          | 100    |
| 901  | 94751264       | 2025 | 7     | 31  | Carvalho Road        | withdraw         | 35     |
| 1103 | 94751264       | 2025 | 8     | 1   | Daboin Sanchez Drive | deposit          | 40     |
| 1121 | 94751264       | 2025 | 8     | 1   | Blumberg Boulevard   | withdraw         | 5      |
| 1229 | 94751264       | 2025 | 8     | 1   | Humphrey Lane        | withdraw         | 40     |
+------+----------------+------+-------+-----+----------------------+------------------+--------+
*/

SELECT p1.name, bk1.id, bk1.year, bk1.month, bk1.day, bk1.hour, bk1.minute, bk1.activity, bk1.license_plate 
  FROM bakery_security_logs as bk1
  JOIN people AS p1
    ON p1.license_plate = bk1.license_plate
 WHERE bk1.license_plate = '4V16VO0';
/*Robin PARKING AND LEAVE LOG FROM THE SECURITY SURVEILLANCE.
+-------+-----+------+-------+-----+------+--------+----------+---------------+
| name  | id  | year | month | day | hour | minute | activity | license_plate |
+-------+-----+------+-------+-----+------+--------+----------+---------------+
| Robin | 248 | 2025 | 7     | 28  | 8    | 50     | entrance | 4V16VO0       |
| Robin | 249 | 2025 | 7     | 28  | 8    | 50     | exit     | 4V16VO0       |
+-------+-----+------+-------+-----+------+--------+----------+---------------+
*/

---  Robin FLIGHT FIGURE OUT PART
SELECT *
  FROM passengers AS ps
 WHERE passport_number = ''
/*WHAT FLIGHTS DID Robin TAKE?
NO RESULTS
*/
---  Bruce FLIGHT FIGURE OUT PART
SELECT *
  FROM passengers AS ps
 WHERE passport_number = '5773159633'
/*WHAT FLIGHTS DID Bruce TAKE?
+-----------+-----------------+------+
| flight_id | passport_number | seat |
+-----------+-----------------+------+
| 36        | 5773159633      | 4A   |
+-----------+-----------------+------+
*/
-- FLIGHT CONCLUSION: THEY DID NOT TRAVEL TOGETHER. They went on separate paths. LETS ANALYSE Bruce ONLY FOR NOW
------------------------------------------------- LETS ANALYSE Bruce ONLY FOR NOW

SELECT ppl1.name, p1.passport_number, fl1.id, a1.full_name AS ORIGIN_AIRPORT, a1.city, a2.full_name AS DESTINATION_AIRPORT, a2.city, fl1.year, fl1.month, fl1.day, fl1.hour, fl1.minute
  FROM flights as fl1
  JOIN airports as a1
    ON a1.id = fl1.origin_airport_id
  JOIN airports as a2
    ON a2.id = fl1.destination_airport_id
  JOIN passengers as p1
    ON p1.flight_id = fl1.id 
  JOIN people as ppl1
    ON ppl1.passport_number = p1.passport_number  
  WHERE fl1.id IN (
              SELECT flight_id
                FROM passengers AS ps
               WHERE passport_number = '5773159633')
    AND ppl1.passport_number = '5773159633'
    AND fl1.year = '2025'
    AND fl1.month = '7'
    AND fl1.day = '29'
ORDER BY fl1.day, fl1.hour, fl1.minute;
/*Bruce EXPLICIT FLIGHT INFORMATIONS AND THE AFFILIATED AIRPORT IDs ORDERED BY EXPLICIT SEQUENTIAL TIME.
+-------+-----------------+----+-----------------------------+------------+---------------------+---------------+------+-------+-----+------+--------+
| name  | passport_number | id |       ORIGIN_AIRPORT        |    city    | DESTINATION_AIRPORT |     city      | year | month | day | hour | minute |
+-------+-----------------+----+-----------------------------+------------+---------------------+---------------+------+-------+-----+------+--------+
| Bruce | 5773159633      | 36 | Fiftyville Regional Airport | Fiftyville | LaGuardia Airport   | New York City | 2025 | 7     | 29  | 8    | 20     |
+-------+-----------------+----+-----------------------------+------------+---------------------+---------------+------+-------+-----+------+--------+
*/

/*
July 28, 2025, started as a perfectly good, sunny day, but the weather wouldn't look that good in just a short while because the CS50 duck was stolen from the Humphrey Street Bakery at exactly 10:15 AM. Three crucial witnesses were present at the scene—Ruth, Eugene, and Raymond—and I immediately began extracting their clues, starting with Ruth, who gave me the pointers to the security footage where I could review the logs of many vehicles. One of those vehicles belonged to a suspect named Bruce, sporting the license plate '94KL13X', and the security logs explicitly showed he left the bakery parking lot at 10:18 AM, meaning he escaped just 3 minutes after the theft took place. Next, I followed up on Eugene's testimony, which stated that the thief was seen on Leggett Street withdrawing money from the ATM, so I dove into the database, linked Bruce's person ID to his bank account number '49610011', and plugged it into the ATM transaction history where I uncovered exactly two entries: one was two days before the crime on the 26th of July when he withdrew 10 dollars, and the last was on the very morning of the theft when he withdrew 50 dollars, which perfectly locked him in as a prime suspect. Then came Raymond's testimony, and as per his words, the thief made a phone call right when leaving the bakery, telling the person on the other end that he planned on taking the earliest flight out of the city the next morning and asking them to purchase the ticket. I immediately went and checked his call logs, discovering that on the day of the incident, he placed a 45-second call to a number belonging to Robin, making Robin the accomplice on the other end of the line. The fact that Robin lacked a passport number in the database initially looked like an anomaly, but it makes total sense: Robin didn't need a passport just to act as the ticket buyer from the ground while staying behind in Fiftyville. The final piece of the puzzle lay in the flight logs; by ordering all outbound flights from Fiftyville Regional Airport chronologically for the next morning, July 29, I discovered the absolute earliest flight departed at 8:20 AM. Checking the passenger manifest for that specific flight completely trapped Bruce by his passport number, confirming he successfully escaped Fiftyville alone, flying directly to New York City while Robin remained behind.
*/