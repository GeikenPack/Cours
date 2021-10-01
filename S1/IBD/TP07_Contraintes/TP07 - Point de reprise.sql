------------------------------------------------------------------
-- TP07 Point de reprise
------------------------------------------------------------------

-- TP05 updatebase.sql

DROP TABLE Volcan;

-- TP03 createbase.sql

DROP TABLE Traverser;
DROP TABLE Fleuve;
DROP TABLE Localiser;
DROP TABLE Montagne;
DROP TABLE Frontiere;
DROP TABLE Pays;
DROP TABLE Continent;

CREATE TABLE Continent
(
 nom VARCHAR(50),
 superficie DECIMAL,
 CONSTRAINT pk_continent PRIMARY KEY (nom)
);

CREATE TABLE Pays
(
 nom VARCHAR(50),
 capitale VARCHAR(30),
 superficie DECIMAL,
 population DECIMAL,
 iso3 CHAR(3),
 iso2 CHAR(2),
 nomc VARCHAR(50),
 CONSTRAINT pk_pays PRIMARY KEY (nom),
 CONSTRAINT uk_pays_iso3 UNIQUE (iso3),
 CONSTRAINT uk_pays_iso2 UNIQUE (iso2),
 CONSTRAINT fk_Pays_Continent FOREIGN KEY (nomc) REFERENCES Continent (nom)
);

CREATE TABLE Frontiere
(
 nomp VARCHAR(50),
 nomf VARCHAR(50),
 longueur DECIMAL,
 CONSTRAINT pk_frontiere PRIMARY KEY (nomp, nomf),
 CONSTRAINT fk_frontiere_nomp FOREIGN KEY (nomp) REFERENCES Pays (nom),
 CONSTRAINT fk_frontiere_nomf FOREIGN KEY (nomf) REFERENCES Pays (nom)
);

CREATE TABLE Montagne
(
 nm DECIMAL,
 nom VARCHAR(50),
 altitude DECIMAL,
 chaine VARCHAR(50),
 CONSTRAINT pk_montagne PRIMARY KEY (nm)
);

CREATE TABLE Localiser
(
 nm DECIMAL,
 nomp VARCHAR(50),
 CONSTRAINT pk_localiser PRIMARY KEY (nm, nomp),
 CONSTRAINT fk_localiser_montagne FOREIGN KEY (nm) REFERENCES Montagne(nm),
 CONSTRAINT fk_localiser_pays FOREIGN KEY (nomp) REFERENCES Pays(nom)
);

CREATE TABLE Fleuve
(
 nf DECIMAL,
 nom VARCHAR(50),
 longueur DECIMAL,
 embouchure VARCHAR(30),
 CONSTRAINT pk_fleuve PRIMARY KEY (nf)
);

CREATE TABLE Traverser
(
 nf DECIMAL,
 nomp VARCHAR(50),
 CONSTRAINT pk_traverser PRIMARY KEY (nf, nomp),
 CONSTRAINT fk_traverser_fleuve FOREIGN KEY (nf) REFERENCES Fleuve(nf),
 CONSTRAINT fk_traverser_pays FOREIGN KEY (nomp) REFERENCES Pays(nom)
);

-- TP03 insertbase.sql

DROP SEQUENCE Seq_Fleuve;
DROP SEQUENCE Seq_Montagne;

CREATE SEQUENCE Seq_Montagne
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE Seq_Fleuve
START WITH 1
INCREMENT BY 1;

DELETE FROM Traverser;
DELETE FROM Fleuve;
DELETE FROM Localiser;
DELETE FROM Montagne;
DELETE FROM Frontiere;
DELETE FROM Pays;
DELETE FROM Continent;

INSERT INTO Continent VALUES ('Asie', 44579000);
INSERT INTO Continent VALUES ('Afrique',	30065000);
INSERT INTO Continent VALUES ('Amérique', 42189120);
INSERT INTO Continent VALUES ('Antarctique',	13209000);
INSERT INTO Continent VALUES ('Europe', 9938000);
INSERT INTO Continent VALUES ('Océanie', 7687000);
COMMIT;


INSERT INTO Pays VALUES ('Émirats arabes unis', 'Abou Dabi', 82880, 9992083, 'ARE', 'AE', NULL);
INSERT INTO Pays VALUES ('Nigeria', 'Abuja', 923768, 214028302, 'NGA', 'NG', NULL);
INSERT INTO Pays VALUES ('Ghana', 'Accra', 238540, 29340248, 'GHA', 'GH', NULL);
INSERT INTO Pays VALUES ('Turkménistan', 'Achgabat', 488100, 5411012, 'TKM', 'TM', NULL);
INSERT INTO Pays VALUES ('Éthiopie', 'Addis-Abeba', 1127127, 108386391, 'ETH', 'ET', NULL);
INSERT INTO Pays VALUES ('Algérie', 'Alger', 2381741, 43900000, 'DZA', 'DZ', NULL);
INSERT INTO Pays VALUES ('Niue', 'Alofi', 260, 1612, 'NIU', 'NU', NULL);
INSERT INTO Pays VALUES ('Jordanie', 'Amman', 89342, 10820644, 'JOR', 'JO', NULL);
INSERT INTO Pays VALUES ('Pays-Bas', 'Amsterdam', 41530, 17282163, 'NLD', 'NL', NULL);
INSERT INTO Pays VALUES ('Andorre', 'Andorre-la-Vieille', 468, 77000, 'AND', 'AD', NULL);
INSERT INTO Pays VALUES ('Turquie', 'Ankara', 783562, 83154997, 'TUR', 'TR', NULL);
INSERT INTO Pays VALUES ('Madagascar', 'Antananarivo', 587041, 26955737, 'MDG', 'MG', NULL);
INSERT INTO Pays VALUES ('Samoa', 'Apia', 2944, 193483, 'WSM', 'WS', NULL);
INSERT INTO Pays VALUES ('Érythrée', 'Asmara', 121320, 5869970, 'ERI', 'ER', NULL);
INSERT INTO Pays VALUES ('Paraguay', 'Asuncion', 406752, 7191685, 'PRY', 'PY', NULL);
INSERT INTO Pays VALUES ('Grèce', 'Athènes', 131957, 10607051, 'GRC', 'GR', NULL);
INSERT INTO Pays VALUES ('Îles Cook', 'Avarua', 240, 21923, 'COK', 'CK', NULL);
INSERT INTO Pays VALUES ('Irak', 'Bagdad', 435052, 38872655, 'IRQ', 'IQ', NULL);
INSERT INTO Pays VALUES ('Azerbaïdjan', 'Bakou', 86600, 10205810, 'AZE', 'AZ', NULL);
INSERT INTO Pays VALUES ('Mali', 'Bamako', 1241238, 19553397, 'MLI', 'ML', NULL);
INSERT INTO Pays VALUES ('Brunei', 'Bandar Seri Begawan', 5765, 450565, 'BRN', 'BN', NULL);
INSERT INTO Pays VALUES ('Thaïlande', 'Bangkok', 514000, 68977400, 'THA', 'TH', NULL);
INSERT INTO Pays VALUES ('République centrafricaine', 'Bangui', 622984, 5990855, 'CAF', 'CF', NULL);
INSERT INTO Pays VALUES ('Gambie', 'Banjul', 11300, 2173999, 'GMB', 'GM', NULL);
INSERT INTO Pays VALUES ('Saint-Christophe-et-Niévès', 'Basseterre', 261, 53821, 'KNA', 'KN', NULL);
INSERT INTO Pays VALUES ('Serbie', 'Belgrade', 77474, 7078110, 'SRB', 'RS', NULL);
INSERT INTO Pays VALUES ('Belize', 'Belmopan', 22966, 385854, 'BLZ', 'BZ', NULL);
INSERT INTO Pays VALUES ('Allemagne', 'Berlin', 357386, 83149300, 'DEU', 'DE', NULL);
INSERT INTO Pays VALUES ('Suisse', 'Berne ', 41285, 8603900, 'CHE', 'CH', NULL);
INSERT INTO Pays VALUES ('Liban', 'Beyrouth', 10452, 5469612, 'LBN', 'LB', NULL);
INSERT INTO Pays VALUES ('Kirghizistan', 'Bichkek', 198500, 5964897, 'KGZ', 'KG', NULL);
INSERT INTO Pays VALUES ('Guinée-Bissau', 'Bissau', 36120, 1833247, 'GNB', 'GW', NULL);
INSERT INTO Pays VALUES ('Afrique du Sud', 'Pretoria', 1219912, 58775022, 'ZAF', 'ZA', NULL);
INSERT INTO Pays VALUES ('Colombie', 'Bogota', 1141748, 49084841, 'COL', 'CO', NULL);
INSERT INTO Pays VALUES ('Brésil', 'Brasilia', 8514876, 211715973, 'BRA', 'BR', NULL);
INSERT INTO Pays VALUES ('Slovaquie', 'Bratislava', 49035, 5457926, 'SVK', 'SK', NULL);
INSERT INTO Pays VALUES ('République du Congo', 'Brazzaville', 342000, 5293070, 'COG', 'CG', NULL);
INSERT INTO Pays VALUES ('Barbade', 'Bridgetown', 430, 294560, 'BRB', 'BB', NULL);
INSERT INTO Pays VALUES ('Belgique', 'Bruxelles', 30688, 11476279, 'BEL', 'BE', NULL);
INSERT INTO Pays VALUES ('Roumanie', 'Bucarest', 238397, 21302893, 'ROU', 'RO', NULL);
INSERT INTO Pays VALUES ('Hongrie', 'Budapest', 93028, 9771827, 'HUN', 'HU', NULL);
INSERT INTO Pays VALUES ('Argentine', 'Buenos Aires', 2791810, 45479118, 'ARG', 'AR', NULL);
INSERT INTO Pays VALUES ('Égypte', 'Le Caire', 1001450, 104124440, 'EGY', 'EG', NULL);
INSERT INTO Pays VALUES ('Australie', 'Canberra', 7692060, 25464116, 'AUS', 'AU', NULL);
INSERT INTO Pays VALUES ('Venezuela', 'Caracas', 916445, 28436066, 'VEN', 'VE', NULL);
INSERT INTO Pays VALUES ('Sainte-Lucie', 'Castries', 620, 166487, 'LCA', 'LC', NULL);
INSERT INTO Pays VALUES ('Moldavie', 'Chisinau', 33851, 2681735, 'MDA', 'MD', NULL);
INSERT INTO Pays VALUES ('Sri Lanka', 'Sri Jayawardenapura Kotte', 65610, 22889201, 'LKA', 'LK', NULL);
INSERT INTO Pays VALUES ('Guinée', 'Conakry', 245857, 12527440, 'GIN', 'GN', NULL);
INSERT INTO Pays VALUES ('Danemark', 'Copenhague', 2210579, 5822763, 'DNK', 'DK', NULL);
INSERT INTO Pays VALUES ('Sénégal', 'Dakar', 196722, 16209125, 'SEN', 'SN', NULL);
INSERT INTO Pays VALUES ('Syrie', 'Damas', 185180, 19454263, 'SYR', 'SY', NULL);
INSERT INTO Pays VALUES ('Îles Marshall', 'Delap-Uliga-Darrit', 181, 75684, 'MHL', 'MH', NULL);
INSERT INTO Pays VALUES ('Bangladesh', 'Dacca', 147570, 162650853, 'BGD', 'BD', NULL);
INSERT INTO Pays VALUES ('Timor oriental', 'Dili', 15410, 1321929, 'TLS', 'TL', NULL);
INSERT INTO Pays VALUES ('Djibouti', 'Djibouti', 23200, 921804, 'DJI', 'DJ', NULL);
INSERT INTO Pays VALUES ('Soudan du Sud', 'Djouba', 619745, 10561244, 'SSD', 'SS', NULL);
INSERT INTO Pays VALUES ('Tanzanie', 'Dodoma', 945087, 58552845, 'TZA', 'TZ', NULL);
INSERT INTO Pays VALUES ('Qatar', 'Doha', 11586, 2444174, 'QAT', 'QA', NULL);
INSERT INTO Pays VALUES ('Tadjikistan', 'Douchanbé', 143100, 8873669, 'TJK', 'TJ', NULL);
INSERT INTO Pays VALUES ('Irlande', 'Dublin', 70273, 5176569, 'IRL', 'IE', NULL);
INSERT INTO Pays VALUES ('Arménie', 'Erevan', 29743, 3021324, 'ARM', 'AM', NULL);
INSERT INTO Pays VALUES ('Sierra Leone', 'Freetown', 71740, 6624933, 'SLE', 'SL', NULL);
INSERT INTO Pays VALUES ('Tuvalu', 'Funafuti', 26, 11192, 'TUV', 'TV', NULL);
INSERT INTO Pays VALUES ('Botswana', 'Gaborone', 581726, 2317233, 'BWA', 'BW', NULL);
INSERT INTO Pays VALUES ('Guyana', 'Georgetown', 214970, 750204, 'GUY', 'GY', NULL);
INSERT INTO Pays VALUES ('Burundi', 'Gitega', 27834, 11865821, 'BDI', 'BI', NULL);
INSERT INTO Pays VALUES ('Guatemala', 'Guatemala', 108890, 17153288, 'GTM', 'GT', NULL);
INSERT INTO Pays VALUES ('Viêt Nam', 'Hanoï', 330967, 98721275, 'VNM', 'VN', NULL);
INSERT INTO Pays VALUES ('Zimbabwe', 'Harare', 390745, 14546314, 'ZWE', 'ZW', NULL);
INSERT INTO Pays VALUES ('Cuba', 'La Havane', 110860, 11116396, 'CUB', 'CU', NULL);
INSERT INTO Pays VALUES ('Finlande', 'Helsinki', 338145, 5522015, 'FIN', 'FI', NULL);
INSERT INTO Pays VALUES ('Salomon', 'Honiara', 28450, 647581, 'SLB', 'SB', NULL);
INSERT INTO Pays VALUES ('Pakistan', 'Islamabad', 881913, 233500636, 'PAK', 'PK', NULL);
INSERT INTO Pays VALUES ('Indonésie', 'Jakarta', 1904569, 267026366, 'IDN', 'ID', NULL);
INSERT INTO Pays VALUES ('Israël', 'Tel-aviv', 20770, 9213000, 'ISR', 'IL', NULL);
INSERT INTO Pays VALUES ('Palestine', 'Ramallah', 6020, 5090293, 'PSE', 'PS', NULL);
INSERT INTO Pays VALUES ('Afghanistan', 'Kaboul', 652230, 36643815, 'AFG', 'AF', NULL);
INSERT INTO Pays VALUES ('Ouganda', 'Kampala', 241550, 41487965, 'UGA', 'UG', NULL);
INSERT INTO Pays VALUES ('Népal', 'Katmandou', 147516, 30327877, 'NPL', 'NP', NULL);
INSERT INTO Pays VALUES ('Soudan', 'Khartoum', 1886068, 43120843, 'SDN', 'SD', NULL);
INSERT INTO Pays VALUES ('Ukraine', 'Kiev', 603549, 44983019, 'UKR', 'UA', NULL);
INSERT INTO Pays VALUES ('Rwanda', 'Kigali', 26338, 12712431, 'RWA', 'RW', NULL);
INSERT INTO Pays VALUES ('Jamaïque', 'Kingston', 11425, 2808570, 'JAM', 'JM', NULL);
INSERT INTO Pays VALUES ('Saint-Vincent-et-les-Grenadines', 'Kingstown', 389, 101390, 'VCT', 'VC', NULL);
INSERT INTO Pays VALUES ('République démocratique du Congo', 'Kinshasa', 2345410, 101780263, 'COD', 'CD', NULL);
INSERT INTO Pays VALUES ('Palaos', 'Melekeok', 459, 21291, 'PLW', 'PW', NULL);
INSERT INTO Pays VALUES ('Koweït', 'Koweït', 17818, 2993706, 'KWT', 'KW', NULL);
INSERT INTO Pays VALUES ('Malaisie', 'Kuala Lumpur', 329750, 32652083, 'MYS', 'MY', NULL);
INSERT INTO Pays VALUES ('Gabon', 'Libreville', 267667, 2230908, 'GAB', 'GA', NULL);
INSERT INTO Pays VALUES ('Malawi', 'Lilongwe', 118844, 21196629, 'MWI', 'MW', NULL);
INSERT INTO Pays VALUES ('Pérou', 'Lima', 1285216, 31914989, 'PER', 'PE', NULL);
INSERT INTO Pays VALUES ('Portugal', 'Lisbonne', 92380, 10390780, 'PRT', 'PT', NULL);
INSERT INTO Pays VALUES ('Slovénie', 'Ljubljana', 20273, 2070050, 'SVN', 'SI', NULL);
INSERT INTO Pays VALUES ('Togo', 'Lomé', 56785, 8608444, 'TGO', 'TG', NULL);
INSERT INTO Pays VALUES ('Royaume-Uni', 'Londres', 246690, 65761117, 'GBR', 'GB', NULL);
INSERT INTO Pays VALUES ('Angola', 'Luanda', 1246700, 32522339, 'AGO', 'AO', NULL);
INSERT INTO Pays VALUES ('Zambie', 'Lusaka', 752614, 15066266, 'ZMB', 'ZM', NULL);
INSERT INTO Pays VALUES ('Luxembourg', 'Luxembourg', 2586, 62610, 'LUX', 'LU', NULL);
INSERT INTO Pays VALUES ('Espagne', 'Madrid', 505911, 46934632, 'ESP', 'ES', NULL);
INSERT INTO Pays VALUES ('Guinée équatoriale', 'Malabo', 28051, 1403000, 'GNQ', 'GQ', NULL);
INSERT INTO Pays VALUES ('Maldives', 'Malé', 298, 392709, 'MDV', 'MV', NULL);
INSERT INTO Pays VALUES ('Nicaragua', 'Managua', 129494, 6203441, 'NIC', 'NI', NULL);
INSERT INTO Pays VALUES ('Bahreïn', 'Manama', 765, 1442659, 'BHR', 'BH', NULL);
INSERT INTO Pays VALUES ('Philippines', 'Manille', 300400, 109180815, 'PHL', 'PH', NULL);
INSERT INTO Pays VALUES ('Mozambique', 'Maputo', 801590, 27233789, 'MOZ', 'MZ', NULL);
INSERT INTO Pays VALUES ('Oman', 'Mascate', 309500, 4664844, 'OMN', 'OM', NULL);
INSERT INTO Pays VALUES ('Lesotho', 'Maseru', 30355, 1924381, 'LSO', 'LS', NULL);
INSERT INTO Pays VALUES ('Swaziland', 'Mbabane', 17363, 1104479, 'SWZ', 'SZ', NULL);
INSERT INTO Pays VALUES ('Mexique', 'Mexico', 1964375, 128649565, 'MEX', 'MX', NULL);
INSERT INTO Pays VALUES ('Biélorussie', 'Minsk', 207600, 9477918, 'BLR', 'BY', NULL);
INSERT INTO Pays VALUES ('Somalie', 'Mogadiscio', 637657, 11259029, 'SOM', 'SO', NULL);
INSERT INTO Pays VALUES ('Monaco', 'Monaco', 2, 38100, 'MCO', 'M', NULL);
INSERT INTO Pays VALUES ('Liberia', 'Monrovia', 111369, 5073296, 'LBR', 'LR', NULL);
INSERT INTO Pays VALUES ('Uruguay', 'Montevideo', 176220, 3387605, 'URY', 'UY', NULL);
INSERT INTO Pays VALUES ('Comores', 'Moroni', 2612, 846281, 'COM', 'KM', NULL);
INSERT INTO Pays VALUES ('Russie', 'Moscou', 17125191, 146780700, 'RUS', 'RU', NULL);
INSERT INTO Pays VALUES ('Kenya', 'Nairobi', 580367, 475649, 'KEN', 'KE', NULL);
INSERT INTO Pays VALUES ('Bahamas', 'Nassau', 13943, 337721, 'BHS', 'BS', NULL);
INSERT INTO Pays VALUES ('Birmanie', 'Naypyidaw', 676578, 56590071, 'MMR', 'MM', NULL);
INSERT INTO Pays VALUES ('Tchad', 'N''Djaména', 1284000, 16877357, 'TCD', 'TD', NULL);
INSERT INTO Pays VALUES ('Inde', 'New Delhi', 3287263, 1326093247, 'IND', 'IN', NULL);
INSERT INTO Pays VALUES ('Niger', 'Niamey', 1267000, 22772361, 'NER', 'NE', NULL);
INSERT INTO Pays VALUES ('Chypre', 'Nicosie', 9251, 1266676, 'CYP', 'CY', NULL);
INSERT INTO Pays VALUES ('Mauritanie', 'Nouakchott', 1030700, 4005475, 'MRT', 'MR', NULL);
INSERT INTO Pays VALUES ('Kazakhstan', 'Noursoultan', 2724900, 19091949, 'KAZ', 'KZ', NULL);
INSERT INTO Pays VALUES ('Tonga', 'Nuku''alofa', 747, 100651, 'TON', 'TO', NULL);
INSERT INTO Pays VALUES ('Norvège', 'Oslo', 385207, 5367580, 'NOR', 'NO', NULL);
INSERT INTO Pays VALUES ('Canada', 'Ottawa', 9984670, 37589262, 'CAN', 'CA', NULL);
INSERT INTO Pays VALUES ('Burkina Faso', 'Ouagadougou', 274400, 20835401, 'BFA', 'BF', NULL);
INSERT INTO Pays VALUES ('Mongolie', 'Oulan-Bator', 1564116, 3168026, 'MNG', 'MN', NULL);
INSERT INTO Pays VALUES ('États fédérés de Micronésie', 'Palikir', 702, 102624, 'FSM', 'FM', NULL);
INSERT INTO Pays VALUES ('Panama', 'Panama', 75420, 4285850, 'PAN', 'PA', NULL);
INSERT INTO Pays VALUES ('Suriname', 'Paramaribo', 163270, 597927, 'SUR', 'SR', NULL);
INSERT INTO Pays VALUES ('France', 'Paris', 632734, 67848156, 'FRA', 'FR', NULL);
INSERT INTO Pays VALUES ('Bolivie', 'La Paz', 1098581, 11639909, 'BOL', 'BO', NULL);
INSERT INTO Pays VALUES ('Chine', 'Pékin', 9596960, 1439085892, 'CHN', 'CN', NULL);
INSERT INTO Pays VALUES ('Cambodge', 'Phnom Penh', 181035, 16926984, 'KHM', NULL, NULL);
INSERT INTO Pays VALUES ('Monténégro', 'Podgorica', 13812, 609859, 'MNE', 'ME', NULL);
INSERT INTO Pays VALUES ('Papouasie-Nouvelle-Guinée', 'Port Moresby', 462840, 8300000, 'PNG', 'PG', NULL);
INSERT INTO Pays VALUES ('Haïti', 'Port-au-Prince', 27750, 11067777, 'HTI', 'HT', NULL);
INSERT INTO Pays VALUES ('Trinité-et-Tobago', 'Port-d''Espagne', 5128, 1208789, 'TTO', 'TT', NULL);
INSERT INTO Pays VALUES ('Maurice', 'Port-Louis', 2040, 1259838, 'MUS', 'MU', NULL);
INSERT INTO Pays VALUES ('Bénin', 'Porto-Novo', 114763, 12864634, 'BEN', 'BJ', NULL);
INSERT INTO Pays VALUES ('Vanuatu', 'Port-Vila', 12189, 298333, 'VUT', 'VU', NULL);
INSERT INTO Pays VALUES ('République Tchèque', 'Prague', 78870, 10649800, 'CZE', 'CZ', NULL);
INSERT INTO Pays VALUES ('Cap-Vert', 'Praia', 4033, 583255, 'CPV', 'CV', NULL);
INSERT INTO Pays VALUES ('Kosovo', 'Pristina', 10908, 1920079, NULL, 'XK', NULL);
INSERT INTO Pays VALUES ('Corée du Nord', 'Pyongyang', 120540, 25381085, 'PRK', 'KP', NULL);
INSERT INTO Pays VALUES ('Équateur', 'Quito', 283520, 16904867, 'ECU', 'EC', NULL);
INSERT INTO Pays VALUES ('Maroc', 'Rabat', 446550, 36471769, 'MAR', 'MA', NULL);
INSERT INTO Pays VALUES ('Islande', 'Reykjavik', 102775, 362860, 'ISL', 'IS', NULL);
INSERT INTO Pays VALUES ('Lettonie', 'Riga', 64559, 1928600, 'LVA', 'LV', NULL);
INSERT INTO Pays VALUES ('Arabie saoudite', 'Riyad', 2149690, 34173498, 'SAU', 'SA', NULL);
INSERT INTO Pays VALUES ('Italie', 'Rome', 301336, 60359546, 'ITA', 'IT', NULL);
INSERT INTO Pays VALUES ('Dominique', 'Roseau', 754, 74243, 'DMA', 'DM', NULL);
INSERT INTO Pays VALUES ('Antigua-et-Barbuda', 'Saint John''s', 442, 98179, 'ATG', 'AG', NULL);
INSERT INTO Pays VALUES ('République dominicaine', 'Saint-Domingue', 48442, 10499707, 'DOM', 'DO', NULL);
INSERT INTO Pays VALUES ('Grenade', 'Saint-Georges', 344, 113094, 'GRD', 'GD', NULL);
INSERT INTO Pays VALUES ('Saint-Marin', 'Saint-Marin', 61, 32793, 'SMR', 'SM', NULL);
INSERT INTO Pays VALUES ('Costa Rica', 'San José', 51100, 5111238, 'CRI', 'CR', NULL);
INSERT INTO Pays VALUES ('Salvador', 'San Salvador', 20742, 6481102, 'SLV', 'SV', NULL);
INSERT INTO Pays VALUES ('Yémen', 'Sanaa', 527968, 28036829, 'YEM', 'YE', NULL);
INSERT INTO Pays VALUES ('Chili', 'Santiago', 755276, 18186770, 'CHL', 'CL', NULL);
INSERT INTO Pays VALUES ('Sao Tomé-et-Principe', 'São Tomé', 1001, 211122, 'STP', 'ST', NULL);
INSERT INTO Pays VALUES ('Bosnie-Herzégovine', 'Sarajevo', 51197, 3835586, 'BIH', 'BA', NULL);
INSERT INTO Pays VALUES ('Corée du Sud', 'Séoul', 100210, 51709098, 'KOR', 'KR', NULL);
INSERT INTO Pays VALUES ('Singapour', 'Singapour', 724, 6209660, 'SGP', 'SG', NULL);
INSERT INTO Pays VALUES ('Macédoine du Nord', 'Skopje', 25713, 2125971, 'MKD', 'MK', NULL);
INSERT INTO Pays VALUES ('Bulgarie', 'Sofia', 110944, 6966899, 'BGR', 'BG', NULL);
INSERT INTO Pays VALUES ('Suède', 'Stockholm', 449965, 10313447, 'SWE', 'SE', NULL);
INSERT INTO Pays VALUES ('Fidji', 'Suva', 18270, 935974, 'FJI', 'FJ', NULL);
INSERT INTO Pays VALUES ('Ouzbékistan', 'Tachkent', 447400, 30565411, 'UZB', 'UZ', NULL);
INSERT INTO Pays VALUES ('Estonie', 'Tallinn', 45339, 1228624, 'EST', 'EE', NULL);
INSERT INTO Pays VALUES ('Kiribati', 'Tarawa-Sud', 811, 110110, 'KIR', 'KI', NULL);
INSERT INTO Pays VALUES ('Géorgie', 'Tbilissi', 69700, 3997000, 'GEO', 'GE', NULL);
INSERT INTO Pays VALUES ('Honduras', 'Tegucigalpa', 112090, 9182766, 'HND', 'HN', NULL);
INSERT INTO Pays VALUES ('Iran', 'Téhéran', 1648195, 84923314, 'IRN', 'IR', NULL);
INSERT INTO Pays VALUES ('Bhoutan', 'Thimphou', 38394, 782318, 'BTN', 'BT', NULL);
INSERT INTO Pays VALUES ('Albanie', 'Tirana', 28748, 3074579, 'ALB', 'AL', NULL);
INSERT INTO Pays VALUES ('Japon', 'Tokyo', 377975, 125507472, 'JPN', 'JP', NULL);
INSERT INTO Pays VALUES ('Libye', 'Tripoli', 1759540, 6890535, 'LBY', 'LY', NULL);
INSERT INTO Pays VALUES ('Tunisie', 'Tunis', 163610, 11722038, 'TUN', 'TN', NULL);
INSERT INTO Pays VALUES ('Liechtenstein', 'Vaduz', 160, 37810, 'LIE', 'LI', NULL);
INSERT INTO Pays VALUES ('Malte', 'La Valette', 316, 457267, 'MLT', 'MT', NULL);
INSERT INTO Pays VALUES ('Pologne', 'Varsovie', 312679, 38282325, 'POL', 'PL', NULL);
INSERT INTO Pays VALUES ('Vatican', 'Cité du Vatican', 0.4, 799, 'VAT', 'VA', NULL);
INSERT INTO Pays VALUES ('Seychelles', 'Victoria', 455, 95981, 'SYC', 'SC', NULL);
INSERT INTO Pays VALUES ('Autriche', 'Vienne', 83871, 8859449, 'AUT', 'AT', NULL);
INSERT INTO Pays VALUES ('Laos', 'Vientiane', 236800, 7447396, 'LAO', 'LA', NULL);
INSERT INTO Pays VALUES ('Lituanie', 'Vilnius', 65303, 2731464, 'LTU', 'LT', NULL);
INSERT INTO Pays VALUES ('États-Unis', 'Washington D.C.', 9833517, 328239523, 'USA', 'US', NULL);
INSERT INTO Pays VALUES ('Nouvelle-Zélande', 'Wellington', 268680, 4926551, 'NZL', 'NZ', NULL);
INSERT INTO Pays VALUES ('Namibie', 'Windhoek', 825418, 2630073, 'NAM', 'NA', NULL);
INSERT INTO Pays VALUES ('Côte d''Ivoire', 'Yamoussoukro', 322462, 26378274, 'CIV', 'CI', NULL);
INSERT INTO Pays VALUES ('Cameroun', 'Yaoundé', 475440, 27744989, 'CMR', 'CM', NULL);
INSERT INTO Pays VALUES ('Nauru', 'Yaren', 21, 13649, 'NRU', 'NR', NULL);
INSERT INTO Pays VALUES ('Croatie', 'Zagreb', 56594, 4076246, 'HRV', 'HR', NULL);
INSERT INTO Pays VALUES ('Taïwan', 'Taipei', 35980, 23603049, 'TWN', 'TW', NULL);
INSERT INTO Pays VALUES ('Sahara occidental', NULL, 266000, 603253, 'ESH', 'EH', NULL);
COMMIT;

UPDATE Pays
SET nomc = 'Afrique'
WHERE nom IN (
'Afrique du Sud', 'Algérie', 'Angola', 'Bénin', 'Botswana', 'Burkina Faso', 'Burundi', 'Cameroun', 'Cap-Vert',
'République centrafricaine', 'Comores', 'République du Congo', 'République démocratique du Congo', 'Côte d''Ivoire',
'Djibouti', 'Égypte', 'Érythrée', 'Éthiopie', 'Eswatini', 'Gabon', 'Gambie', 'Ghana', 'Guinée', 'Guinée-Bissau',
'Guinée équatoriale', 'Kenya', 'Lesotho', 'Liberia', 'Libye', 'Madagascar', 'Malawi', 'Mali', 'Maroc', 'Maurice',
'Mauritanie', 'Mozambique', 'Namibie', 'Niger', 'Nigeria', 'Ouganda', 'Rwanda', 'Sahara occidental', 'Sao Tomé-et-Principe', 'Sénégal',
'Seychelles', 'Sierra Leone', 'Somalie', 'Soudan', 'Soudan du Sud', 'Tanzanie', 'Tchad', 'Togo', 'Tunisie', 'Zambie',
'Zimbabwe', 'Swaziland');

UPDATE Pays
SET nomc = 'Amérique'
WHERE nom IN (
'Antigua-et-Barbuda', 'Argentine', 'Bahamas', 'Barbade', 'Belize', 'Bolivie', 'Brésil', 'Canada', 'Chili', 'Colombie',
'Costa Rica', 'Cuba', 'République dominicaine', 'Dominique', 'Équateur', 'États-Unis', 'Grenade', 'Guatemala', 'Guyana',
'Haïti', 'Honduras', 'Jamaïque', 'Mexique', 'Nicaragua', 'Panama', 'Paraguay', 'Pérou', 'Saint-Christophe-et-Niévès', 'Sainte-Lucie',
'Saint-Vincent-et-les-Grenadines', 'Salvador', 'Suriname', 'Trinité-et-Tobago', 'Uruguay', 'Venezuela');

UPDATE Pays
SET nomc = 'Asie'
WHERE nom IN (
'Afghanistan', 'Arabie saoudite', 'Arménie', 'Azerbaïdjan', 'Bahreïn', 'Bangladesh', 'Bhoutan', 'Birmanie', 'Brunei',
'Cambodge', 'Chine', 'Corée du Nord', 'Corée du Sud', 'Émirats arabes unis', 'Géorgie', 'Inde', 'Indonésie', 'Irak',
'Iran', 'Israël', 'Japon', 'Jordanie', 'Kazakhstan', 'Kirghizistan', 'Koweït', 'Laos', 'Liban', 'Malaisie', 'Maldives',
'Mongolie', 'Népal', 'Oman', 'Ouzbékistan', 'Pakistan', 'Palestine', 'Philippines', 'Qatar', 'Singapour', 'Sri Lanka',
'Syrie', 'Tadjikistan', 'Taïwan', 'Thaïlande', 'Timor oriental', 'Turkménistan', 'Turquie', 'Viêt Nam', 'Yémen'); 

UPDATE Pays
SET nomc = 'Europe'
WHERE nom IN (
'Albanie', 'Allemagne', 'Andorre', 'Autriche', 'Belgique', 'Biélorussie', 'Bosnie-Herzégovine', 'Bulgarie', 'Chypre', 
'Croatie', 'Danemark', 'Espagne', 'Estonie', 'Finlande', 'France', 'Grèce', 'Hongrie', 'Irlande', 'Islande', 'Italie',
'Lettonie', 'Liechtenstein', 'Lituanie', 'Luxembourg', 'Macédoine du Nord', 'Malte', 'Moldavie', 'Monaco', 'Monténégro',
'Norvège', 'Pays-Bas', 'Pologne', 'Portugal', 'République Tchèque', 'Roumanie', 'Royaume-Uni', 'Russie', 'Saint-Marin',
'Serbie', 'Slovaquie', 'Slovénie', 'Suède', 'Suisse', 'Ukraine', 'Vatican', 'Kosovo'); 

UPDATE Pays
SET nomc = 'Océanie'
WHERE nom IN (
'Australie', 'Fidji', 'Îles Cook', 'Kiribati', 'Îles Marshall', 'États fédérés de Micronésie', 'Nauru', 'Niue', 'Nouvelle-Zélande', 'Palaos', 
'Papouasie-Nouvelle-Guinée', 'Salomon', 'Samoa', 'Tonga', 'Tuvalu', 'Vanuatu' );
COMMIT;



INSERT INTO Frontiere VALUES ('Chine', 'Afghanistan', 76);
INSERT INTO Frontiere VALUES ('Chine', 'Bhoutan', 470);
INSERT INTO Frontiere VALUES ('Chine', 'Birmanie', 2185);
INSERT INTO Frontiere VALUES ('Chine', 'Corée du Nord', 1416);
INSERT INTO Frontiere VALUES ('Chine', 'Inde', 3380);
INSERT INTO Frontiere VALUES ('Chine', 'Kazakhstan', 1533);
INSERT INTO Frontiere VALUES ('Chine', 'Kirghizistan', 858);
INSERT INTO Frontiere VALUES ('Chine', 'Laos', 423);
INSERT INTO Frontiere VALUES ('Chine', 'Mongolie', 4677);
INSERT INTO Frontiere VALUES ('Chine', 'Népal', 1236);
INSERT INTO Frontiere VALUES ('Chine', 'Pakistan', 523);
INSERT INTO Frontiere VALUES ('Chine', 'Russie', 4250);
INSERT INTO Frontiere VALUES ('Chine', 'Tadjikistan', 414);
INSERT INTO Frontiere VALUES ('Chine', 'Viêt Nam', 1281);

INSERT INTO Frontiere VALUES ('Russie', 'Azerbaïdjan', 284);
INSERT INTO Frontiere VALUES ('Russie', 'Biélorussie', 959);
INSERT INTO Frontiere VALUES ('Russie', 'Chine', 4250);
INSERT INTO Frontiere VALUES ('Russie', 'Corée du Nord', 19);
INSERT INTO Frontiere VALUES ('Russie', 'Estonie', 294);
INSERT INTO Frontiere VALUES ('Russie', 'Finlande', 1340);
INSERT INTO Frontiere VALUES ('Russie', 'Géorgie', 723);
INSERT INTO Frontiere VALUES ('Russie', 'Kazakhstan', 6846);
INSERT INTO Frontiere VALUES ('Russie', 'Lettonie', 217);
INSERT INTO Frontiere VALUES ('Russie', 'Lituanie', 280);
INSERT INTO Frontiere VALUES ('Russie', 'Mongolie', 3485);
INSERT INTO Frontiere VALUES ('Russie', 'Norvège', 196);
INSERT INTO Frontiere VALUES ('Russie', 'Pologne', 232);
INSERT INTO Frontiere VALUES ('Russie', 'Ukraine', 1576);

INSERT INTO Frontiere VALUES ('Brésil', 'Argentine', 1261);
INSERT INTO Frontiere VALUES ('Brésil', 'Bolivie', 3423);
INSERT INTO Frontiere VALUES ('Brésil', 'Colombie', 1644);
INSERT INTO Frontiere VALUES ('Brésil', 'France', 730);
INSERT INTO Frontiere VALUES ('Brésil', 'Guyana', 1606);
INSERT INTO Frontiere VALUES ('Brésil', 'Paraguay', 1366);
INSERT INTO Frontiere VALUES ('Brésil', 'Pérou', 2995);
INSERT INTO Frontiere VALUES ('Brésil', 'Suriname', 593);
INSERT INTO Frontiere VALUES ('Brésil', 'Uruguay', 1069);
INSERT INTO Frontiere VALUES ('Brésil', 'Venezuela', 2199);

INSERT INTO Frontiere VALUES ('Inde', 'Bangladesh', 4053);
INSERT INTO Frontiere VALUES ('Inde', 'Bhoutan', 605);
INSERT INTO Frontiere VALUES ('Inde', 'Birmanie', 1463);
INSERT INTO Frontiere VALUES ('Inde', 'Chine', 3380);
INSERT INTO Frontiere VALUES ('Inde', 'Népal', 1690);
INSERT INTO Frontiere VALUES ('Inde', 'Pakistan', 2912);

INSERT INTO Frontiere VALUES ('États-Unis', 'Canada', 8893);
INSERT INTO Frontiere VALUES ('États-Unis', 'Mexique', 3141);

INSERT INTO Frontiere VALUES ('Kazakhstan', 'Chine', 1533);
INSERT INTO Frontiere VALUES ('Kazakhstan', 'Kirghizistan', 1051);
INSERT INTO Frontiere VALUES ('Kazakhstan', 'Ouzbékistan', 2203);
INSERT INTO Frontiere VALUES ('Kazakhstan', 'Russie', 6846);
INSERT INTO Frontiere VALUES ('Kazakhstan', 'Turkménistan', 379);

INSERT INTO Frontiere VALUES ('République démocratique du Congo', 'Angola', 2511);
INSERT INTO Frontiere VALUES ('République démocratique du Congo', 'Burundi', 233);
INSERT INTO Frontiere VALUES ('République démocratique du Congo', 'Ouganda', 765);
INSERT INTO Frontiere VALUES ('République démocratique du Congo', 'République centrafricaine', 1577);
INSERT INTO Frontiere VALUES ('République démocratique du Congo', 'République du Congo', 2410);
INSERT INTO Frontiere VALUES ('République démocratique du Congo', 'Rwanda', 217);
INSERT INTO Frontiere VALUES ('République démocratique du Congo', 'Soudan du Sud', 628);
INSERT INTO Frontiere VALUES ('République démocratique du Congo', 'Tanzanie', 459);
INSERT INTO Frontiere VALUES ('République démocratique du Congo', 'Zambie', 1930);

INSERT INTO Frontiere VALUES ('Argentine', 'Bolivie', 742);
INSERT INTO Frontiere VALUES ('Argentine', 'Brésil', 1224);
INSERT INTO Frontiere VALUES ('Argentine', 'Chili', 5150);
INSERT INTO Frontiere VALUES ('Argentine', 'Paraguay', 1699);
INSERT INTO Frontiere VALUES ('Argentine', 'Uruguay', 579);

INSERT INTO Frontiere VALUES ('Canada', 'États-Unis', 8893);

INSERT INTO Frontiere VALUES ('Mongolie', 'Chine', 4677);
INSERT INTO Frontiere VALUES ('Mongolie', 'Russie', 3485);

INSERT INTO Frontiere VALUES ('Mali', 'Algérie', 1376);
INSERT INTO Frontiere VALUES ('Mali', 'Burkina Faso', 1000);
INSERT INTO Frontiere VALUES ('Mali', 'Côte d''Ivoire', 532);
INSERT INTO Frontiere VALUES ('Mali', 'Guinée', 858);
INSERT INTO Frontiere VALUES ('Mali', 'Mauritanie', 2237);
INSERT INTO Frontiere VALUES ('Mali', 'Niger', 821);
INSERT INTO Frontiere VALUES ('Mali', 'Sénégal', 419);

INSERT INTO Frontiere VALUES ('Pakistan', 'Afghanistan', 2430);
INSERT INTO Frontiere VALUES ('Pakistan', 'Chine', 523);
INSERT INTO Frontiere VALUES ('Pakistan', 'Inde', 2912);
INSERT INTO Frontiere VALUES ('Pakistan', 'Iran', 909);

INSERT INTO Frontiere VALUES ('Soudan', 'Égypte', 1273);
INSERT INTO Frontiere VALUES ('Soudan', 'Érythrée', 605);
INSERT INTO Frontiere VALUES ('Soudan', 'Éthiopie', 723);
INSERT INTO Frontiere VALUES ('Soudan', 'Libye', 383);
INSERT INTO Frontiere VALUES ('Soudan', 'République centrafricaine', 483);
INSERT INTO Frontiere VALUES ('Soudan', 'Soudan du Sud', 1937);
INSERT INTO Frontiere VALUES ('Soudan', 'Tchad', 1360);

INSERT INTO Frontiere VALUES ('Bolivie', 'Argentine', 742);
INSERT INTO Frontiere VALUES ('Bolivie', 'Brésil', 3400);
INSERT INTO Frontiere VALUES ('Bolivie', 'Chili', 861);
INSERT INTO Frontiere VALUES ('Bolivie', 'Paraguay', 750);
INSERT INTO Frontiere VALUES ('Bolivie', 'Pérou', 900);

INSERT INTO Frontiere VALUES ('Algérie', 'Libye', 982);
INSERT INTO Frontiere VALUES ('Algérie', 'Mali', 1376);
INSERT INTO Frontiere VALUES ('Algérie', 'Maroc', 1559);
INSERT INTO Frontiere VALUES ('Algérie', 'Mauritanie', 463);
INSERT INTO Frontiere VALUES ('Algérie', 'Niger', 956);
INSERT INTO Frontiere VALUES ('Algérie', 'Sahara occidental', 39);
INSERT INTO Frontiere VALUES ('Algérie', 'Tunisie', 1010);

INSERT INTO Frontiere VALUES ('Ouzbékistan', 'Afghanistan', 137);
INSERT INTO Frontiere VALUES ('Ouzbékistan', 'Kazakhstan', 2203);
INSERT INTO Frontiere VALUES ('Ouzbékistan', 'Kirghizistan', 1099);
INSERT INTO Frontiere VALUES ('Ouzbékistan', 'Tadjikistan', 1161);
INSERT INTO Frontiere VALUES ('Ouzbékistan', 'Turkménistan', 1621);

INSERT INTO Frontiere VALUES ('Chili', 'Argentine', 5150);
INSERT INTO Frontiere VALUES ('Chili', 'Bolivie', 861);
INSERT INTO Frontiere VALUES ('Chili', 'Pérou', 160);

INSERT INTO Frontiere VALUES ('Colombie', 'Brésil', 1643);
INSERT INTO Frontiere VALUES ('Colombie', 'Équateur', 590);
INSERT INTO Frontiere VALUES ('Colombie', 'Panama', 225);
INSERT INTO Frontiere VALUES ('Colombie', 'Pérou', 1496);
INSERT INTO Frontiere VALUES ('Colombie', 'Venezuela', 2050);

INSERT INTO Frontiere VALUES ('Tchad', 'Cameroun', 1094);
INSERT INTO Frontiere VALUES ('Tchad', 'Libye', 1055);
INSERT INTO Frontiere VALUES ('Tchad', 'Niger', 1175);
INSERT INTO Frontiere VALUES ('Tchad', 'Nigeria', 87);
INSERT INTO Frontiere VALUES ('Tchad', 'République centrafricaine', 1197);
INSERT INTO Frontiere VALUES ('Tchad', 'Soudan', 1360);

INSERT INTO Frontiere VALUES ('Birmanie', 'Bangladesh', 193);
INSERT INTO Frontiere VALUES ('Birmanie', 'Chine', 2185);
INSERT INTO Frontiere VALUES ('Birmanie', 'Inde', 1463);
INSERT INTO Frontiere VALUES ('Birmanie', 'Laos', 235);
INSERT INTO Frontiere VALUES ('Birmanie', 'Thaïlande', 1800);

INSERT INTO Frontiere VALUES ('Niger', 'Algérie', 956);
INSERT INTO Frontiere VALUES ('Niger', 'Bénin', 266);
INSERT INTO Frontiere VALUES ('Niger', 'Burkina Faso', 628);
INSERT INTO Frontiere VALUES ('Niger', 'Libye', 354);
INSERT INTO Frontiere VALUES ('Niger', 'Mali', 821);
INSERT INTO Frontiere VALUES ('Niger', 'Nigeria', 1497);
INSERT INTO Frontiere VALUES ('Niger', 'Tchad', 1175);

INSERT INTO Frontiere VALUES ('Zambie', 'Angola', 1110);
INSERT INTO Frontiere VALUES ('Zambie', 'Botswana', 0.15);
INSERT INTO Frontiere VALUES ('Zambie', 'Malawi', 837);
INSERT INTO Frontiere VALUES ('Zambie', 'Mozambique', 419);
INSERT INTO Frontiere VALUES ('Zambie', 'Namibie', 233);
INSERT INTO Frontiere VALUES ('Zambie', 'République démocratique du Congo', 1930);
INSERT INTO Frontiere VALUES ('Zambie', 'Tanzanie', 338);
INSERT INTO Frontiere VALUES ('Zambie', 'Zimbabwe', 797);

INSERT INTO Frontiere VALUES ('Pérou', 'Bolivie', 900);
INSERT INTO Frontiere VALUES ('Pérou', 'Brésil', 1560);
INSERT INTO Frontiere VALUES ('Pérou', 'Chili', 160);
INSERT INTO Frontiere VALUES ('Pérou', 'Colombie', 1496);
INSERT INTO Frontiere VALUES ('Pérou', 'Équateur', 1420);

INSERT INTO Frontiere VALUES ('Afghanistan', 'Chine', 76);
INSERT INTO Frontiere VALUES ('Afghanistan', 'Iran', 936);
INSERT INTO Frontiere VALUES ('Afghanistan', 'Ouzbékistan', 137);
INSERT INTO Frontiere VALUES ('Afghanistan', 'Pakistan', 2430);
INSERT INTO Frontiere VALUES ('Afghanistan', 'Tadjikistan', 1206);
INSERT INTO Frontiere VALUES ('Afghanistan', 'Turkménistan', 744);

INSERT INTO Frontiere VALUES ('République du Congo', 'Angola', 201);
INSERT INTO Frontiere VALUES ('République du Congo', 'Cameroun', 523);
INSERT INTO Frontiere VALUES ('République du Congo', 'Gabon', 1903);
INSERT INTO Frontiere VALUES ('République du Congo', 'République centrafricaine', 467);
INSERT INTO Frontiere VALUES ('République du Congo', 'République démocratique du Congo', 2410);

INSERT INTO Frontiere VALUES ('Iran', 'Afghanistan', 936);
INSERT INTO Frontiere VALUES ('Iran', 'Arménie', 35);
INSERT INTO Frontiere VALUES ('Iran', 'Azerbaïdjan', 611);
INSERT INTO Frontiere VALUES ('Iran', 'Irak', 1458);
INSERT INTO Frontiere VALUES ('Iran', 'Pakistan', 909);
INSERT INTO Frontiere VALUES ('Iran', 'Turkménistan', 992);
INSERT INTO Frontiere VALUES ('Iran', 'Turquie', 499);

INSERT INTO Frontiere VALUES ('Éthiopie', 'Djibouti', 349);
INSERT INTO Frontiere VALUES ('Éthiopie', 'Érythrée', 912);
INSERT INTO Frontiere VALUES ('Éthiopie', 'Kenya', 861);
INSERT INTO Frontiere VALUES ('Éthiopie', 'Somalie', 1600);
INSERT INTO Frontiere VALUES ('Éthiopie', 'Soudan', 723);
INSERT INTO Frontiere VALUES ('Éthiopie', 'Soudan du Sud', 883);

INSERT INTO Frontiere VALUES ('Angola', 'Namibie', 1376);
INSERT INTO Frontiere VALUES ('Angola', 'République démocratique du Congo', 2511);
INSERT INTO Frontiere VALUES ('Angola', 'République du Congo', 201);
INSERT INTO Frontiere VALUES ('Angola', 'Zambie', 1110);

INSERT INTO Frontiere VALUES ('Laos', 'Birmanie', 235);
INSERT INTO Frontiere VALUES ('Laos', 'Cambodge', 541);
INSERT INTO Frontiere VALUES ('Laos', 'Chine', 423);
INSERT INTO Frontiere VALUES ('Laos', 'Thaïlande', 1754);
INSERT INTO Frontiere VALUES ('Laos', 'Viêt Nam', 2130);

INSERT INTO Frontiere VALUES ('Mauritanie', 'Algérie', 463);
INSERT INTO Frontiere VALUES ('Mauritanie', 'Mali', 2237);
INSERT INTO Frontiere VALUES ('Mauritanie', 'Maroc', 1561);
INSERT INTO Frontiere VALUES ('Mauritanie', 'Sénégal', 813);

INSERT INTO Frontiere VALUES ('Venezuela', 'Brésil', 2200);
INSERT INTO Frontiere VALUES ('Venezuela', 'Colombie', 2050);
INSERT INTO Frontiere VALUES ('Venezuela', 'Guyana', 743);

INSERT INTO Frontiere VALUES ('Thaïlande', 'Birmanie', 1800);
INSERT INTO Frontiere VALUES ('Thaïlande', 'Cambodge', 803);
INSERT INTO Frontiere VALUES ('Thaïlande', 'Laos', 1754);
INSERT INTO Frontiere VALUES ('Thaïlande', 'Malaisie', 506);

INSERT INTO Frontiere VALUES ('Afrique du Sud', 'Botswana', 1840);
INSERT INTO Frontiere VALUES ('Afrique du Sud', 'Lesotho', 909);
INSERT INTO Frontiere VALUES ('Afrique du Sud', 'Mozambique', 491);
INSERT INTO Frontiere VALUES ('Afrique du Sud', 'Namibie', 967);
INSERT INTO Frontiere VALUES ('Afrique du Sud', 'Swaziland', 430);
INSERT INTO Frontiere VALUES ('Afrique du Sud', 'Zimbabwe', 225);

INSERT INTO Frontiere VALUES ('Soudan du Sud', 'Éthiopie', 883);
INSERT INTO Frontiere VALUES ('Soudan du Sud', 'Kenya', 232);
INSERT INTO Frontiere VALUES ('Soudan du Sud', 'Ouganda', 435);
INSERT INTO Frontiere VALUES ('Soudan du Sud', 'République centrafricaine', 682);
INSERT INTO Frontiere VALUES ('Soudan du Sud', 'République démocratique du Congo', 628);
INSERT INTO Frontiere VALUES ('Soudan du Sud', 'Soudan', 1937);

INSERT INTO Frontiere VALUES ('Ukraine', 'Biélorussie', 891);
INSERT INTO Frontiere VALUES ('Ukraine', 'Hongrie', 103);
INSERT INTO Frontiere VALUES ('Ukraine', 'Moldavie', 939);
INSERT INTO Frontiere VALUES ('Ukraine', 'Pologne', 526);
INSERT INTO Frontiere VALUES ('Ukraine', 'Roumanie', 531);
INSERT INTO Frontiere VALUES ('Ukraine', 'Russie', 1576);
INSERT INTO Frontiere VALUES ('Ukraine', 'Slovaquie', 97);

INSERT INTO Frontiere VALUES ('Viêt Nam', 'Cambodge', 1228);
INSERT INTO Frontiere VALUES ('Viêt Nam', 'Chine', 1281);
INSERT INTO Frontiere VALUES ('Viêt Nam', 'Laos', 2130);

INSERT INTO Frontiere VALUES ('Mozambique', 'Afrique du Sud', 491);
INSERT INTO Frontiere VALUES ('Mozambique', 'Malawi', 1569);
INSERT INTO Frontiere VALUES ('Mozambique', 'Swaziland', 105);
INSERT INTO Frontiere VALUES ('Mozambique', 'Tanzanie', 756);
INSERT INTO Frontiere VALUES ('Mozambique', 'Zambie', 419);
INSERT INTO Frontiere VALUES ('Mozambique', 'Zimbabwe', 1231);

INSERT INTO Frontiere VALUES ('Arabie saoudite', 'Émirats arabes unis', 457);
INSERT INTO Frontiere VALUES ('Arabie saoudite', 'Irak', 814);
INSERT INTO Frontiere VALUES ('Arabie saoudite', 'Jordanie', 744);
INSERT INTO Frontiere VALUES ('Arabie saoudite', 'Koweït', 222);
INSERT INTO Frontiere VALUES ('Arabie saoudite', 'Oman', 676);
INSERT INTO Frontiere VALUES ('Arabie saoudite', 'Qatar', 60);
INSERT INTO Frontiere VALUES ('Arabie saoudite', 'Yémen', 1458);

INSERT INTO Frontiere VALUES ('République centrafricaine', 'République démocratique du Congo', 1577);
INSERT INTO Frontiere VALUES ('République centrafricaine', 'République du Congo', 467);
INSERT INTO Frontiere VALUES ('République centrafricaine', 'Soudan', 483);
INSERT INTO Frontiere VALUES ('République centrafricaine', 'Soudan du Sud', 682);
INSERT INTO Frontiere VALUES ('République centrafricaine', 'Tchad', 1197);

INSERT INTO Frontiere VALUES ('Libye', 'Algérie', 982);
INSERT INTO Frontiere VALUES ('Libye', 'Égypte', 1115);
INSERT INTO Frontiere VALUES ('Libye', 'Niger', 354);
INSERT INTO Frontiere VALUES ('Libye', 'Soudan', 383);
INSERT INTO Frontiere VALUES ('Libye', 'Tchad', 1055);
INSERT INTO Frontiere VALUES ('Libye', 'Tunisie', 459);

INSERT INTO Frontiere VALUES ('Mexique', 'Belize', 193);
INSERT INTO Frontiere VALUES ('Mexique', 'États-Unis', 3141);
INSERT INTO Frontiere VALUES ('Mexique', 'Guatemala', 959);

INSERT INTO Frontiere VALUES ('Bangladesh', 'Birmanie', 193);
INSERT INTO Frontiere VALUES ('Bangladesh', 'Inde', 4053);

INSERT INTO Frontiere VALUES ('France', 'Allemagne', 451);
INSERT INTO Frontiere VALUES ('France', 'Andorre', 57);
INSERT INTO Frontiere VALUES ('France', 'Belgique', 620);
INSERT INTO Frontiere VALUES ('France', 'Brésil', 730);
INSERT INTO Frontiere VALUES ('France', 'Espagne', 623);
INSERT INTO Frontiere VALUES ('France', 'Italie', 488);
INSERT INTO Frontiere VALUES ('France', 'Luxembourg', 73);
INSERT INTO Frontiere VALUES ('France', 'Monaco', 4);
INSERT INTO Frontiere VALUES ('France', 'Pays-Bas', 10);
INSERT INTO Frontiere VALUES ('France', 'Suisse', 573);
INSERT INTO Frontiere VALUES ('France', 'Suriname', 510);

INSERT INTO Frontiere VALUES ('Nigeria', 'Bénin', 773);
INSERT INTO Frontiere VALUES ('Nigeria', 'Cameroun', 1690);
INSERT INTO Frontiere VALUES ('Nigeria', 'Niger', 1497);
INSERT INTO Frontiere VALUES ('Nigeria', 'Tchad', 87);

INSERT INTO Frontiere VALUES ('Botswana', 'Afrique du Sud', 1840);
INSERT INTO Frontiere VALUES ('Botswana', 'Namibie', 1360);
INSERT INTO Frontiere VALUES ('Botswana', 'Zambie', 0.15);
INSERT INTO Frontiere VALUES ('Botswana', 'Zimbabwe', 813);

INSERT INTO Frontiere VALUES ('Namibie', 'Afrique du Sud', 967);
INSERT INTO Frontiere VALUES ('Namibie', 'Angola', 1376);
INSERT INTO Frontiere VALUES ('Namibie', 'Botswana', 1360);
INSERT INTO Frontiere VALUES ('Namibie', 'Zambie', 233);

INSERT INTO Frontiere VALUES ('Kirghizistan', 'Chine', 858);
INSERT INTO Frontiere VALUES ('Kirghizistan', 'Kazakhstan', 1051);
INSERT INTO Frontiere VALUES ('Kirghizistan', 'Ouzbékistan', 1099);
INSERT INTO Frontiere VALUES ('Kirghizistan', 'Tadjikistan', 870);

INSERT INTO Frontiere VALUES ('Tanzanie', 'Burundi', 451);
INSERT INTO Frontiere VALUES ('Tanzanie', 'Kenya', 769);
INSERT INTO Frontiere VALUES ('Tanzanie', 'Malawi', 475);
INSERT INTO Frontiere VALUES ('Tanzanie', 'Mozambique', 756);
INSERT INTO Frontiere VALUES ('Tanzanie', 'Ouganda', 396);
INSERT INTO Frontiere VALUES ('Tanzanie', 'République démocratique du Congo', 459);
INSERT INTO Frontiere VALUES ('Tanzanie', 'Rwanda', 217);
INSERT INTO Frontiere VALUES ('Tanzanie', 'Zambie', 338);

INSERT INTO Frontiere VALUES ('Cameroun', 'Gabon', 298);
INSERT INTO Frontiere VALUES ('Cameroun', 'Guinée équatoriale', 189);
INSERT INTO Frontiere VALUES ('Cameroun', 'Nigeria', 1690);
INSERT INTO Frontiere VALUES ('Cameroun', 'République du Congo', 523);
INSERT INTO Frontiere VALUES ('Cameroun', 'Tchad', 1094);
INSERT INTO Frontiere VALUES ('Cameroun', 'République centrafricaine', 822);

INSERT INTO Frontiere VALUES ('Paraguay', 'Argentine', 1699);
INSERT INTO Frontiere VALUES ('Paraguay', 'Bolivie', 750);
INSERT INTO Frontiere VALUES ('Paraguay', 'Brésil', 1290);

INSERT INTO Frontiere VALUES ('Turkménistan', 'Afghanistan', 744);
INSERT INTO Frontiere VALUES ('Turkménistan', 'Iran', 992);
INSERT INTO Frontiere VALUES ('Turkménistan', 'Kazakhstan', 379);
INSERT INTO Frontiere VALUES ('Turkménistan', 'Ouzbékistan', 1621);

INSERT INTO Frontiere VALUES ('Tadjikistan', 'Afghanistan', 1206);
INSERT INTO Frontiere VALUES ('Tadjikistan', 'Chine', 414);
INSERT INTO Frontiere VALUES ('Tadjikistan', 'Kirghizistan', 870);
INSERT INTO Frontiere VALUES ('Tadjikistan', 'Ouzbékistan', 1161);

INSERT INTO Frontiere VALUES ('Irak', 'Arabie saoudite', 814);
INSERT INTO Frontiere VALUES ('Irak', 'Iran', 1458);
INSERT INTO Frontiere VALUES ('Irak', 'Jordanie', 181);
INSERT INTO Frontiere VALUES ('Irak', 'Koweït', 240);
INSERT INTO Frontiere VALUES ('Irak', 'Syrie', 605);
INSERT INTO Frontiere VALUES ('Irak', 'Turquie', 352);

INSERT INTO Frontiere VALUES ('Allemagne', 'Autriche', 784);
INSERT INTO Frontiere VALUES ('Allemagne', 'Belgique', 167);
INSERT INTO Frontiere VALUES ('Allemagne', 'Danemark', 68);
INSERT INTO Frontiere VALUES ('Allemagne', 'France', 451);
INSERT INTO Frontiere VALUES ('Allemagne', 'Luxembourg', 138);
INSERT INTO Frontiere VALUES ('Allemagne', 'Pays-Bas', 577);
INSERT INTO Frontiere VALUES ('Allemagne', 'Pologne', 456);
INSERT INTO Frontiere VALUES ('Allemagne', 'République Tchèque', 646);
INSERT INTO Frontiere VALUES ('Allemagne', 'Suisse', 334);

INSERT INTO Frontiere VALUES ('Kenya', 'Éthiopie', 861);
INSERT INTO Frontiere VALUES ('Kenya', 'Ouganda', 933);
INSERT INTO Frontiere VALUES ('Kenya', 'Somalie', 682);
INSERT INTO Frontiere VALUES ('Kenya', 'Soudan du Sud', 232);
INSERT INTO Frontiere VALUES ('Kenya', 'Tanzanie', 769);

INSERT INTO Frontiere VALUES ('Guinée', 'Côte d''Ivoire', 610);
INSERT INTO Frontiere VALUES ('Guinée', 'Guinée-Bissau', 386);
INSERT INTO Frontiere VALUES ('Guinée', 'Liberia', 563);
INSERT INTO Frontiere VALUES ('Guinée', 'Mali', 858);
INSERT INTO Frontiere VALUES ('Guinée', 'Sénégal', 330);
INSERT INTO Frontiere VALUES ('Guinée', 'Sierra Leone', 652);

INSERT INTO Frontiere VALUES ('Burkina Faso', 'Bénin', 306);
INSERT INTO Frontiere VALUES ('Burkina Faso', 'Côte d''Ivoire', 584);
INSERT INTO Frontiere VALUES ('Burkina Faso', 'Ghana', 549);
INSERT INTO Frontiere VALUES ('Burkina Faso', 'Mali', 1000);
INSERT INTO Frontiere VALUES ('Burkina Faso', 'Niger', 628);
INSERT INTO Frontiere VALUES ('Burkina Faso', 'Togo', 126);

INSERT INTO Frontiere VALUES ('Côte d''Ivoire', 'Burkina Faso', 584);
INSERT INTO Frontiere VALUES ('Côte d''Ivoire', 'Ghana', 668);
INSERT INTO Frontiere VALUES ('Côte d''Ivoire', 'Guinée', 610);
INSERT INTO Frontiere VALUES ('Côte d''Ivoire', 'Liberia', 716);
INSERT INTO Frontiere VALUES ('Côte d''Ivoire', 'Mali', 532);

INSERT INTO Frontiere VALUES ('Zimbabwe', 'Afrique du Sud', 225);
INSERT INTO Frontiere VALUES ('Zimbabwe', 'Botswana', 813);
INSERT INTO Frontiere VALUES ('Zimbabwe', 'Mozambique', 1231);
INSERT INTO Frontiere VALUES ('Zimbabwe', 'Zambie', 797);

INSERT INTO Frontiere VALUES ('Guyana', 'Brésil', 1605);
INSERT INTO Frontiere VALUES ('Guyana', 'Suriname', 600);
INSERT INTO Frontiere VALUES ('Guyana', 'Venezuela', 743);

INSERT INTO Frontiere VALUES ('Népal', 'Chine', 1236);
INSERT INTO Frontiere VALUES ('Népal', 'Inde', 1690);

INSERT INTO Frontiere VALUES ('Biélorussie', 'Lettonie', 141);
INSERT INTO Frontiere VALUES ('Biélorussie', 'Lituanie', 502);
INSERT INTO Frontiere VALUES ('Biélorussie', 'Pologne', 407);
INSERT INTO Frontiere VALUES ('Biélorussie', 'Russie', 959);
INSERT INTO Frontiere VALUES ('Biélorussie', 'Ukraine', 891);

INSERT INTO Frontiere VALUES ('Malawi', 'Mozambique', 1569);
INSERT INTO Frontiere VALUES ('Malawi', 'Tanzanie', 475);
INSERT INTO Frontiere VALUES ('Malawi', 'Zambie', 837);

INSERT INTO Frontiere VALUES ('Indonésie', 'Malaisie', 1782);
INSERT INTO Frontiere VALUES ('Indonésie', 'Papouasie-Nouvelle-Guinée', 820);
INSERT INTO Frontiere VALUES ('Indonésie', 'Timor oriental', 228);

INSERT INTO Frontiere VALUES ('Pologne', 'Allemagne', 456);
INSERT INTO Frontiere VALUES ('Pologne', 'Biélorussie', 407);
INSERT INTO Frontiere VALUES ('Pologne', 'Lituanie', 91);
INSERT INTO Frontiere VALUES ('Pologne', 'République Tchèque', 658);
INSERT INTO Frontiere VALUES ('Pologne', 'Russie', 232);
INSERT INTO Frontiere VALUES ('Pologne', 'Slovaquie', 444);
INSERT INTO Frontiere VALUES ('Pologne', 'Ukraine', 526);

INSERT INTO Frontiere VALUES ('Ouganda', 'Kenya', 933);
INSERT INTO Frontiere VALUES ('Ouganda', 'République démocratique du Congo', 765);
INSERT INTO Frontiere VALUES ('Ouganda', 'Rwanda', 169);
INSERT INTO Frontiere VALUES ('Ouganda', 'Soudan du Sud', 435);
INSERT INTO Frontiere VALUES ('Ouganda', 'Tanzanie', 396);

INSERT INTO Frontiere VALUES ('Finlande', 'Norvège', 736);
INSERT INTO Frontiere VALUES ('Finlande', 'Russie', 1340);
INSERT INTO Frontiere VALUES ('Finlande', 'Suède', 614);

INSERT INTO Frontiere VALUES ('Malaisie', 'Brunei', 381);
INSERT INTO Frontiere VALUES ('Malaisie', 'Indonésie', 1782);
INSERT INTO Frontiere VALUES ('Malaisie', 'Thaïlande', 506);

INSERT INTO Frontiere VALUES ('Égypte', 'Israël', 266);
INSERT INTO Frontiere VALUES ('Égypte', 'Libye', 1115);
INSERT INTO Frontiere VALUES ('Égypte', 'Soudan', 1273);

INSERT INTO Frontiere VALUES ('Sénégal', 'Gambie', 740);
INSERT INTO Frontiere VALUES ('Sénégal', 'Guinée', 330);
INSERT INTO Frontiere VALUES ('Sénégal', 'Guinée-Bissau', 338);
INSERT INTO Frontiere VALUES ('Sénégal', 'Mali', 419);
INSERT INTO Frontiere VALUES ('Sénégal', 'Mauritanie', 813);

INSERT INTO Frontiere VALUES ('Turquie', 'Arménie', 268);
INSERT INTO Frontiere VALUES ('Turquie', 'Azerbaïdjan', 9);
INSERT INTO Frontiere VALUES ('Turquie', 'Bulgarie', 240);
INSERT INTO Frontiere VALUES ('Turquie', 'Géorgie', 252);
INSERT INTO Frontiere VALUES ('Turquie', 'Grèce', 206);
INSERT INTO Frontiere VALUES ('Turquie', 'Irak', 352);
INSERT INTO Frontiere VALUES ('Turquie', 'Iran', 499);
INSERT INTO Frontiere VALUES ('Turquie', 'Syrie', 822);

INSERT INTO Frontiere VALUES ('Cambodge', 'Laos', 541);
INSERT INTO Frontiere VALUES ('Cambodge', 'Thaïlande', 803);
INSERT INTO Frontiere VALUES ('Cambodge', 'Viêt Nam', 1228);

INSERT INTO Frontiere VALUES ('Autriche', 'Allemagne', 784);
INSERT INTO Frontiere VALUES ('Autriche', 'Hongrie', 366);
INSERT INTO Frontiere VALUES ('Autriche', 'Italie', 430);
INSERT INTO Frontiere VALUES ('Autriche', 'Liechtenstein', 35);
INSERT INTO Frontiere VALUES ('Autriche', 'République Tchèque', 362);
INSERT INTO Frontiere VALUES ('Autriche', 'Slovaquie', 91);
INSERT INTO Frontiere VALUES ('Autriche', 'Slovénie', 330);
INSERT INTO Frontiere VALUES ('Autriche', 'Suisse', 164);

INSERT INTO Frontiere VALUES ('Gabon', 'Cameroun', 298);
INSERT INTO Frontiere VALUES ('Gabon', 'Guinée équatoriale', 350);
INSERT INTO Frontiere VALUES ('Gabon', 'République du Congo', 1903);

INSERT INTO Frontiere VALUES ('Norvège', 'Finlande', 736);
INSERT INTO Frontiere VALUES ('Norvège', 'Russie', 196);
INSERT INTO Frontiere VALUES ('Norvège', 'Suède', 1619);

INSERT INTO Frontiere VALUES ('Roumanie', 'Bulgarie', 608);
INSERT INTO Frontiere VALUES ('Roumanie', 'Hongrie', 443);
INSERT INTO Frontiere VALUES ('Roumanie', 'Moldavie', 450);
INSERT INTO Frontiere VALUES ('Roumanie', 'Serbie', 476);
INSERT INTO Frontiere VALUES ('Roumanie', 'Ukraine', 531);

INSERT INTO Frontiere VALUES ('Somalie', 'Djibouti', 58);
INSERT INTO Frontiere VALUES ('Somalie', 'Éthiopie', 1600);
INSERT INTO Frontiere VALUES ('Somalie', 'Kenya', 682);

INSERT INTO Frontiere VALUES ('Syrie', 'Irak', 605);
INSERT INTO Frontiere VALUES ('Syrie', 'Israël', 76);
INSERT INTO Frontiere VALUES ('Syrie', 'Jordanie', 375);
INSERT INTO Frontiere VALUES ('Syrie', 'Liban', 375);
INSERT INTO Frontiere VALUES ('Syrie', 'Turquie', 822);

INSERT INTO Frontiere VALUES ('Suède', 'Finlande', 614);
INSERT INTO Frontiere VALUES ('Suède', 'Norvège', 1619);

INSERT INTO Frontiere VALUES ('Croatie', 'Bosnie-Herzégovine', 932);
INSERT INTO Frontiere VALUES ('Croatie', 'Hongrie', 329);
INSERT INTO Frontiere VALUES ('Croatie', 'Monténégro', 25);
INSERT INTO Frontiere VALUES ('Croatie', 'Serbie', 241);
INSERT INTO Frontiere VALUES ('Croatie', 'Slovénie', 670);

INSERT INTO Frontiere VALUES ('Hongrie', 'Autriche', 366);
INSERT INTO Frontiere VALUES ('Hongrie', 'Croatie', 329);
INSERT INTO Frontiere VALUES ('Hongrie', 'Roumanie', 443);
INSERT INTO Frontiere VALUES ('Hongrie', 'Serbie', 151);
INSERT INTO Frontiere VALUES ('Hongrie', 'Slovaquie', 677);
INSERT INTO Frontiere VALUES ('Hongrie', 'Slovénie', 102);
INSERT INTO Frontiere VALUES ('Hongrie', 'Ukraine', 103);

INSERT INTO Frontiere VALUES ('Ghana', 'Burkina Faso', 549);
INSERT INTO Frontiere VALUES ('Ghana', 'Côte d''Ivoire', 668);
INSERT INTO Frontiere VALUES ('Ghana', 'Togo', 877);

INSERT INTO Frontiere VALUES ('Sahara occidental', 'Algérie', 39);
INSERT INTO Frontiere VALUES ('Sahara occidental', 'Mauritanie', 1561);
INSERT INTO Frontiere VALUES ('Sahara occidental', 'Maroc', 443);

INSERT INTO Frontiere VALUES ('Serbie', 'Albanie', 115);
INSERT INTO Frontiere VALUES ('Serbie', 'Bosnie-Herzégovine', 302);
INSERT INTO Frontiere VALUES ('Serbie', 'Bulgarie', 318);
INSERT INTO Frontiere VALUES ('Serbie', 'Croatie', 241);
INSERT INTO Frontiere VALUES ('Serbie', 'Hongrie', 151);
INSERT INTO Frontiere VALUES ('Serbie', 'Macédoine du Nord', 221);
INSERT INTO Frontiere VALUES ('Serbie', 'Monténégro', 203);
INSERT INTO Frontiere VALUES ('Serbie', 'Roumanie', 476);

INSERT INTO Frontiere VALUES ('Maroc', 'Algérie', 1601);
INSERT INTO Frontiere VALUES ('Maroc', 'Espagne', 16);
INSERT INTO Frontiere VALUES ('Maroc', 'Sahara occidental', 443);

INSERT INTO Frontiere VALUES ('Azerbaïdjan', 'Arménie', 787);
INSERT INTO Frontiere VALUES ('Azerbaïdjan', 'Géorgie', 322);
INSERT INTO Frontiere VALUES ('Azerbaïdjan', 'Iran', 611);
INSERT INTO Frontiere VALUES ('Azerbaïdjan', 'Russie', 284);
INSERT INTO Frontiere VALUES ('Azerbaïdjan', 'Turquie', 9);

INSERT INTO Frontiere VALUES ('Équateur', 'Colombie', 590);
INSERT INTO Frontiere VALUES ('Équateur', 'Pérou', 1420);

INSERT INTO Frontiere VALUES ('Bénin', 'Burkina Faso', 306);
INSERT INTO Frontiere VALUES ('Bénin', 'Niger', 266);
INSERT INTO Frontiere VALUES ('Bénin', 'Nigeria', 773);
INSERT INTO Frontiere VALUES ('Bénin', 'Togo', 644);

INSERT INTO Frontiere VALUES ('Italie', 'Autriche', 430);
INSERT INTO Frontiere VALUES ('Italie', 'France', 488);
INSERT INTO Frontiere VALUES ('Italie', 'Saint-Marin', 39);
INSERT INTO Frontiere VALUES ('Italie', 'Slovénie', 232);
INSERT INTO Frontiere VALUES ('Italie', 'Suisse', 740);
INSERT INTO Frontiere VALUES ('Italie', 'Vatican', 3);

INSERT INTO Frontiere VALUES ('Espagne', 'Andorre', 64);
INSERT INTO Frontiere VALUES ('Espagne', 'France', 623);
INSERT INTO Frontiere VALUES ('Espagne', 'Maroc', 16);
INSERT INTO Frontiere VALUES ('Espagne', 'Portugal', 1214);
INSERT INTO Frontiere VALUES ('Espagne', 'Royaume-Uni', 1);

INSERT INTO Frontiere VALUES ('République Tchèque', 'Allemagne', 646);
INSERT INTO Frontiere VALUES ('République Tchèque', 'Autriche', 362);
INSERT INTO Frontiere VALUES ('République Tchèque', 'Pologne', 658);
INSERT INTO Frontiere VALUES ('République Tchèque', 'Slovaquie', 215);

INSERT INTO Frontiere VALUES ('Suisse', 'Allemagne', 334);
INSERT INTO Frontiere VALUES ('Suisse', 'Autriche', 164);
INSERT INTO Frontiere VALUES ('Suisse', 'France', 573);
INSERT INTO Frontiere VALUES ('Suisse', 'Italie', 740);
INSERT INTO Frontiere VALUES ('Suisse', 'Liechtenstein', 41);

INSERT INTO Frontiere VALUES ('Bulgarie', 'Grèce', 494);
INSERT INTO Frontiere VALUES ('Bulgarie', 'Macédoine du Nord', 148);
INSERT INTO Frontiere VALUES ('Bulgarie', 'Roumanie', 608);
INSERT INTO Frontiere VALUES ('Bulgarie', 'Serbie', 318);
INSERT INTO Frontiere VALUES ('Bulgarie', 'Turquie', 240);

INSERT INTO Frontiere VALUES ('Yémen', 'Arabie saoudite', 1458);
INSERT INTO Frontiere VALUES ('Yémen', 'Oman', 288);

INSERT INTO Frontiere VALUES ('Suriname', 'Brésil', 593);
INSERT INTO Frontiere VALUES ('Suriname', 'France', 510);
INSERT INTO Frontiere VALUES ('Suriname', 'Guyana', 600);

INSERT INTO Frontiere VALUES ('Guatemala', 'Belize', 266);
INSERT INTO Frontiere VALUES ('Guatemala', 'Honduras', 256);
INSERT INTO Frontiere VALUES ('Guatemala', 'Mexique', 959);
INSERT INTO Frontiere VALUES ('Guatemala', 'Salvador', 203);

INSERT INTO Frontiere VALUES ('Corée du Nord', 'Chine', 1416);
INSERT INTO Frontiere VALUES ('Corée du Nord', 'Corée du Sud', 238);
INSERT INTO Frontiere VALUES ('Corée du Nord', 'Russie', 19);

INSERT INTO Frontiere VALUES ('Togo', 'Bénin', 644);
INSERT INTO Frontiere VALUES ('Togo', 'Burkina Faso', 126);
INSERT INTO Frontiere VALUES ('Togo', 'Ghana', 877);

INSERT INTO Frontiere VALUES ('Érythrée', 'Djibouti', 109);
INSERT INTO Frontiere VALUES ('Érythrée', 'Éthiopie', 912);
INSERT INTO Frontiere VALUES ('Érythrée', 'Soudan', 605);

INSERT INTO Frontiere VALUES ('Liberia', 'Côte d''Ivoire', 716);
INSERT INTO Frontiere VALUES ('Liberia', 'Guinée', 563);
INSERT INTO Frontiere VALUES ('Liberia', 'Sierra Leone', 306);

INSERT INTO Frontiere VALUES ('Uruguay', 'Argentine', 579);
INSERT INTO Frontiere VALUES ('Uruguay', 'Brésil', 985);

INSERT INTO Frontiere VALUES ('Jordanie', 'Arabie saoudite', 744);
INSERT INTO Frontiere VALUES ('Jordanie', 'Irak', 181);
INSERT INTO Frontiere VALUES ('Jordanie', 'Israël', 238);
INSERT INTO Frontiere VALUES ('Jordanie', 'Syrie', 375);

INSERT INTO Frontiere VALUES ('Slovaquie', 'Autriche', 91);
INSERT INTO Frontiere VALUES ('Slovaquie', 'Hongrie', 677);
INSERT INTO Frontiere VALUES ('Slovaquie', 'Pologne', 444);
INSERT INTO Frontiere VALUES ('Slovaquie', 'République Tchèque', 215);
INSERT INTO Frontiere VALUES ('Slovaquie', 'Ukraine', 97);

INSERT INTO Frontiere VALUES ('Géorgie', 'Arménie', 164);
INSERT INTO Frontiere VALUES ('Géorgie', 'Azerbaïdjan', 322);
INSERT INTO Frontiere VALUES ('Géorgie', 'Russie', 723);
INSERT INTO Frontiere VALUES ('Géorgie', 'Turquie', 252);

INSERT INTO Frontiere VALUES ('Tunisie', 'Algérie', 1010);
INSERT INTO Frontiere VALUES ('Tunisie', 'Libye', 459);

INSERT INTO Frontiere VALUES ('Bosnie-Herzégovine', 'Croatie', 932);
INSERT INTO Frontiere VALUES ('Bosnie-Herzégovine', 'Monténégro', 225);
INSERT INTO Frontiere VALUES ('Bosnie-Herzégovine', 'Serbie', 302);

INSERT INTO Frontiere VALUES ('Moldavie', 'Roumanie', 450);
INSERT INTO Frontiere VALUES ('Moldavie', 'Ukraine', 939);

INSERT INTO Frontiere VALUES ('Belgique', 'Allemagne', 167);
INSERT INTO Frontiere VALUES ('Belgique', 'France', 620);
INSERT INTO Frontiere VALUES ('Belgique', 'Luxembourg', 148);
INSERT INTO Frontiere VALUES ('Belgique', 'Pays-Bas', 450);

INSERT INTO Frontiere VALUES ('Oman', 'Arabie saoudite', 676);
INSERT INTO Frontiere VALUES ('Oman', 'Émirats arabes unis', 410);
INSERT INTO Frontiere VALUES ('Oman', 'Yémen', 288);

INSERT INTO Frontiere VALUES ('Slovénie', 'Autriche', 330);
INSERT INTO Frontiere VALUES ('Slovénie', 'Croatie', 670);
INSERT INTO Frontiere VALUES ('Slovénie', 'Hongrie', 102);
INSERT INTO Frontiere VALUES ('Slovénie', 'Italie', 232);

INSERT INTO Frontiere VALUES ('Lituanie', 'Biélorussie', 502);
INSERT INTO Frontiere VALUES ('Lituanie', 'Lettonie', 453);
INSERT INTO Frontiere VALUES ('Lituanie', 'Pologne', 91);
INSERT INTO Frontiere VALUES ('Lituanie', 'Russie', 280);

INSERT INTO Frontiere VALUES ('Arménie', 'Azerbaïdjan', 787);
INSERT INTO Frontiere VALUES ('Arménie', 'Géorgie', 164);
INSERT INTO Frontiere VALUES ('Arménie', 'Iran', 35);
INSERT INTO Frontiere VALUES ('Arménie', 'Turquie', 268);

INSERT INTO Frontiere VALUES ('Grèce', 'Albanie', 282);
INSERT INTO Frontiere VALUES ('Grèce', 'Bulgarie', 494);
INSERT INTO Frontiere VALUES ('Grèce', 'Macédoine du Nord', 246);
INSERT INTO Frontiere VALUES ('Grèce', 'Turquie', 206);

INSERT INTO Frontiere VALUES ('Portugal', 'Espagne', 1214);

INSERT INTO Frontiere VALUES ('Lettonie', 'Biélorussie', 141);
INSERT INTO Frontiere VALUES ('Lettonie', 'Estonie', 339);
INSERT INTO Frontiere VALUES ('Lettonie', 'Lituanie', 453);
INSERT INTO Frontiere VALUES ('Lettonie', 'Russie', 217);

INSERT INTO Frontiere VALUES ('Bhoutan', 'Chine', 470);
INSERT INTO Frontiere VALUES ('Bhoutan', 'Inde', 605);

INSERT INTO Frontiere VALUES ('Pays-Bas', 'Allemagne', 577);
INSERT INTO Frontiere VALUES ('Pays-Bas', 'Belgique', 450);
INSERT INTO Frontiere VALUES ('Pays-Bas', 'France', 10);

INSERT INTO Frontiere VALUES ('Burundi', 'République démocratique du Congo', 233);
INSERT INTO Frontiere VALUES ('Burundi', 'Rwanda', 290);
INSERT INTO Frontiere VALUES ('Burundi', 'Tanzanie', 451);

INSERT INTO Frontiere VALUES ('Sierra Leone', 'Guinée', 652);
INSERT INTO Frontiere VALUES ('Sierra Leone', 'Liberia', 306);

INSERT INTO Frontiere VALUES ('Lesotho', 'Afrique du Sud', 909);

INSERT INTO Frontiere VALUES ('Rwanda', 'Burundi', 290);
INSERT INTO Frontiere VALUES ('Rwanda', 'Ouganda', 169);
INSERT INTO Frontiere VALUES ('Rwanda', 'République démocratique du Congo', 217);
INSERT INTO Frontiere VALUES ('Rwanda', 'Tanzanie', 217);

INSERT INTO Frontiere VALUES ('Émirats arabes unis', 'Arabie saoudite', 457);
INSERT INTO Frontiere VALUES ('Émirats arabes unis', 'Oman', 410);

INSERT INTO Frontiere VALUES ('Honduras', 'Guatemala', 256);
INSERT INTO Frontiere VALUES ('Honduras', 'Nicaragua', 342);
INSERT INTO Frontiere VALUES ('Honduras', 'Salvador', 256);

INSERT INTO Frontiere VALUES ('Papouasie-Nouvelle-Guinée', 'Indonésie', 820);

INSERT INTO Frontiere VALUES ('Macédoine du Nord', 'Albanie', 151);
INSERT INTO Frontiere VALUES ('Macédoine du Nord', 'Bulgarie', 148);
INSERT INTO Frontiere VALUES ('Macédoine du Nord', 'Grèce', 246);
INSERT INTO Frontiere VALUES ('Macédoine du Nord', 'Serbie', 221);

INSERT INTO Frontiere VALUES ('Gambie', 'Sénégal', 740);

INSERT INTO Frontiere VALUES ('Guinée-Bissau', 'Guinée', 386);
INSERT INTO Frontiere VALUES ('Guinée-Bissau', 'Sénégal', 338);

INSERT INTO Frontiere VALUES ('Albanie', 'Grèce', 282);
INSERT INTO Frontiere VALUES ('Albanie', 'Macédoine du Nord', 151);
INSERT INTO Frontiere VALUES ('Albanie', 'Monténégro', 172);
INSERT INTO Frontiere VALUES ('Albanie', 'Serbie', 115);

INSERT INTO Frontiere VALUES ('Kosovo', 'Serbie', 352);
INSERT INTO Frontiere VALUES ('Kosovo', 'Macédoine du Nord', 159);
INSERT INTO Frontiere VALUES ('Kosovo', 'Albanie', 112);
INSERT INTO Frontiere VALUES ('Kosovo', 'Monténégro', 79);

INSERT INTO Frontiere VALUES ('Israël', 'Égypte', 266);
INSERT INTO Frontiere VALUES ('Israël', 'Jordanie', 238);
INSERT INTO Frontiere VALUES ('Israël', 'Liban', 79);
INSERT INTO Frontiere VALUES ('Israël', 'Syrie', 76);

INSERT INTO Frontiere VALUES ('Nicaragua', 'Costa Rica', 309);
INSERT INTO Frontiere VALUES ('Nicaragua', 'Honduras', 342);

INSERT INTO Frontiere VALUES ('Costa Rica', 'Nicaragua', 309);
INSERT INTO Frontiere VALUES ('Costa Rica', 'Panama', 330);

INSERT INTO Frontiere VALUES ('Estonie', 'Lettonie', 339);
INSERT INTO Frontiere VALUES ('Estonie', 'Russie', 294);

INSERT INTO Frontiere VALUES ('Monténégro', 'Albanie', 172);
INSERT INTO Frontiere VALUES ('Monténégro', 'Bosnie-Herzégovine', 225);
INSERT INTO Frontiere VALUES ('Monténégro', 'Croatie', 25);
INSERT INTO Frontiere VALUES ('Monténégro', 'Serbie', 203);

INSERT INTO Frontiere VALUES ('Panama', 'Colombie', 225);
INSERT INTO Frontiere VALUES ('Panama', 'Costa Rica', 330);

INSERT INTO Frontiere VALUES ('Guinée équatoriale', 'Cameroun', 189);
INSERT INTO Frontiere VALUES ('Guinée équatoriale', 'Gabon', 350);

INSERT INTO Frontiere VALUES ('Swaziland', 'Afrique du Sud', 430);
INSERT INTO Frontiere VALUES ('Swaziland', 'Mozambique', 105);

INSERT INTO Frontiere VALUES ('Djibouti', 'Érythrée', 109);
INSERT INTO Frontiere VALUES ('Djibouti', 'Éthiopie', 349);
INSERT INTO Frontiere VALUES ('Djibouti', 'Somalie', 58);

INSERT INTO Frontiere VALUES ('Palestine', 'Égypte', 11);
INSERT INTO Frontiere VALUES ('Palestine', 'Israël', 358);
INSERT INTO Frontiere VALUES ('Palestine', 'Jordanie', 97);

INSERT INTO Frontiere VALUES ('Royaume-Uni', 'Chypre', 152);
INSERT INTO Frontiere VALUES ('Royaume-Uni', 'Espagne', 1);
INSERT INTO Frontiere VALUES ('Royaume-Uni', 'Irlande', 360);

INSERT INTO Frontiere VALUES ('Koweït', 'Arabie saoudite', 222);
INSERT INTO Frontiere VALUES ('Koweït', 'Irak', 240);

INSERT INTO Frontiere VALUES ('Belize', 'Guatemala', 266);
INSERT INTO Frontiere VALUES ('Belize', 'Mexique', 193);

INSERT INTO Frontiere VALUES ('Salvador', 'Guatemala', 203);
INSERT INTO Frontiere VALUES ('Salvador', 'Honduras', 256);

INSERT INTO Frontiere VALUES ('Liban', 'Israël', 79);
INSERT INTO Frontiere VALUES ('Liban', 'Syrie', 375);

INSERT INTO Frontiere VALUES ('Brunei', 'Malaisie', 381);

INSERT INTO Frontiere VALUES ('République dominicaine', 'Haïti', 360);

INSERT INTO Frontiere VALUES ('Haïti', 'République dominicaine', 360);

INSERT INTO Frontiere VALUES ('Irlande', 'Royaume-Uni', 360);

INSERT INTO Frontiere VALUES ('Luxembourg', 'Allemagne', 138);
INSERT INTO Frontiere VALUES ('Luxembourg', 'Belgique', 148);
INSERT INTO Frontiere VALUES ('Luxembourg', 'France', 73);

INSERT INTO Frontiere VALUES ('Corée du Sud', 'Corée du Nord', 238);

INSERT INTO Frontiere VALUES ('Timor oriental', 'Indonésie', 228);

INSERT INTO Frontiere VALUES ('Chypre', 'Royaume-Uni', 152);

INSERT INTO Frontiere VALUES ('Andorre', 'Espagne', 64);
INSERT INTO Frontiere VALUES ('Andorre', 'France', 57);

INSERT INTO Frontiere VALUES ('Liechtenstein', 'Autriche', 35);
INSERT INTO Frontiere VALUES ('Liechtenstein', 'Suisse', 41);

INSERT INTO Frontiere VALUES ('Danemark', 'Allemagne', 68);

INSERT INTO Frontiere VALUES ('Qatar', 'Arabie saoudite', 60);

INSERT INTO Frontiere VALUES ('Saint-Marin', 'Italie', 39);

INSERT INTO Frontiere VALUES ('Monaco', 'France', 5);

INSERT INTO Frontiere VALUES ('Vatican', 'Italie', 3);
COMMIT;



-- Afrique
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Kilimandjaro - Kibo', 5892, 'Vallée du grand rift');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Tanzanie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Kenya', 5199, 'Vallée du grand rift');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Kenya');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Kilimandjaro - Mawenzi', 5149, 'Vallée du grand rift');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Tanzanie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Stanley', 5109, 'Rwenzori');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'République démocratique du Congo');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Ouganda');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Speke', 4890, 'Rwenzori');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Ouganda');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Baker', 4844, 'Rwenzori');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Ouganda');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Emin', 4798, 'Rwenzori');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'République démocratique du Congo');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Gessi', 4715, 'Rwenzori');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Ouganda');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Méru', 4565, 'Vallée du grand rift');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Tanzanie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Ras Dashan', 4550, 'Plateaux d''Éthiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Éthiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Karisimbi', 4507, 'Montagnes des Virunga');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'République démocratique du Congo');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Rwanda');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Mikeno', 4437, 'Montagnes des Virunga');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'République démocratique du Congo');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Bwahit', 4430, 'Plateaux d''Éthiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Éthiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Silki', 4420, 'Plateaux d''Éthiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Éthiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Batu', 4400, 'Plateaux d''Éthiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Éthiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pics Portal', 4391, 'Rwenzori');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Ouganda');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Elgon', 4321, 'Vallée du grand rift');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Kenya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Ouganda');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Amba Farit', 4270, 'Plateaux d''Éthiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Éthiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Abune Yosef', 4260, 'Plateaux d''Éthiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Éthiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Bada', 4195, 'Plateaux d''Éthiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Éthiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Djebel Toubkal', 4167, 'Atlas');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Maroc');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Muhabura', 4127, 'Montagnes des Virunga');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Ouganda');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Rwanda');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Guna Terara', 4120, 'Plateaux d''Éthiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Éthiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Choqa', 4100, 'Plateaux d''Éthiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Éthiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Ighil M''Goun', 4071, 'Atlas');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Maroc');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Inatye', 4070, 'Plateaux d''Éthiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Éthiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Cameroun', 4040, 'Ligne du Cameroun');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Cameroun');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Oldoinyo Lesatima', 4001, 'Vallée du grand rift');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Kenya');

-- Amérique
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Denali', 6190, 'Chaîne d''Alaska');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'États-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Logan', 5959, 'Chaîne Saint-Élie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pic d''Orizaba', 5675, 'Cordillère néovolcanique');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Mexique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Saint-Élie', 5489, 'Chaîne Saint-Élie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'États-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Popocatepetl', 5426, 'Cordillère néovolcanique');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Mexique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Foraker', 5304, 'Chaîne d''Alaska');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'États-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Lucania', 5240, 'Chaîne Saint-Élie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Iztaccíhuatl', 5230, 'Cordillère néovolcanique');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Mexique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pic King', 5173, 'Chaîne Saint-Élie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Steele', 5073, 'Chaîne Saint-Élie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Bona', 5005, 'Chaîne Saint-Élie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'États-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Blackburn', 4996, 'Montagnes Wrangell');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'États-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Sanford', 4949, 'Montagnes Wrangell');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'États-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Wood', 4840, 'Chaîne Saint-Élie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Vancouver', 4812, 'Chaîne Saint-Élie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Slaggard', 4742, 'Chaîne Saint-Élie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Nevado de Toluca', 4680, 'Cordillère néovolcanique');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Mexique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Macaulay', 4680, 'Chaîne Saint-Élie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Fairweather', 4671, 'Chaîne Saint-Élie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'États-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Sierra Negra', 4580, 'Cordillère néovolcanique');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Mexique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Hubbard', 4557, 'Chaîne Saint-Élie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'États-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Bear', 4520, 'Chaîne Saint-Élie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'États-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Walsh', 4506, 'Chaîne Saint-Élie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Aconcagua', 6962, 'Cordillère des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Nevado Ojos del Salado', 6893, 'Cordillère des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chili');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Monte Pissis', 6793, 'Cordillère des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Huascarán Sur', 6768, 'Cordillère des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pérou');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Cerro Bonete Chico', 6759, 'Cordillère des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Tres Cruces Sur', 6748, 'Cordillère des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chili');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Llullaillaco', 6739, 'Cordillère des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chili');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mercedario', 6720, 'Cordillère des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Huascarán Norte', 6664, 'Cordillère des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pérou');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Walter Penck I', 6658, 'Cordillère des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Yerupajá', 6635, 'Cordillère des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pérou');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Tres Cruces Central', 6629, 'Cordillère des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chili');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Nevado de Incahuasi', 6621, 'Cordillère des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chili');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Tupungato', 6570, 'Cordillère des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chili');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Nevado Sajama', 6542, 'Cordillère des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Bolivie');

-- Antarctique
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Massif Vinson', 4892, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Tyree', 4852, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Shinn', 4661, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Epperly', 4602, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Gardner', 4587, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Kirkpatrick', 4528, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Elizabeth', 4480, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Rutford', 4477, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Craddock', 4368, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Markham', 4351, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Bell', 4303, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Mackellar', 4297, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Sidley', 4285, 'Chaîne de l''Executive Committee');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Anderson', 4254, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Bentley', 4247, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Kaplan', 4230, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Sommet Fleming', 4200, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Ostenso', 4179, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Minto', 4166, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Miller', 4160, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Dickerson', 4120, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Dôme Argus', 4093, NULL);
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Wade', 4084, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Fisher', 4080, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pic Centennial', 4070, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Fridtjof Nansen', 4069, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Lister', 4025, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Wexler', 4024, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pic Decennial', 4020, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Adam', 4010, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Flat Top', 4000, 'Chaîne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Korsch', 4000, 'Chaîne Transantarctique');

-- Asie
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Everest', 8848, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Népal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'K2', 8611, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Kangchenjunga', 8586, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Inde');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Népal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Lhotse', 8516, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Népal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Makalu', 8485, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Népal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Cho Oyu', 8188, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Népal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Dhaulagiri I', 8167, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Népal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Manaslu', 8163, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Népal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Nanga Parbat', 8126, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Annapurna I', 8091, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Népal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Gasherbrum I', 8080, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Broad Peak', 8051, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Gasherbrum II', 8034, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Shishapangma', 8027, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Gyachung Kang', 7952, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Népal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Annapurna II', 7937, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Népal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Gasherbrum IV', 7932, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Himalchuli', 7893, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Népal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Distaghil Sar', 7884, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Ngadi Chuli', 7871, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Népal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Khunyang Chhish', 7823, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Masherbrum', 7821, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Nanda Devi', 7816, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Inde');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Chomo Lonzo', 7804, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Batura Sar', 7795, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Rakaposhi', 7788, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Namcha Barwa', 7782, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Kanjut Sar', 7760, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Kamet', 7756, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Inde');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Dhaulagiri II', 7751, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Népal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Saltoro Kangri', 7742, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Inde');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Jannu', 7711, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Népal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Tirich Mir', 7708, 'Hindou Kouch');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Molamenqing', 7703, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Gurla Mandhata', 7694, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Saser Kangri I', 7672, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Inde');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Chogolisa', 7665, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Dhaulagiri IV', 7661, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Népal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Kongur Tagh', 7649, 'Cordillère du Kunlun');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Shispare', 7611, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Trivor', 7577, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Gangkhar Puensum', 7570, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Bhoutan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Minya Konka', 7556, 'Monts Hengduan');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Annapurna III', 7555, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Népal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mustagh Ata', 7546, 'Cordillère du Kunlun');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Skyang Kangri', 7545, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Changtse', 7543, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Kula Kangri', 7538, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Bhoutan');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Kongur Tiube', 7530, 'Cordillère du Kunlun');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mamostong Kangri', 7516, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Inde');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Saser Kangri II Est', 7513, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Inde');

-- Europe
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Elbrouz', 5642, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Dykh-Taou', 5205, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Chkhara', 5193, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Géorgie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Kochtan-Taou', 5150, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Kazbek', 5047, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Géorgie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Blanc', 4809, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'France');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Italie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Djimara', 4780, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Géorgie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Ouilpata', 4649, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pointe Dufour', 4634, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Tikhtengen', 4618, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Géorgie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Ailama', 4546, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Géorgie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Dom des Mischabel', 4545, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Jailik', 4533, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Salinan', 4508, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Weisshorn', 4505, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Teboulo', 4493, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Géorgie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Cervin', 4478, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Italie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Bazardüzü', 4466, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Azerbaïdjan');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Shani', 4451, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Géorgie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Tepli', 4431, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Dent Blanche', 4357, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Grand Combin', 4314, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Diklo', 4285, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Géorgie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Finsteraarhorn', 4274, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Shahdagh', 4243, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Azerbaïdjan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Zinalrothorn', 4221, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Grandes Jorasses', 4208, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'France');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Italie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Rimpfischhorn', 4199, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Aletschhorn', 4195, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Strahlhorn', 4190, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Dent d''Hérens', 4171, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Italie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Breithorn', 4164, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Italie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Jungfrau', 4158, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Addala-Shukhgelmeer', 4152, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Dyultydag', 4127, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Aiguille Verte', 4122, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'France');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mönch', 4107, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Barre des Écrins', 4102, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'France');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Schreckhorn', 4078, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Ober Gabelhorn', 4063, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Grand Paradis', 4061, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Italie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Piz Bernina', 4049, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Weissmies', 4023, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Lagginhorn', 4010, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');

-- Océanie
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Puncak Jaya', 4884, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Sumantri', 4870, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Nga Pulu', 4862, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Carstensz Oriental', 4820, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Puncak Trikora', 4750, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Ngga Pilimsit', 4717, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Puncak Mandala', 4640, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pic Wollaston', 4600, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Yamin', 4595, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont David', 4581, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Akimuga', 4525, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Wilhelm', 4509, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Valentiyn', 4453, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Giluwe', 4368, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Kubor', 4359, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Bakoppa', 4330, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Grasberg', 4270, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Herbert', 4262, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Leonard Darwin', 4230, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mauna Kea', 4207, 'Île d''Hawaï');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL,'États-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mauna Loa', 4170, 'Île d''Hawaï');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL,'États-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Platen Spitz', 4150, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Boising', 4150, 'Monts Finisterre');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Bangeta', 4121, 'Monts Finisterre');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Kabangama', 4104, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Nggumbulu', 4061, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Victoria', 4038, 'Chaîne Owen Stanley');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Albert Edward', 3993, 'Chaîne Owen Stanley');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Maurits', 3990, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Antares', 3970, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Angemuk', 3962, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Willem', 3905, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pic Tuktuai', 3889, 'Monts Finisterre');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Boongkat', 3875, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Hagen', 3834, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Cook', 3755, 'Alpes du Sud');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Nouvelle-Zélande');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Suckling', 3676, 'Chaîne Owen Stanley');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Putigibuli', 3660, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indonésie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Michael', 3647, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Karoma', 3623, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pics Doma', 3568, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Priora', 3557, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guinée');
COMMIT;



-- Afrique
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Medjerda', 460, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Tunisie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Bandama', 1050, 'lagune Lahou');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Côte d''Ivoire');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Betsiboka', 525, 'baie de Bombetoka');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Madagascar');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Chelif', 733, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Algérie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Soummam', 425, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Algérie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Bouregreg', 240, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Maroc');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Casamance', 300, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Sénégal');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Cavally', 515, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Guinée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Liberia');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Côte d''Ivoire');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Chari', 1200, 'lac Tchad');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'République centrafricaine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Tchad');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Cameroun');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Comoé', 813, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Burkina Faso');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Côte d''Ivoire');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Congo', 4700, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'République démocratique du Congo');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'République du Congo');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Angola');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Drâa', 1100, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Maroc');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Gambie', 1150, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Guinée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Sénégal');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Gambie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Jubba', 1658, 'océan Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Éthiopie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Somalie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Limpopo', 1600, 'océan Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Botswana');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Afrique du Sud');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Zimbabwe');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mozambique');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Mangoky', 714, 'océan Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Madagascar');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Maningoza', NULL, 'océan Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Madagascar');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Mono', 467, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Togo');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Bénin');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Moulouya', 600, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Maroc');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Niger', 4184, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Guinée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mali');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Niger');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Bénin');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nigeria');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Nil', 6700, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Éthiopie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Érythrée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Soudan');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Soudan du Sud');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Égypte');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Rwanda');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Tanzanie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ouganda');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Burundi');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'République démocratique du Congo');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Kenya');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Nouveau Calabar', NULL, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nigeria');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Nyong', 690, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Cameroun');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Ogooué', 893, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'République du Congo');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Gabon');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Okavango', 1600, 'désert du Kalahari');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Angola');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Namibie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Botswana');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Orange', 2160, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Lesotho');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Afrique du Sud');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Namibie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Oti', 500, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Burkina Faso');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Bénin');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Togo');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ghana');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Oum Errabiâ', 550, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Maroc');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Ruvuma', 800, 'océan Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mozambique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Tanzanie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Saloum', 250, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Sénégal');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Sanaga', 918, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Cameroun');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Sebou', 614, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Maroc');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Sénégal', 1750, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Guinée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mali');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mauritanie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Sénégal');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Tana', 1014, 'océan Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Kenya');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Volta', 1346, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Burkina Faso');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ghana');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Côte d''Ivoire');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Wouri', 160, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Cameroun');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Zambèze', 2750, 'océan Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Zambie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Angola');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Namibie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Zimbabwe');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mozambique');
	

-- Amérique
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Amazone', 6437, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Pérou');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Colombie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Brésil');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Atrato', 750, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Colombie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Brazos', 2060, 'golfe du Mexique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'États-Unis');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Colorado', 2330, 'golfe de Californie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'États-Unis');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mexique');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Corentyne', 724, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Guyana');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Suriname');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Columbia', 1954, 'océan Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Canada');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'États-Unis');	

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Essequibo', 1014, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Guyana');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Fraser', 1370, 'océan Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Canada');
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Hudson', 507, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'États-Unis');	

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Lempa', 422, 'océan Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Guatemala');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Honduras');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Salvador');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Mackenzie', 1738, 'océan Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Canada');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Magdalena', 1558, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Colombie');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Maroni', 612, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Suriname');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Mississippi', 3780, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'États-Unis');


INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Mobile', 72, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'États-Unis');	

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Moche', 102, 'océan Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Pérou');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Nelson', 660, 'baie d''Hudson');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Canada');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Orénoque', 2140, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Venezuela');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Colombie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Oyapock', 403, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Brésil');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Paraná', 4099, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Brésil');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Paraguay');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Argentine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Parnaíba', 1344, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Brésil');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Potomac', 665, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'États-Unis');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Rímac', 160, 'océan Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Pérou');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Río Chubut', 810, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Argentine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Rio Colorado', 1114, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Argentine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Río Grande', 3060, 'golfe du Mexique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'États-Unis');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mexique');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Río Negro', 1135, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Argentine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Saint-Jean', 673, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'États-Unis');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Canada');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Saint-Laurent', 1140, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Canada');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'États-Unis');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le San Juan', 380, 'océan Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Colombie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Santa Cruz', 477, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Argentine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le São Francisco', 3160, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Brésil');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Savannah', 563, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'États-Unis');	

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Sinnamary', 262, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Suriname', 480, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Suriname');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Tocantins', 2600, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Brésil');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Uruguay', 1600, 'río de la Plata');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Brésil');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Argentine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Uruguay');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Yukon', 3185, 'mer de Béring');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Canada');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'États-Unis');	

-- Asie
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Alazeïa', 1590, 'océan Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Amou-Daria', 2580, 'mer d''Aral');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Afghanistan');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Tadjikistan');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ouzbékistan');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Turkménistan');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Amour', 4354, 'océan Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Anabar', 939, 'océan Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Anadyr', 1146, 'mer de Béring');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Brahmapoutre', 2896, 'golfe du Bengale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Bangladesh');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Cagayan', 505, 'mer des Philippines');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Philippines');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Cauvery', 950, 'golfe du Bengale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Chao Phraya', 372, 'golfe de Thaïlande');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Thaïlande');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Chatt-el-Arab', 200, 'golfe Persique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Irak');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Iran');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Euphrate', 2780, 'golfe Persique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Turquie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Syrie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Irak');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le fleuve Jaune', 5646, 'mer de Chine orientale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le fleuve Rouge', 1149, 'mer de Chine méridionale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Viêt Nam');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Gange', 2510, 'golfe du Bengale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Bangladesh');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Godavari', 1500, 'golfe du Bengale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Hai He', 70, 'golfe de Bohai');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Iana', 1490, 'océan Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Ienisseï', 4093, 'mer de Kara');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mongolie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Ili', 1439, 'lac Balkhach');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Kazakhstan');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Indiguirka', 1726, 'océan Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Indus', 3180, 'mer d''Arabie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Pakistan');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Irrawaddy', 2170, 'océan Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Birmanie');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Jourdain', 360, 'mer Morte');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Syrie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Israël');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Palestine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Jordanie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Kamtchatka', 758, 'mer de Béring');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Kapuas', 1143, 'mer de Chine méridionale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Indonésie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Khatanga', 1636, 'océan Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Kolyma', 2129, 'océan Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Koura', 1514, 'mer Caspienne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Turquie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Géorgie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Azerbaïdjan');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Krishnâ', 1290, 'océan Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Léna', 4400, 'océan Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Liao', 1345, 'golfe de Bohai');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Mahânadi', 851, 'golfe du Bengale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Méandre', 548, 'mer Égée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Turquie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Mékong', 4909, 'mer de Chine du Sud');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Birmanie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Thaïlande');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Laos');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Cambodge');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Viêt Nam');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Nadym', 545, 'mer de Kara');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Narmadâ', 1289, 'océan Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Ob', 3650, 'mer de Kara');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Oleniok', 2292, 'océan Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Oronte', 571, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Liban');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Syrie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Turquie');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Piassina', 817, 'mer de Kara');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Pennar', 597, 'golfe du Bengale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Pour', 1024, 'mer de Kara');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Rioni', 327, 'mer Noire');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Géorgie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Salouen', 2815, 'océan Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Birmanie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Thaïlande');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Sefid Roud', 670, 'mer Caspienne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Iran');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Sittang', 421, 'golfe de Martaban');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Birmanie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Syr-Daria', 2212, 'mer d''Aral');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Tadjikistan');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ouzbékistan');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Kazakhstan');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Taïmyr', 840, 'mer de Kara');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Tapti', 724, 'océan Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Tarim', 2030, 'Lob Nor');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Taz', 1401, 'mer de Kara');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Tigre', 1900, 'golfe Persique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Turquie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Syrie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Irak');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Tumen', 521, 'mer du Japon');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Corée du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL,'Chine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Vaigai', 240, 'océan Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Xi Jiang', 1772, 'mer de Chine méridionale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Yalu', 800, 'mer de Chine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Corée du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL,'Chine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Yang Tsé Kiang', 6380, 'mer de Chine orientale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');

-- Europe
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Aa', 89, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Adige', 410, 'mer Adriatique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Italie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Adour', 308, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Arno', 241, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Italie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Aude', 224, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Aulne', 144, 'mer d''Iroise');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Authie', 103, 'Manche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Blavet', 149, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Boug méridional', 806, 'mer Noire');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ukraine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Canche', 100, 'Manche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Charente', 381, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Corrib', 6, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Irlande');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Danube', 3020, 'mer Noire');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Allemagne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Autriche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Slovaquie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Hongrie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Croatie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Serbie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Roumanie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Bulgarie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Moldavie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ukraine');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Daugava', 1020, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Lettonie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Biélorussie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Dniepr', 2290, 'mer Noire');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Biélorussie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ukraine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Dniestr', 1362, 'mer Noire');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ukraine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Moldavie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Don', 1950, 'mer d''Azov');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Dordogne', 483, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Douro', 940, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Portugal');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Dvina septentrionale', 744, 'mer Blanche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Èbre', 928, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Elbe', 1091, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'République Tchèque');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Allemagne');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Élorn', 56, 'mer d''Iroise');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Ems', 371, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Allemagne');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Escaut', 355, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Belgique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Pays-Bas');	

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Garonne', 647, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Glomma', 608, 'Skagerrak');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Norvège');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Göta älv', 93, 'Cattégat');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Suède');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Guadalete', 157, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Guadalquivir', 657, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Guadiana', 744, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Portugal');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Hérault', 148, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Irminio', 55, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Italie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Isonzo', 136, 'mer Adriatique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Italie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Slovénie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Júcar', 498, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Kem', 191, 'mer Blanche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Kemijoki', 552, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Finlande');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Kouban', 870, 'mer d''Azov');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Lielupe', 119, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Lettonie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Loire', 1006, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Louga', 353, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Luleälven', 461, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Suède');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Maritsa', 480, 'mer Égée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Bulgarie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Grèce');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Turquie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Meuse', 950, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Belgique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Pays-Bas');	

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Mezen', 857, 'mer Blanche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Minho', 318, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Portugal');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Narva', 75, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Estonie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Neva', 74, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Niémen', 937, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Biélorussie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Lituanie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Oder', 854, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL,'République Tchèque');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Pologne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Allemagne');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Odet', 63, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Onega', 416, 'mer Blanche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Orb', 135, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Orne', 170, 'Manche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Oural', 2428, 'mer Caspienne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Kazakhstan');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Petchora', 1809, 'mer de Barents');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Piave', 231, 'mer Adriatique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Italie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Pô', 652, 'mer Adriatique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Italie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Rance', 102, 'Manche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Reno', 212, 'mer Adriatique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Italie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Rhin', 1233, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Suisse');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Liechtenstein');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Autriche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Allemagne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Pays-Bas');	

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Rhône', 812, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Suisse');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Segura', 325, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Seine', 777, 'Manche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Severn', 354, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Royaume-Uni');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Sèvre Niortaise', 158, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Shannon', 386, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Irlande');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Somme', 245, 'Manche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Strymon', 415, 'mer Égée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Bulgarie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Grèce');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Tage', 1078, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Portugal');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Tamise', 346, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Royaume-Uni');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Terek', 623, 'mer Caspienne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Géorgie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Têt', 116, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Tibre', 405, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Italie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Torne', 521, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Finlande');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Suède');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Trent', 297, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Royaume-Uni');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Var', 114, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Vardar', 388, 'mer Égée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Macédoine du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Grèce');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Vidourle', 95, 'mer Méditerranée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Vilaine', 218, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Vistule', 1047, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Pologne');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Volga', 3700, 'mer Caspienne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Weser', 452, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Allemagne');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Aven', 37, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Bélon', 26, 'océan Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Yser', 78, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Belgique');
	

-- Océanie
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Avon', 14, 'océan Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nouvelle-Zélande');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Burdekin River', 710, 'océan Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Australie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Hastings River', 128, 'mer de Tasman');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Australie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Mokau', 158, 'mer de Tasman');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nouvelle-Zélande');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Murray', 2530, 'océan Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Australie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Oreti', 170, 'océan Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nouvelle-Zélande');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Pomahaka', 80, 'océan Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nouvelle-Zélande');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Rangitata River', 120, 'océan Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nouvelle-Zélande');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Sepik', 1126, 'océan Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Indonésie');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Waikato', 425, 'mer de Tasman');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nouvelle-Zélande');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Waitaki', 110, 'océan Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nouvelle-Zélande');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Whanganui', 290, 'mer de Tasman');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nouvelle-Zélande');
COMMIT;

-- TP04 alterbase.sql

ALTER TABLE Continent
ADD (
   population DECIMAL(10),
   croissance DECIMAL(4,2)
   );

ALTER TABLE Continent
MODIFY nom VARCHAR(30);

ALTER TABLE Pays
MODIFY nomc VARCHAR(30);

ALTER TABLE Frontiere
ADD CONSTRAINT ck_frontiere_longueur CHECK (longueur >= 0);

ALTER TABLE Fleuve
ADD CONSTRAINT ck_fleuve_longueur CHECK (longueur > 0);

ALTER TABLE Montagne
ADD CONSTRAINT ck_montagne_altitude CHECK (altitude > 0);

ALTER TABLE Continent
ADD (
   CONSTRAINT ck_continent_superficie CHECK (superficie > 0),
   CONSTRAINT ck_continent_population CHECK (population > 0));

ALTER TABLE Pays
ADD (
   CONSTRAINT ck_pays_superficie CHECK (superficie >= 0),
   CONSTRAINT ck_pays_population CHECK (population > 0));

ALTER TABLE Pays
ADD CONSTRAINT nn_pays_nomc CHECK (nomc IS NOT NULL);

-- TP05 updatebase.sql

UPDATE Continent
SET population = 4601371000, croissance = 0.97
WHERE nom = 'Asie';

UPDATE Continent
SET population = 1308064000, croissance = 2.46
WHERE nom = 'Afrique';

UPDATE Continent
SET population = 1014722000, croissance = 0.79
WHERE nom = 'Amérique';

UPDATE Continent
SET population = 747193000, croissance = 0.14
WHERE nom = 'Europe';

UPDATE Continent
SET population = 42128000, croissance = 1.50
WHERE nom = 'Océanie';

ALTER TABLE Continent
DROP CONSTRAINT ck_continent_population ;

ALTER TABLE Continent
ADD CONSTRAINT ck_continent_population  CHECK (population >= 0);

UPDATE Continent
SET population = 0, croissance = 0
WHERE nom = 'Antarctique';

CREATE TABLE Volcan
(
 nv DECIMAL,
 nom VARCHAR(30),
 altitude DECIMAL,
 nomp VARCHAR(30),
 CONSTRAINT pk_volcan PRIMARY KEY (nv),
 CONSTRAINT uk_volcan UNIQUE (nom),
 CONSTRAINT fk_volcan_pays FOREIGN KEY (nomp) REFERENCES Pays (nom),
 CONSTRAINT ck_volcan_altitude CHECK (altitude > 0)
);

DROP SEQUENCE seq_volcan;
CREATE SEQUENCE seq_volcan
START WITH 1
INCREMENT BY 1;

INSERT INTO Volcan
VALUES (seq_volcan.NEXTVAL, 'Nevado Ojos del Salado', 6893, 'Argentine');
INSERT INTO Volcan
VALUES (seq_volcan.NEXTVAL, 'Kilimandjaro', 5892, 'Tanzanie');
INSERT INTO Volcan
VALUES (seq_volcan.NEXTVAL, 'Elbrouz', 5642, 'Russie');
INSERT INTO Volcan
VALUES (seq_volcan.NEXTVAL, 'Pic d''Orizaba', 5675, 'Mexique');
INSERT INTO Volcan
VALUES (seq_volcan.NEXTVAL, 'Mont Damavand', 5610, 'Iran');
INSERT INTO Volcan
VALUES (seq_volcan.NEXTVAL, 'Mont Giluwe', 4368, 'Papouasie-Nouvelle-Guinée');
INSERT INTO Volcan
VALUES (seq_volcan.NEXTVAL, 'Mont Sidley', 4285, NULL);
COMMIT;
