CREATE DATABASE IF NOT EXISTS `dog_breed_login` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dog_breed_login`;

CREATE TABLE IF NOT EXISTS `dog_details` (
	`id` varchar(255) NOT NULL,
  	`name` varchar(255) NOT NULL,
  	`behavior` varchar(255) NOT NULL,
  	`height` varchar(255) NOT NULL,
    `weight` varchar(255) NOT NULL,
	`life_expectancy` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('afghan_bound', 'Afghan Bound', 'Comic, Distant, Dignified, Independent, Merry', 'Female: 60–69 cm, Male: 68–74 cm', 'Female: 26–34 kg, Male: 26–34 kg', '12 – 14 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('african_hunting_dog', 'African Hunting Dog','Wild, Carnivorous', 'Female: 92 cm, Male: 92 cm', 'Female: 22 kg Male: 22 kg','up to 17 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('airedale', 'Airedale', 'Smart, Alert, Extroverted, Friendly, Confident, Brave', 'Female: 56–59 cm, Male: 58–61 cm', 'Female: 18–20 kg, Male: 23–29 kg', '10 – 12 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('australian_terrier', 'Australian Terrier', 'Alert, Balanced, Loyal, Spirited, Sociable, Brave', 'Female: 23–28 cm, Male: 23–28 cm', 'Female: 5.4–6.4 kg, Male: 6.4–7.3 kg', '12 – 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('basenji', 'Basenji', 'Affectionate, Intelligent, Energetic, Curious, Alert, Playful', 'Female: 38–41 cm, Male: 41–43 cm', 'Female: 9–11 kg, Male: 10–12 kg', '12 – 16  years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('beagle', 'Beagle','Friendly, Intelligent, Impatient, Balanced, Determined, Gentle', 'Female: 33–38 cm, Male: 36–41 cm', 'Female: 9–10 kg, Male: 10–11 kg', '12 - 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('bedlington_terrier', 'Bedlington Terrier', 'Affectionate, Intelligent, Spirited, Good-tempered', 'Female: 38–42 cm, Male: 41–44 cm', 'Female: 7.7–10 kg, Male: 7.7–10 kg', '12 – 14 years');

INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('bernese_mountain_dog', 'Bernese Mountain Dog', 'Affectionate, Intelligent, Loyal', 'Female: 58–66 cm, Male: 64–70 cm', 'Female: 36–48 kg, Male: 38–50 kg', '6 - 8 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('blenheim_spaniel', 'Blenheim Spaniel','Affectionate, Reserved, Playful, Loving, Cheerful, Gentle', 'Female: 20 cm, Male: 20 cm', 'Female: 3.6–6.4 kg, Male: 3.6-6.4 kg','12 – 14 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('bloodhound', 'Blood Hound', 'Stubborn, Affectionate, Balanced, Gentle', 'Female: 58–64 cm, Male: 64–69 cm', 'Female: 36–45 kg, Male: 41–50 kg', '10 – 12 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('border_terrier', 'Border Terrier', 'Obedient, Affectionate, Intelligent, Alert, Balanced, Fearless', 'Female: 28–36 cm, Male: 33–40 cm', 'Female: 5.1–6.4 kg, Male: 5.9–7.1 kg', '12 – 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('boston_bull', 'Boston Bull Terrier', 'Intelligent, Happy, Friendly', 'Female: 20-30 cm, Male: 20-30 cm', 'Female: 4.5 – 11 kg, Male: 4.5 - 11 kg', '13 – 15  years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('bouvier_des_flandres', 'Bouvier Des Flandres','Protective, Intelligent, Loyal, Gentle, Family, Rational', 'Female: 59–65 cm, Male: 62–68 cm', 'Female: 27–35 kg, Male: 35–40 kg', '10 – 12 years');

INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('cairn', 'Cairn Terrier', 'Intelligent, Resistant, Insistent, Fearless, Active, Cheerful', 'Female: 23–30 cm, Male: 25–33 cm', 'Female: 6–8 kg, Male: 6–8 kg', '12 – 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('chow', 'Chow Chow','Distant, Independent, Loyal, Silent', 'Female: 46–51 cm, Male: 48–56 cm', 'Female: 20–27 kg, Male: 25–32 kg','9 – 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('collie', 'Collie', 'Intelligent, Loyal, Active, Friendly, Protective, Gentle', 'Female: 51–56 cm, Male: 56–61 cm', 'Female: 18–25 kg, Male: 20–29 kg', '14 – 16 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('dandie_dinmont', 'Dandie Dinmont Terrier', 'Affectionate, Cheerful, Determined, Independent, Sociable, Fun-loving', 'Female: 30-40 cm, Male: 30-40 cm', 'Female: 8.2–11 kg, Male: 8.2–11 kg', '12 – 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('english_foxhound', 'English Foxhound', 'Sociable, Active, Friendly, Gentle, Tolerant', 'Female: 53–61 cm, Male: 56–63 cm', 'Female: 25–32 kg, Male: 27–34 kg', '10 – 13  years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('entlebucher', 'Entlebucher Mountain Dog','Self Confidence, Devoted, Intelligent, Agile, Independent, Loyal', 'Female: 42–50 cm, Male: 44–52 cm', 'Female: 20–30 kg, Male: 20–30 kg', '11 – 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('great_pyrenees', 'Great Pyrenees Mountain Dog', 'Stubborn, Affectionate, Patient, Fearless, Confident, Gentle', 'Female: 65–74 cm, Male: 70–82 cm', 'Female: 36–41 kg, Male: 50–54 kg', '10 – 12 years');

INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('ibizan_hound', 'Ibizan Hound', 'Comic, Stubborn, Intelligent, Independent, Active, Engaging', 'Female: 60–67 cm, Male: 66–72 cm', 'Female: 20–30 kg, Male: 20–30 kg', '10 – 12 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('irish_setter', 'Irish Setter','Affectionate, Energetic, Lively, Independent, Sociable, Playful', 'Female: 55–62 cm, Male: 58–67 cm', 'Female: 24–29 kg, Male: 27–32 kg','12 – 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('irish_wolfhound', 'Irish Wolfhound', 'Thoughtful, Patient, Dignified, Loyal, Generous, Docile', 'Female: 76 cm, Male: 81 cm', 'Female: 48–61 kg, Male: 54–70 kg', '6 – 10 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('italian_greyhound', 'Italian Greyhound', 'Mischievous, Affectionate, Intelligent, Agile, Sociable, Athletic', 'Female: 32–38 cm, Male: 32–38 cm', 'Female: 3.6–5 kg, Male: 3.6–5 kg', '12 – 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('japanese_spaniel', 'Japanese Spaniel', 'Intelligent, Alert, Independent, Loyal, Loving, Cat-like', 'Female: 20–27 cm, Male: 20–27 cm', 'Female: 1.4–6.8 kg, Male: 1.4–6.8 kg', '12 – 14  years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('kelpie', 'Australian Kelpie','Intelligent, Energic, Alert, Zealous, Loyal, Friendly', 'Female: ‎43–48 cm, Male: ‎46–51 cm', 'Female: 14–21 kg, Male: 14–21 kg', '12–15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('lakeland_terrier', 'Lakeland Terrier', 'Bold, Intelligent, Independent, Friendly, Confident, Easy to Train', 'Female: 33–38 cm, Male: 33–38 cm', 'Female: 7–8 kg, Male: 7–8 kg', '12 – 16 years');

INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('leonberg', 'Leonberger', 'Obedient, Fearless, Loyal, Sociable, Adaptable, Loving', 'Female: 65–75 cm, Male: 72–80 cm', 'Female: 41–59 kg, Male: 48–75 kg', '8 – 9 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('lhasa', 'Lhasa Apso','Obedient, Devoted, Intelligent, Energetic, Lively, Stable, Alert, Insistent, Fearless, Spirited, Friendly, Playful', 'Female: 25–28 cm, Male: 25–28 cm', 'Female: 5–7 kg, Male: 6–8 kg','12 – 14 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('maltese_dog', 'Bichon Maltese Dog', 'Docile, Affectionate, Easygoing, Intelligent, Lively, Receptive, Fearless, Active, Playful, Gentle', 'Female: 20–23 cm, Male: 21–25 cm', 'Female: 3–4 kg, Male: 3–4 kg', '12 - 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('miniature_pinscher', 'Miniature Pinscher', 'Smart, Energetic, Receptive, Extroverted, Friendly, Playful', 'Female: 25–28 cm, Male: 25–30 cm', 'Female: 3.5–4 kg, Male: 4–5 kg', 'up to 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('newfoundland', 'Newfoundland Dog', 'Docile, Gentle, Easy to train', 'Female: 63–69 cm, Male: 69–74 cm', 'Female: 45–55 kg, Male: 60–70 kg', '8 – 10  years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('norwegian_elkhound', 'Norwegian Elkhound','Stubborn, Bold, Resistant, Alert, Loyal, Playful', 'Female: 49–52 cm, Male: ‎49–52 cm', 'Female: 22–25 kg, Male: 22-25 kg', '12 – 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('old_english_sheepdog', 'Old English Sheepdog, known as Bobtail', 'Smart, Sociable, Bubbly, Playful, Adaptable, Loving', 'Female: 51–56 cm, Male: 56–61 cm', 'Female: 27–36 kg, Male: 32–45 kg', '10 – 12 years');

INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('papillon', 'Papillon Dog', 'Intelligent, Energetic, Alert, Friendly, Cheerful', 'Female: 20–28 cm, Male: 20–28 cm', 'Female: 3.2–4.1 kg, Male: 3.6–4.5 kg', '13 – 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('pembroke', 'Pembroke Dog','Tenacious, Bold, Extroverted, Friendly, Playful, Protective', 'Female: 25–30 cm, Male: 25–30 cm', 'Female: 10–13 kg, Male: 10–14 kg','12 – 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('pomeranian', 'Pomeranian Dog', 'Docile, Affectionate, Easygoing, Intelligent, Lively, Receptive, Fearless, Active, Playful, Gentle', 'Female: 20-24 cm, Male: 20-24 cm', 'Female: 1.9–3.5 kg, Male: 1.9–3.5 kg', '12 – 16 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('pug', 'Pug', 'Friendly, Devoted, Affectionate Companion', 'Female: 23-35 cm, Male: 23-35 cm', 'Female: 6-8 kg, Male: 6-8 kg', '12 - 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('rhodesian_ridgeback', 'Rhodesian Ridgeback Dog', 'Mischievous, Stubborn, Intelligent, Dignified, Loyal, Sensitive', 'Female: 61–66 cm, Male: ‎63–69 cm', 'Female: 29–34 kg, Male: 36–41 kg', '10 – 12  years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('saluki', 'Saluki Dog','Distant, Intelligent, Reserved, Silent', 'Female: 58–71 cm, Male: ‎58–71 cm', 'Female: 18–27 kg, Male: 18–27 kg', '12 – 14 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('samoyed', 'Samoyed Dog', 'Lively, Stubborn, Sociable, Alert, Friendly, Playful', 'Female: 48–53 cm, Male: 53–60 cm', 'Female: 16–20 kg, Male: 20–30 kg', '12 – 13 years');

INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('schipperke', 'Schipperke Dog', 'Curious, Agile, Fearless, Independent, Confident, Loyal', 'Female: 25–30 cm, Male: 28–33 cm', 'Female: 3–9 kg, Male: 3–9 kg', '13 – 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('scottish_deerhound', 'Scottish Deerhound Dog','Docile, Dignified, Friendly, Gentle', 'Female: 75–80 cm, Male: 75–80 cm', 'Female: 34–43 kg, Male: 39–50 kg','8 – 11 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('sealyham_terrier', 'Sealyham Terrier', 'Alert, Balanced, Fearless, Friendly, Calm', 'Female: up to 32 cm, Male: up to 32 cm', 'Female: 8 kg, Male: 9 kg', '12 – 14 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('shih-tzu', 'Shih-Tzu', 'Smart, Affectionate, Intelligent, Lively, Alert, Agile', 'Female: 33-38 cm, Male: 33-38 cm', 'Female: 4–7.2 kg, Male: 4–7.2 kg', '10 – 16 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('siberian_husky', 'Siberian Husky', 'Smart, Alert, Extroverted, Friendly, Gentle', 'Female: 50–56 cm, Male: ‎54–60 cm', 'Female: 16–23 kg, Male: 20–27 kg', '12 - 15  years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('silky_terrier', 'Silky Terrier','Receptive, Alert, Inquisitive, Friendly, Joyful, Lively', 'Female: 23–26 cm, Male: ‎23–26 cm', 'Female: 4-5 kg, Male: 4-5 kg', '12 – 15 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('tibetan_terrier', 'Tibetan Terrier', 'Friendly, Affectionate, Energetic, Reserved, Sensitive, Gentle', 'Female: 35–41 cm, Male: 35–41 cm', 'Female: 8-14 kg, Male: 8-14 kg', '12 – 15 years');

INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('weimaraner', 'Weimaraner Dog','Stubborn, Distant, Intelligent, Energetic, Stable, Alert, Strong, Fast', 'Female: 59–63 cm, Male: 62–67 cm', 'Female: 25-35 kg, Male: 30–40 kg', '11 – 14 years');
INSERT INTO `dog_details` (`id`, `name`, `behavior`, `height`, `weight`, `life_expectancy`) 
VALUES ('whippet', 'Whippet Dog', 'Affectionate, Intelligent, Lively, Friendly, Silent, Gentle', 'Female: 45–53 cm, Male: 48–56 cm', 'Female: 6.8 – 14 kg, Male: 6.8 – 14 kg', '12 – 15 years');