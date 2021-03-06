------------------------------------------------------------------
-- TP05 Point de reprise
------------------------------------------------------------------

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
INSERT INTO Continent VALUES ('Am??rique', 42189120);
INSERT INTO Continent VALUES ('Antarctique',	13209000);
INSERT INTO Continent VALUES ('Europe', 9938000);
INSERT INTO Continent VALUES ('Oc??anie', 7687000);
COMMIT;


INSERT INTO Pays VALUES ('??mirats arabes unis', 'Abou Dabi', 82880, 9992083, 'ARE', 'AE', NULL);
INSERT INTO Pays VALUES ('Nigeria', 'Abuja', 923768, 214028302, 'NGA', 'NG', NULL);
INSERT INTO Pays VALUES ('Ghana', 'Accra', 238540, 29340248, 'GHA', 'GH', NULL);
INSERT INTO Pays VALUES ('Turkm??nistan', 'Achgabat', 488100, 5411012, 'TKM', 'TM', NULL);
INSERT INTO Pays VALUES ('??thiopie', 'Addis-Abeba', 1127127, 108386391, 'ETH', 'ET', NULL);
INSERT INTO Pays VALUES ('Alg??rie', 'Alger', 2381741, 43900000, 'DZA', 'DZ', NULL);
INSERT INTO Pays VALUES ('Niue', 'Alofi', 260, 1612, 'NIU', 'NU', NULL);
INSERT INTO Pays VALUES ('Jordanie', 'Amman', 89342, 10820644, 'JOR', 'JO', NULL);
INSERT INTO Pays VALUES ('Pays-Bas', 'Amsterdam', 41530, 17282163, 'NLD', 'NL', NULL);
INSERT INTO Pays VALUES ('Andorre', 'Andorre-la-Vieille', 468, 77000, 'AND', 'AD', NULL);
INSERT INTO Pays VALUES ('Turquie', 'Ankara', 783562, 83154997, 'TUR', 'TR', NULL);
INSERT INTO Pays VALUES ('Madagascar', 'Antananarivo', 587041, 26955737, 'MDG', 'MG', NULL);
INSERT INTO Pays VALUES ('Samoa', 'Apia', 2944, 193483, 'WSM', 'WS', NULL);
INSERT INTO Pays VALUES ('??rythr??e', 'Asmara', 121320, 5869970, 'ERI', 'ER', NULL);
INSERT INTO Pays VALUES ('Paraguay', 'Asuncion', 406752, 7191685, 'PRY', 'PY', NULL);
INSERT INTO Pays VALUES ('Gr??ce', 'Ath??nes', 131957, 10607051, 'GRC', 'GR', NULL);
INSERT INTO Pays VALUES ('??les Cook', 'Avarua', 240, 21923, 'COK', 'CK', NULL);
INSERT INTO Pays VALUES ('Irak', 'Bagdad', 435052, 38872655, 'IRQ', 'IQ', NULL);
INSERT INTO Pays VALUES ('Azerba??djan', 'Bakou', 86600, 10205810, 'AZE', 'AZ', NULL);
INSERT INTO Pays VALUES ('Mali', 'Bamako', 1241238, 19553397, 'MLI', 'ML', NULL);
INSERT INTO Pays VALUES ('Brunei', 'Bandar Seri Begawan', 5765, 450565, 'BRN', 'BN', NULL);
INSERT INTO Pays VALUES ('Tha??lande', 'Bangkok', 514000, 68977400, 'THA', 'TH', NULL);
INSERT INTO Pays VALUES ('R??publique centrafricaine', 'Bangui', 622984, 5990855, 'CAF', 'CF', NULL);
INSERT INTO Pays VALUES ('Gambie', 'Banjul', 11300, 2173999, 'GMB', 'GM', NULL);
INSERT INTO Pays VALUES ('Saint-Christophe-et-Ni??v??s', 'Basseterre', 261, 53821, 'KNA', 'KN', NULL);
INSERT INTO Pays VALUES ('Serbie', 'Belgrade', 77474, 7078110, 'SRB', 'RS', NULL);
INSERT INTO Pays VALUES ('Belize', 'Belmopan', 22966, 385854, 'BLZ', 'BZ', NULL);
INSERT INTO Pays VALUES ('Allemagne', 'Berlin', 357386, 83149300, 'DEU', 'DE', NULL);
INSERT INTO Pays VALUES ('Suisse', 'Berne ', 41285, 8603900, 'CHE', 'CH', NULL);
INSERT INTO Pays VALUES ('Liban', 'Beyrouth', 10452, 5469612, 'LBN', 'LB', NULL);
INSERT INTO Pays VALUES ('Kirghizistan', 'Bichkek', 198500, 5964897, 'KGZ', 'KG', NULL);
INSERT INTO Pays VALUES ('Guin??e-Bissau', 'Bissau', 36120, 1833247, 'GNB', 'GW', NULL);
INSERT INTO Pays VALUES ('Afrique du Sud', 'Pretoria', 1219912, 58775022, 'ZAF', 'ZA', NULL);
INSERT INTO Pays VALUES ('Colombie', 'Bogota', 1141748, 49084841, 'COL', 'CO', NULL);
INSERT INTO Pays VALUES ('Br??sil', 'Brasilia', 8514876, 211715973, 'BRA', 'BR', NULL);
INSERT INTO Pays VALUES ('Slovaquie', 'Bratislava', 49035, 5457926, 'SVK', 'SK', NULL);
INSERT INTO Pays VALUES ('R??publique du Congo', 'Brazzaville', 342000, 5293070, 'COG', 'CG', NULL);
INSERT INTO Pays VALUES ('Barbade', 'Bridgetown', 430, 294560, 'BRB', 'BB', NULL);
INSERT INTO Pays VALUES ('Belgique', 'Bruxelles', 30688, 11476279, 'BEL', 'BE', NULL);
INSERT INTO Pays VALUES ('Roumanie', 'Bucarest', 238397, 21302893, 'ROU', 'RO', NULL);
INSERT INTO Pays VALUES ('Hongrie', 'Budapest', 93028, 9771827, 'HUN', 'HU', NULL);
INSERT INTO Pays VALUES ('Argentine', 'Buenos Aires', 2791810, 45479118, 'ARG', 'AR', NULL);
INSERT INTO Pays VALUES ('??gypte', 'Le Caire', 1001450, 104124440, 'EGY', 'EG', NULL);
INSERT INTO Pays VALUES ('Australie', 'Canberra', 7692060, 25464116, 'AUS', 'AU', NULL);
INSERT INTO Pays VALUES ('Venezuela', 'Caracas', 916445, 28436066, 'VEN', 'VE', NULL);
INSERT INTO Pays VALUES ('Sainte-Lucie', 'Castries', 620, 166487, 'LCA', 'LC', NULL);
INSERT INTO Pays VALUES ('Moldavie', 'Chisinau', 33851, 2681735, 'MDA', 'MD', NULL);
INSERT INTO Pays VALUES ('Sri Lanka', 'Sri Jayawardenapura Kotte', 65610, 22889201, 'LKA', 'LK', NULL);
INSERT INTO Pays VALUES ('Guin??e', 'Conakry', 245857, 12527440, 'GIN', 'GN', NULL);
INSERT INTO Pays VALUES ('Danemark', 'Copenhague', 2210579, 5822763, 'DNK', 'DK', NULL);
INSERT INTO Pays VALUES ('S??n??gal', 'Dakar', 196722, 16209125, 'SEN', 'SN', NULL);
INSERT INTO Pays VALUES ('Syrie', 'Damas', 185180, 19454263, 'SYR', 'SY', NULL);
INSERT INTO Pays VALUES ('??les Marshall', 'Delap-Uliga-Darrit', 181, 75684, 'MHL', 'MH', NULL);
INSERT INTO Pays VALUES ('Bangladesh', 'Dacca', 147570, 162650853, 'BGD', 'BD', NULL);
INSERT INTO Pays VALUES ('Timor oriental', 'Dili', 15410, 1321929, 'TLS', 'TL', NULL);
INSERT INTO Pays VALUES ('Djibouti', 'Djibouti', 23200, 921804, 'DJI', 'DJ', NULL);
INSERT INTO Pays VALUES ('Soudan du Sud', 'Djouba', 619745, 10561244, 'SSD', 'SS', NULL);
INSERT INTO Pays VALUES ('Tanzanie', 'Dodoma', 945087, 58552845, 'TZA', 'TZ', NULL);
INSERT INTO Pays VALUES ('Qatar', 'Doha', 11586, 2444174, 'QAT', 'QA', NULL);
INSERT INTO Pays VALUES ('Tadjikistan', 'Douchanb??', 143100, 8873669, 'TJK', 'TJ', NULL);
INSERT INTO Pays VALUES ('Irlande', 'Dublin', 70273, 5176569, 'IRL', 'IE', NULL);
INSERT INTO Pays VALUES ('Arm??nie', 'Erevan', 29743, 3021324, 'ARM', 'AM', NULL);
INSERT INTO Pays VALUES ('Sierra Leone', 'Freetown', 71740, 6624933, 'SLE', 'SL', NULL);
INSERT INTO Pays VALUES ('Tuvalu', 'Funafuti', 26, 11192, 'TUV', 'TV', NULL);
INSERT INTO Pays VALUES ('Botswana', 'Gaborone', 581726, 2317233, 'BWA', 'BW', NULL);
INSERT INTO Pays VALUES ('Guyana', 'Georgetown', 214970, 750204, 'GUY', 'GY', NULL);
INSERT INTO Pays VALUES ('Burundi', 'Gitega', 27834, 11865821, 'BDI', 'BI', NULL);
INSERT INTO Pays VALUES ('Guatemala', 'Guatemala', 108890, 17153288, 'GTM', 'GT', NULL);
INSERT INTO Pays VALUES ('Vi??t Nam', 'Hano??', 330967, 98721275, 'VNM', 'VN', NULL);
INSERT INTO Pays VALUES ('Zimbabwe', 'Harare', 390745, 14546314, 'ZWE', 'ZW', NULL);
INSERT INTO Pays VALUES ('Cuba', 'La Havane', 110860, 11116396, 'CUB', 'CU', NULL);
INSERT INTO Pays VALUES ('Finlande', 'Helsinki', 338145, 5522015, 'FIN', 'FI', NULL);
INSERT INTO Pays VALUES ('Salomon', 'Honiara', 28450, 647581, 'SLB', 'SB', NULL);
INSERT INTO Pays VALUES ('Pakistan', 'Islamabad', 881913, 233500636, 'PAK', 'PK', NULL);
INSERT INTO Pays VALUES ('Indon??sie', 'Jakarta', 1904569, 267026366, 'IDN', 'ID', NULL);
INSERT INTO Pays VALUES ('Isra??l', 'Tel-aviv', 20770, 9213000, 'ISR', 'IL', NULL);
INSERT INTO Pays VALUES ('Palestine', 'Ramallah', 6020, 5090293, 'PSE', 'PS', NULL);
INSERT INTO Pays VALUES ('Afghanistan', 'Kaboul', 652230, 36643815, 'AFG', 'AF', NULL);
INSERT INTO Pays VALUES ('Ouganda', 'Kampala', 241550, 41487965, 'UGA', 'UG', NULL);
INSERT INTO Pays VALUES ('N??pal', 'Katmandou', 147516, 30327877, 'NPL', 'NP', NULL);
INSERT INTO Pays VALUES ('Soudan', 'Khartoum', 1886068, 43120843, 'SDN', 'SD', NULL);
INSERT INTO Pays VALUES ('Ukraine', 'Kiev', 603549, 44983019, 'UKR', 'UA', NULL);
INSERT INTO Pays VALUES ('Rwanda', 'Kigali', 26338, 12712431, 'RWA', 'RW', NULL);
INSERT INTO Pays VALUES ('Jama??que', 'Kingston', 11425, 2808570, 'JAM', 'JM', NULL);
INSERT INTO Pays VALUES ('Saint-Vincent-et-les-Grenadines', 'Kingstown', 389, 101390, 'VCT', 'VC', NULL);
INSERT INTO Pays VALUES ('R??publique d??mocratique du Congo', 'Kinshasa', 2345410, 101780263, 'COD', 'CD', NULL);
INSERT INTO Pays VALUES ('Palaos', 'Melekeok', 459, 21291, 'PLW', 'PW', NULL);
INSERT INTO Pays VALUES ('Kowe??t', 'Kowe??t', 17818, 2993706, 'KWT', 'KW', NULL);
INSERT INTO Pays VALUES ('Malaisie', 'Kuala Lumpur', 329750, 32652083, 'MYS', 'MY', NULL);
INSERT INTO Pays VALUES ('Gabon', 'Libreville', 267667, 2230908, 'GAB', 'GA', NULL);
INSERT INTO Pays VALUES ('Malawi', 'Lilongwe', 118844, 21196629, 'MWI', 'MW', NULL);
INSERT INTO Pays VALUES ('P??rou', 'Lima', 1285216, 31914989, 'PER', 'PE', NULL);
INSERT INTO Pays VALUES ('Portugal', 'Lisbonne', 92380, 10390780, 'PRT', 'PT', NULL);
INSERT INTO Pays VALUES ('Slov??nie', 'Ljubljana', 20273, 2070050, 'SVN', 'SI', NULL);
INSERT INTO Pays VALUES ('Togo', 'Lom??', 56785, 8608444, 'TGO', 'TG', NULL);
INSERT INTO Pays VALUES ('Royaume-Uni', 'Londres', 246690, 65761117, 'GBR', 'GB', NULL);
INSERT INTO Pays VALUES ('Angola', 'Luanda', 1246700, 32522339, 'AGO', 'AO', NULL);
INSERT INTO Pays VALUES ('Zambie', 'Lusaka', 752614, 15066266, 'ZMB', 'ZM', NULL);
INSERT INTO Pays VALUES ('Luxembourg', 'Luxembourg', 2586, 62610, 'LUX', 'LU', NULL);
INSERT INTO Pays VALUES ('Espagne', 'Madrid', 505911, 46934632, 'ESP', 'ES', NULL);
INSERT INTO Pays VALUES ('Guin??e ??quatoriale', 'Malabo', 28051, 1403000, 'GNQ', 'GQ', NULL);
INSERT INTO Pays VALUES ('Maldives', 'Mal??', 298, 392709, 'MDV', 'MV', NULL);
INSERT INTO Pays VALUES ('Nicaragua', 'Managua', 129494, 6203441, 'NIC', 'NI', NULL);
INSERT INTO Pays VALUES ('Bahre??n', 'Manama', 765, 1442659, 'BHR', 'BH', NULL);
INSERT INTO Pays VALUES ('Philippines', 'Manille', 300400, 109180815, 'PHL', 'PH', NULL);
INSERT INTO Pays VALUES ('Mozambique', 'Maputo', 801590, 27233789, 'MOZ', 'MZ', NULL);
INSERT INTO Pays VALUES ('Oman', 'Mascate', 309500, 4664844, 'OMN', 'OM', NULL);
INSERT INTO Pays VALUES ('Lesotho', 'Maseru', 30355, 1924381, 'LSO', 'LS', NULL);
INSERT INTO Pays VALUES ('Swaziland', 'Mbabane', 17363, 1104479, 'SWZ', 'SZ', NULL);
INSERT INTO Pays VALUES ('Mexique', 'Mexico', 1964375, 128649565, 'MEX', 'MX', NULL);
INSERT INTO Pays VALUES ('Bi??lorussie', 'Minsk', 207600, 9477918, 'BLR', 'BY', NULL);
INSERT INTO Pays VALUES ('Somalie', 'Mogadiscio', 637657, 11259029, 'SOM', 'SO', NULL);
INSERT INTO Pays VALUES ('Monaco', 'Monaco', 2, 38100, 'MCO', 'M', NULL);
INSERT INTO Pays VALUES ('Liberia', 'Monrovia', 111369, 5073296, 'LBR', 'LR', NULL);
INSERT INTO Pays VALUES ('Uruguay', 'Montevideo', 176220, 3387605, 'URY', 'UY', NULL);
INSERT INTO Pays VALUES ('Comores', 'Moroni', 2612, 846281, 'COM', 'KM', NULL);
INSERT INTO Pays VALUES ('Russie', 'Moscou', 17125191, 146780700, 'RUS', 'RU', NULL);
INSERT INTO Pays VALUES ('Kenya', 'Nairobi', 580367, 475649, 'KEN', 'KE', NULL);
INSERT INTO Pays VALUES ('Bahamas', 'Nassau', 13943, 337721, 'BHS', 'BS', NULL);
INSERT INTO Pays VALUES ('Birmanie', 'Naypyidaw', 676578, 56590071, 'MMR', 'MM', NULL);
INSERT INTO Pays VALUES ('Tchad', 'N''Djam??na', 1284000, 16877357, 'TCD', 'TD', NULL);
INSERT INTO Pays VALUES ('Inde', 'New Delhi', 3287263, 1326093247, 'IND', 'IN', NULL);
INSERT INTO Pays VALUES ('Niger', 'Niamey', 1267000, 22772361, 'NER', 'NE', NULL);
INSERT INTO Pays VALUES ('Chypre', 'Nicosie', 9251, 1266676, 'CYP', 'CY', NULL);
INSERT INTO Pays VALUES ('Mauritanie', 'Nouakchott', 1030700, 4005475, 'MRT', 'MR', NULL);
INSERT INTO Pays VALUES ('Kazakhstan', 'Noursoultan', 2724900, 19091949, 'KAZ', 'KZ', NULL);
INSERT INTO Pays VALUES ('Tonga', 'Nuku''alofa', 747, 100651, 'TON', 'TO', NULL);
INSERT INTO Pays VALUES ('Norv??ge', 'Oslo', 385207, 5367580, 'NOR', 'NO', NULL);
INSERT INTO Pays VALUES ('Canada', 'Ottawa', 9984670, 37589262, 'CAN', 'CA', NULL);
INSERT INTO Pays VALUES ('Burkina Faso', 'Ouagadougou', 274400, 20835401, 'BFA', 'BF', NULL);
INSERT INTO Pays VALUES ('Mongolie', 'Oulan-Bator', 1564116, 3168026, 'MNG', 'MN', NULL);
INSERT INTO Pays VALUES ('??tats f??d??r??s de Micron??sie', 'Palikir', 702, 102624, 'FSM', 'FM', NULL);
INSERT INTO Pays VALUES ('Panama', 'Panama', 75420, 4285850, 'PAN', 'PA', NULL);
INSERT INTO Pays VALUES ('Suriname', 'Paramaribo', 163270, 597927, 'SUR', 'SR', NULL);
INSERT INTO Pays VALUES ('France', 'Paris', 632734, 67848156, 'FRA', 'FR', NULL);
INSERT INTO Pays VALUES ('Bolivie', 'La Paz', 1098581, 11639909, 'BOL', 'BO', NULL);
INSERT INTO Pays VALUES ('Chine', 'P??kin', 9596960, 1439085892, 'CHN', 'CN', NULL);
INSERT INTO Pays VALUES ('Cambodge', 'Phnom Penh', 181035, 16926984, 'KHM', NULL, NULL);
INSERT INTO Pays VALUES ('Mont??n??gro', 'Podgorica', 13812, 609859, 'MNE', 'ME', NULL);
INSERT INTO Pays VALUES ('Papouasie-Nouvelle-Guin??e', 'Port Moresby', 462840, 8300000, 'PNG', 'PG', NULL);
INSERT INTO Pays VALUES ('Ha??ti', 'Port-au-Prince', 27750, 11067777, 'HTI', 'HT', NULL);
INSERT INTO Pays VALUES ('Trinit??-et-Tobago', 'Port-d''Espagne', 5128, 1208789, 'TTO', 'TT', NULL);
INSERT INTO Pays VALUES ('Maurice', 'Port-Louis', 2040, 1259838, 'MUS', 'MU', NULL);
INSERT INTO Pays VALUES ('B??nin', 'Porto-Novo', 114763, 12864634, 'BEN', 'BJ', NULL);
INSERT INTO Pays VALUES ('Vanuatu', 'Port-Vila', 12189, 298333, 'VUT', 'VU', NULL);
INSERT INTO Pays VALUES ('R??publique Tch??que', 'Prague', 78870, 10649800, 'CZE', 'CZ', NULL);
INSERT INTO Pays VALUES ('Cap-Vert', 'Praia', 4033, 583255, 'CPV', 'CV', NULL);
INSERT INTO Pays VALUES ('Kosovo', 'Pristina', 10908, 1920079, NULL, 'XK', NULL);
INSERT INTO Pays VALUES ('Cor??e du Nord', 'Pyongyang', 120540, 25381085, 'PRK', 'KP', NULL);
INSERT INTO Pays VALUES ('??quateur', 'Quito', 283520, 16904867, 'ECU', 'EC', NULL);
INSERT INTO Pays VALUES ('Maroc', 'Rabat', 446550, 36471769, 'MAR', 'MA', NULL);
INSERT INTO Pays VALUES ('Islande', 'Reykjavik', 102775, 362860, 'ISL', 'IS', NULL);
INSERT INTO Pays VALUES ('Lettonie', 'Riga', 64559, 1928600, 'LVA', 'LV', NULL);
INSERT INTO Pays VALUES ('Arabie saoudite', 'Riyad', 2149690, 34173498, 'SAU', 'SA', NULL);
INSERT INTO Pays VALUES ('Italie', 'Rome', 301336, 60359546, 'ITA', 'IT', NULL);
INSERT INTO Pays VALUES ('Dominique', 'Roseau', 754, 74243, 'DMA', 'DM', NULL);
INSERT INTO Pays VALUES ('Antigua-et-Barbuda', 'Saint John''s', 442, 98179, 'ATG', 'AG', NULL);
INSERT INTO Pays VALUES ('R??publique dominicaine', 'Saint-Domingue', 48442, 10499707, 'DOM', 'DO', NULL);
INSERT INTO Pays VALUES ('Grenade', 'Saint-Georges', 344, 113094, 'GRD', 'GD', NULL);
INSERT INTO Pays VALUES ('Saint-Marin', 'Saint-Marin', 61, 32793, 'SMR', 'SM', NULL);
INSERT INTO Pays VALUES ('Costa Rica', 'San Jos??', 51100, 5111238, 'CRI', 'CR', NULL);
INSERT INTO Pays VALUES ('Salvador', 'San Salvador', 20742, 6481102, 'SLV', 'SV', NULL);
INSERT INTO Pays VALUES ('Y??men', 'Sanaa', 527968, 28036829, 'YEM', 'YE', NULL);
INSERT INTO Pays VALUES ('Chili', 'Santiago', 755276, 18186770, 'CHL', 'CL', NULL);
INSERT INTO Pays VALUES ('Sao Tom??-et-Principe', 'S??o Tom??', 1001, 211122, 'STP', 'ST', NULL);
INSERT INTO Pays VALUES ('Bosnie-Herz??govine', 'Sarajevo', 51197, 3835586, 'BIH', 'BA', NULL);
INSERT INTO Pays VALUES ('Cor??e du Sud', 'S??oul', 100210, 51709098, 'KOR', 'KR', NULL);
INSERT INTO Pays VALUES ('Singapour', 'Singapour', 724, 6209660, 'SGP', 'SG', NULL);
INSERT INTO Pays VALUES ('Mac??doine du Nord', 'Skopje', 25713, 2125971, 'MKD', 'MK', NULL);
INSERT INTO Pays VALUES ('Bulgarie', 'Sofia', 110944, 6966899, 'BGR', 'BG', NULL);
INSERT INTO Pays VALUES ('Su??de', 'Stockholm', 449965, 10313447, 'SWE', 'SE', NULL);
INSERT INTO Pays VALUES ('Fidji', 'Suva', 18270, 935974, 'FJI', 'FJ', NULL);
INSERT INTO Pays VALUES ('Ouzb??kistan', 'Tachkent', 447400, 30565411, 'UZB', 'UZ', NULL);
INSERT INTO Pays VALUES ('Estonie', 'Tallinn', 45339, 1228624, 'EST', 'EE', NULL);
INSERT INTO Pays VALUES ('Kiribati', 'Tarawa-Sud', 811, 110110, 'KIR', 'KI', NULL);
INSERT INTO Pays VALUES ('G??orgie', 'Tbilissi', 69700, 3997000, 'GEO', 'GE', NULL);
INSERT INTO Pays VALUES ('Honduras', 'Tegucigalpa', 112090, 9182766, 'HND', 'HN', NULL);
INSERT INTO Pays VALUES ('Iran', 'T??h??ran', 1648195, 84923314, 'IRN', 'IR', NULL);
INSERT INTO Pays VALUES ('Bhoutan', 'Thimphou', 38394, 782318, 'BTN', 'BT', NULL);
INSERT INTO Pays VALUES ('Albanie', 'Tirana', 28748, 3074579, 'ALB', 'AL', NULL);
INSERT INTO Pays VALUES ('Japon', 'Tokyo', 377975, 125507472, 'JPN', 'JP', NULL);
INSERT INTO Pays VALUES ('Libye', 'Tripoli', 1759540, 6890535, 'LBY', 'LY', NULL);
INSERT INTO Pays VALUES ('Tunisie', 'Tunis', 163610, 11722038, 'TUN', 'TN', NULL);
INSERT INTO Pays VALUES ('Liechtenstein', 'Vaduz', 160, 37810, 'LIE', 'LI', NULL);
INSERT INTO Pays VALUES ('Malte', 'La Valette', 316, 457267, 'MLT', 'MT', NULL);
INSERT INTO Pays VALUES ('Pologne', 'Varsovie', 312679, 38282325, 'POL', 'PL', NULL);
INSERT INTO Pays VALUES ('Vatican', 'Cit?? du Vatican', 0.4, 799, 'VAT', 'VA', NULL);
INSERT INTO Pays VALUES ('Seychelles', 'Victoria', 455, 95981, 'SYC', 'SC', NULL);
INSERT INTO Pays VALUES ('Autriche', 'Vienne', 83871, 8859449, 'AUT', 'AT', NULL);
INSERT INTO Pays VALUES ('Laos', 'Vientiane', 236800, 7447396, 'LAO', 'LA', NULL);
INSERT INTO Pays VALUES ('Lituanie', 'Vilnius', 65303, 2731464, 'LTU', 'LT', NULL);
INSERT INTO Pays VALUES ('??tats-Unis', 'Washington D.C.', 9833517, 328239523, 'USA', 'US', NULL);
INSERT INTO Pays VALUES ('Nouvelle-Z??lande', 'Wellington', 268680, 4926551, 'NZL', 'NZ', NULL);
INSERT INTO Pays VALUES ('Namibie', 'Windhoek', 825418, 2630073, 'NAM', 'NA', NULL);
INSERT INTO Pays VALUES ('C??te d''Ivoire', 'Yamoussoukro', 322462, 26378274, 'CIV', 'CI', NULL);
INSERT INTO Pays VALUES ('Cameroun', 'Yaound??', 475440, 27744989, 'CMR', 'CM', NULL);
INSERT INTO Pays VALUES ('Nauru', 'Yaren', 21, 13649, 'NRU', 'NR', NULL);
INSERT INTO Pays VALUES ('Croatie', 'Zagreb', 56594, 4076246, 'HRV', 'HR', NULL);
INSERT INTO Pays VALUES ('Ta??wan', 'Taipei', 35980, 23603049, 'TWN', 'TW', NULL);
INSERT INTO Pays VALUES ('Sahara occidental', NULL, 266000, 603253, 'ESH', 'EH', NULL);
COMMIT;

UPDATE Pays
SET nomc = 'Afrique'
WHERE nom IN (
'Afrique du Sud', 'Alg??rie', 'Angola', 'B??nin', 'Botswana', 'Burkina Faso', 'Burundi', 'Cameroun', 'Cap-Vert',
'R??publique centrafricaine', 'Comores', 'R??publique du Congo', 'R??publique d??mocratique du Congo', 'C??te d''Ivoire',
'Djibouti', '??gypte', '??rythr??e', '??thiopie', 'Eswatini', 'Gabon', 'Gambie', 'Ghana', 'Guin??e', 'Guin??e-Bissau',
'Guin??e ??quatoriale', 'Kenya', 'Lesotho', 'Liberia', 'Libye', 'Madagascar', 'Malawi', 'Mali', 'Maroc', 'Maurice',
'Mauritanie', 'Mozambique', 'Namibie', 'Niger', 'Nigeria', 'Ouganda', 'Rwanda', 'Sahara occidental', 'Sao Tom??-et-Principe', 'S??n??gal',
'Seychelles', 'Sierra Leone', 'Somalie', 'Soudan', 'Soudan du Sud', 'Tanzanie', 'Tchad', 'Togo', 'Tunisie', 'Zambie',
'Zimbabwe', 'Swaziland');

UPDATE Pays
SET nomc = 'Am??rique'
WHERE nom IN (
'Antigua-et-Barbuda', 'Argentine', 'Bahamas', 'Barbade', 'Belize', 'Bolivie', 'Br??sil', 'Canada', 'Chili', 'Colombie',
'Costa Rica', 'Cuba', 'R??publique dominicaine', 'Dominique', '??quateur', '??tats-Unis', 'Grenade', 'Guatemala', 'Guyana',
'Ha??ti', 'Honduras', 'Jama??que', 'Mexique', 'Nicaragua', 'Panama', 'Paraguay', 'P??rou', 'Saint-Christophe-et-Ni??v??s', 'Sainte-Lucie',
'Saint-Vincent-et-les-Grenadines', 'Salvador', 'Suriname', 'Trinit??-et-Tobago', 'Uruguay', 'Venezuela');

UPDATE Pays
SET nomc = 'Asie'
WHERE nom IN (
'Afghanistan', 'Arabie saoudite', 'Arm??nie', 'Azerba??djan', 'Bahre??n', 'Bangladesh', 'Bhoutan', 'Birmanie', 'Brunei',
'Cambodge', 'Chine', 'Cor??e du Nord', 'Cor??e du Sud', '??mirats arabes unis', 'G??orgie', 'Inde', 'Indon??sie', 'Irak',
'Iran', 'Isra??l', 'Japon', 'Jordanie', 'Kazakhstan', 'Kirghizistan', 'Kowe??t', 'Laos', 'Liban', 'Malaisie', 'Maldives',
'Mongolie', 'N??pal', 'Oman', 'Ouzb??kistan', 'Pakistan', 'Palestine', 'Philippines', 'Qatar', 'Singapour', 'Sri Lanka',
'Syrie', 'Tadjikistan', 'Ta??wan', 'Tha??lande', 'Timor oriental', 'Turkm??nistan', 'Turquie', 'Vi??t Nam', 'Y??men'); 

UPDATE Pays
SET nomc = 'Europe'
WHERE nom IN (
'Albanie', 'Allemagne', 'Andorre', 'Autriche', 'Belgique', 'Bi??lorussie', 'Bosnie-Herz??govine', 'Bulgarie', 'Chypre', 
'Croatie', 'Danemark', 'Espagne', 'Estonie', 'Finlande', 'France', 'Gr??ce', 'Hongrie', 'Irlande', 'Islande', 'Italie',
'Lettonie', 'Liechtenstein', 'Lituanie', 'Luxembourg', 'Mac??doine du Nord', 'Malte', 'Moldavie', 'Monaco', 'Mont??n??gro',
'Norv??ge', 'Pays-Bas', 'Pologne', 'Portugal', 'R??publique Tch??que', 'Roumanie', 'Royaume-Uni', 'Russie', 'Saint-Marin',
'Serbie', 'Slovaquie', 'Slov??nie', 'Su??de', 'Suisse', 'Ukraine', 'Vatican', 'Kosovo'); 

UPDATE Pays
SET nomc = 'Oc??anie'
WHERE nom IN (
'Australie', 'Fidji', '??les Cook', 'Kiribati', '??les Marshall', '??tats f??d??r??s de Micron??sie', 'Nauru', 'Niue', 'Nouvelle-Z??lande', 'Palaos', 
'Papouasie-Nouvelle-Guin??e', 'Salomon', 'Samoa', 'Tonga', 'Tuvalu', 'Vanuatu' );
COMMIT;



INSERT INTO Frontiere VALUES ('Chine', 'Afghanistan', 76);
INSERT INTO Frontiere VALUES ('Chine', 'Bhoutan', 470);
INSERT INTO Frontiere VALUES ('Chine', 'Birmanie', 2185);
INSERT INTO Frontiere VALUES ('Chine', 'Cor??e du Nord', 1416);
INSERT INTO Frontiere VALUES ('Chine', 'Inde', 3380);
INSERT INTO Frontiere VALUES ('Chine', 'Kazakhstan', 1533);
INSERT INTO Frontiere VALUES ('Chine', 'Kirghizistan', 858);
INSERT INTO Frontiere VALUES ('Chine', 'Laos', 423);
INSERT INTO Frontiere VALUES ('Chine', 'Mongolie', 4677);
INSERT INTO Frontiere VALUES ('Chine', 'N??pal', 1236);
INSERT INTO Frontiere VALUES ('Chine', 'Pakistan', 523);
INSERT INTO Frontiere VALUES ('Chine', 'Russie', 4250);
INSERT INTO Frontiere VALUES ('Chine', 'Tadjikistan', 414);
INSERT INTO Frontiere VALUES ('Chine', 'Vi??t Nam', 1281);

INSERT INTO Frontiere VALUES ('Russie', 'Azerba??djan', 284);
INSERT INTO Frontiere VALUES ('Russie', 'Bi??lorussie', 959);
INSERT INTO Frontiere VALUES ('Russie', 'Chine', 4250);
INSERT INTO Frontiere VALUES ('Russie', 'Cor??e du Nord', 19);
INSERT INTO Frontiere VALUES ('Russie', 'Estonie', 294);
INSERT INTO Frontiere VALUES ('Russie', 'Finlande', 1340);
INSERT INTO Frontiere VALUES ('Russie', 'G??orgie', 723);
INSERT INTO Frontiere VALUES ('Russie', 'Kazakhstan', 6846);
INSERT INTO Frontiere VALUES ('Russie', 'Lettonie', 217);
INSERT INTO Frontiere VALUES ('Russie', 'Lituanie', 280);
INSERT INTO Frontiere VALUES ('Russie', 'Mongolie', 3485);
INSERT INTO Frontiere VALUES ('Russie', 'Norv??ge', 196);
INSERT INTO Frontiere VALUES ('Russie', 'Pologne', 232);
INSERT INTO Frontiere VALUES ('Russie', 'Ukraine', 1576);

INSERT INTO Frontiere VALUES ('Br??sil', 'Argentine', 1261);
INSERT INTO Frontiere VALUES ('Br??sil', 'Bolivie', 3423);
INSERT INTO Frontiere VALUES ('Br??sil', 'Colombie', 1644);
INSERT INTO Frontiere VALUES ('Br??sil', 'France', 730);
INSERT INTO Frontiere VALUES ('Br??sil', 'Guyana', 1606);
INSERT INTO Frontiere VALUES ('Br??sil', 'Paraguay', 1366);
INSERT INTO Frontiere VALUES ('Br??sil', 'P??rou', 2995);
INSERT INTO Frontiere VALUES ('Br??sil', 'Suriname', 593);
INSERT INTO Frontiere VALUES ('Br??sil', 'Uruguay', 1069);
INSERT INTO Frontiere VALUES ('Br??sil', 'Venezuela', 2199);

INSERT INTO Frontiere VALUES ('Inde', 'Bangladesh', 4053);
INSERT INTO Frontiere VALUES ('Inde', 'Bhoutan', 605);
INSERT INTO Frontiere VALUES ('Inde', 'Birmanie', 1463);
INSERT INTO Frontiere VALUES ('Inde', 'Chine', 3380);
INSERT INTO Frontiere VALUES ('Inde', 'N??pal', 1690);
INSERT INTO Frontiere VALUES ('Inde', 'Pakistan', 2912);

INSERT INTO Frontiere VALUES ('??tats-Unis', 'Canada', 8893);
INSERT INTO Frontiere VALUES ('??tats-Unis', 'Mexique', 3141);

INSERT INTO Frontiere VALUES ('Kazakhstan', 'Chine', 1533);
INSERT INTO Frontiere VALUES ('Kazakhstan', 'Kirghizistan', 1051);
INSERT INTO Frontiere VALUES ('Kazakhstan', 'Ouzb??kistan', 2203);
INSERT INTO Frontiere VALUES ('Kazakhstan', 'Russie', 6846);
INSERT INTO Frontiere VALUES ('Kazakhstan', 'Turkm??nistan', 379);

INSERT INTO Frontiere VALUES ('R??publique d??mocratique du Congo', 'Angola', 2511);
INSERT INTO Frontiere VALUES ('R??publique d??mocratique du Congo', 'Burundi', 233);
INSERT INTO Frontiere VALUES ('R??publique d??mocratique du Congo', 'Ouganda', 765);
INSERT INTO Frontiere VALUES ('R??publique d??mocratique du Congo', 'R??publique centrafricaine', 1577);
INSERT INTO Frontiere VALUES ('R??publique d??mocratique du Congo', 'R??publique du Congo', 2410);
INSERT INTO Frontiere VALUES ('R??publique d??mocratique du Congo', 'Rwanda', 217);
INSERT INTO Frontiere VALUES ('R??publique d??mocratique du Congo', 'Soudan du Sud', 628);
INSERT INTO Frontiere VALUES ('R??publique d??mocratique du Congo', 'Tanzanie', 459);
INSERT INTO Frontiere VALUES ('R??publique d??mocratique du Congo', 'Zambie', 1930);

INSERT INTO Frontiere VALUES ('Argentine', 'Bolivie', 742);
INSERT INTO Frontiere VALUES ('Argentine', 'Br??sil', 1224);
INSERT INTO Frontiere VALUES ('Argentine', 'Chili', 5150);
INSERT INTO Frontiere VALUES ('Argentine', 'Paraguay', 1699);
INSERT INTO Frontiere VALUES ('Argentine', 'Uruguay', 579);

INSERT INTO Frontiere VALUES ('Canada', '??tats-Unis', 8893);

INSERT INTO Frontiere VALUES ('Mongolie', 'Chine', 4677);
INSERT INTO Frontiere VALUES ('Mongolie', 'Russie', 3485);

INSERT INTO Frontiere VALUES ('Mali', 'Alg??rie', 1376);
INSERT INTO Frontiere VALUES ('Mali', 'Burkina Faso', 1000);
INSERT INTO Frontiere VALUES ('Mali', 'C??te d''Ivoire', 532);
INSERT INTO Frontiere VALUES ('Mali', 'Guin??e', 858);
INSERT INTO Frontiere VALUES ('Mali', 'Mauritanie', 2237);
INSERT INTO Frontiere VALUES ('Mali', 'Niger', 821);
INSERT INTO Frontiere VALUES ('Mali', 'S??n??gal', 419);

INSERT INTO Frontiere VALUES ('Pakistan', 'Afghanistan', 2430);
INSERT INTO Frontiere VALUES ('Pakistan', 'Chine', 523);
INSERT INTO Frontiere VALUES ('Pakistan', 'Inde', 2912);
INSERT INTO Frontiere VALUES ('Pakistan', 'Iran', 909);

INSERT INTO Frontiere VALUES ('Soudan', '??gypte', 1273);
INSERT INTO Frontiere VALUES ('Soudan', '??rythr??e', 605);
INSERT INTO Frontiere VALUES ('Soudan', '??thiopie', 723);
INSERT INTO Frontiere VALUES ('Soudan', 'Libye', 383);
INSERT INTO Frontiere VALUES ('Soudan', 'R??publique centrafricaine', 483);
INSERT INTO Frontiere VALUES ('Soudan', 'Soudan du Sud', 1937);
INSERT INTO Frontiere VALUES ('Soudan', 'Tchad', 1360);

INSERT INTO Frontiere VALUES ('Bolivie', 'Argentine', 742);
INSERT INTO Frontiere VALUES ('Bolivie', 'Br??sil', 3400);
INSERT INTO Frontiere VALUES ('Bolivie', 'Chili', 861);
INSERT INTO Frontiere VALUES ('Bolivie', 'Paraguay', 750);
INSERT INTO Frontiere VALUES ('Bolivie', 'P??rou', 900);

INSERT INTO Frontiere VALUES ('Alg??rie', 'Libye', 982);
INSERT INTO Frontiere VALUES ('Alg??rie', 'Mali', 1376);
INSERT INTO Frontiere VALUES ('Alg??rie', 'Maroc', 1559);
INSERT INTO Frontiere VALUES ('Alg??rie', 'Mauritanie', 463);
INSERT INTO Frontiere VALUES ('Alg??rie', 'Niger', 956);
INSERT INTO Frontiere VALUES ('Alg??rie', 'Sahara occidental', 39);
INSERT INTO Frontiere VALUES ('Alg??rie', 'Tunisie', 1010);

INSERT INTO Frontiere VALUES ('Ouzb??kistan', 'Afghanistan', 137);
INSERT INTO Frontiere VALUES ('Ouzb??kistan', 'Kazakhstan', 2203);
INSERT INTO Frontiere VALUES ('Ouzb??kistan', 'Kirghizistan', 1099);
INSERT INTO Frontiere VALUES ('Ouzb??kistan', 'Tadjikistan', 1161);
INSERT INTO Frontiere VALUES ('Ouzb??kistan', 'Turkm??nistan', 1621);

INSERT INTO Frontiere VALUES ('Chili', 'Argentine', 5150);
INSERT INTO Frontiere VALUES ('Chili', 'Bolivie', 861);
INSERT INTO Frontiere VALUES ('Chili', 'P??rou', 160);

INSERT INTO Frontiere VALUES ('Colombie', 'Br??sil', 1643);
INSERT INTO Frontiere VALUES ('Colombie', '??quateur', 590);
INSERT INTO Frontiere VALUES ('Colombie', 'Panama', 225);
INSERT INTO Frontiere VALUES ('Colombie', 'P??rou', 1496);
INSERT INTO Frontiere VALUES ('Colombie', 'Venezuela', 2050);

INSERT INTO Frontiere VALUES ('Tchad', 'Cameroun', 1094);
INSERT INTO Frontiere VALUES ('Tchad', 'Libye', 1055);
INSERT INTO Frontiere VALUES ('Tchad', 'Niger', 1175);
INSERT INTO Frontiere VALUES ('Tchad', 'Nigeria', 87);
INSERT INTO Frontiere VALUES ('Tchad', 'R??publique centrafricaine', 1197);
INSERT INTO Frontiere VALUES ('Tchad', 'Soudan', 1360);

INSERT INTO Frontiere VALUES ('Birmanie', 'Bangladesh', 193);
INSERT INTO Frontiere VALUES ('Birmanie', 'Chine', 2185);
INSERT INTO Frontiere VALUES ('Birmanie', 'Inde', 1463);
INSERT INTO Frontiere VALUES ('Birmanie', 'Laos', 235);
INSERT INTO Frontiere VALUES ('Birmanie', 'Tha??lande', 1800);

INSERT INTO Frontiere VALUES ('Niger', 'Alg??rie', 956);
INSERT INTO Frontiere VALUES ('Niger', 'B??nin', 266);
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
INSERT INTO Frontiere VALUES ('Zambie', 'R??publique d??mocratique du Congo', 1930);
INSERT INTO Frontiere VALUES ('Zambie', 'Tanzanie', 338);
INSERT INTO Frontiere VALUES ('Zambie', 'Zimbabwe', 797);

INSERT INTO Frontiere VALUES ('P??rou', 'Bolivie', 900);
INSERT INTO Frontiere VALUES ('P??rou', 'Br??sil', 1560);
INSERT INTO Frontiere VALUES ('P??rou', 'Chili', 160);
INSERT INTO Frontiere VALUES ('P??rou', 'Colombie', 1496);
INSERT INTO Frontiere VALUES ('P??rou', '??quateur', 1420);

INSERT INTO Frontiere VALUES ('Afghanistan', 'Chine', 76);
INSERT INTO Frontiere VALUES ('Afghanistan', 'Iran', 936);
INSERT INTO Frontiere VALUES ('Afghanistan', 'Ouzb??kistan', 137);
INSERT INTO Frontiere VALUES ('Afghanistan', 'Pakistan', 2430);
INSERT INTO Frontiere VALUES ('Afghanistan', 'Tadjikistan', 1206);
INSERT INTO Frontiere VALUES ('Afghanistan', 'Turkm??nistan', 744);

INSERT INTO Frontiere VALUES ('R??publique du Congo', 'Angola', 201);
INSERT INTO Frontiere VALUES ('R??publique du Congo', 'Cameroun', 523);
INSERT INTO Frontiere VALUES ('R??publique du Congo', 'Gabon', 1903);
INSERT INTO Frontiere VALUES ('R??publique du Congo', 'R??publique centrafricaine', 467);
INSERT INTO Frontiere VALUES ('R??publique du Congo', 'R??publique d??mocratique du Congo', 2410);

INSERT INTO Frontiere VALUES ('Iran', 'Afghanistan', 936);
INSERT INTO Frontiere VALUES ('Iran', 'Arm??nie', 35);
INSERT INTO Frontiere VALUES ('Iran', 'Azerba??djan', 611);
INSERT INTO Frontiere VALUES ('Iran', 'Irak', 1458);
INSERT INTO Frontiere VALUES ('Iran', 'Pakistan', 909);
INSERT INTO Frontiere VALUES ('Iran', 'Turkm??nistan', 992);
INSERT INTO Frontiere VALUES ('Iran', 'Turquie', 499);

INSERT INTO Frontiere VALUES ('??thiopie', 'Djibouti', 349);
INSERT INTO Frontiere VALUES ('??thiopie', '??rythr??e', 912);
INSERT INTO Frontiere VALUES ('??thiopie', 'Kenya', 861);
INSERT INTO Frontiere VALUES ('??thiopie', 'Somalie', 1600);
INSERT INTO Frontiere VALUES ('??thiopie', 'Soudan', 723);
INSERT INTO Frontiere VALUES ('??thiopie', 'Soudan du Sud', 883);

INSERT INTO Frontiere VALUES ('Angola', 'Namibie', 1376);
INSERT INTO Frontiere VALUES ('Angola', 'R??publique d??mocratique du Congo', 2511);
INSERT INTO Frontiere VALUES ('Angola', 'R??publique du Congo', 201);
INSERT INTO Frontiere VALUES ('Angola', 'Zambie', 1110);

INSERT INTO Frontiere VALUES ('Laos', 'Birmanie', 235);
INSERT INTO Frontiere VALUES ('Laos', 'Cambodge', 541);
INSERT INTO Frontiere VALUES ('Laos', 'Chine', 423);
INSERT INTO Frontiere VALUES ('Laos', 'Tha??lande', 1754);
INSERT INTO Frontiere VALUES ('Laos', 'Vi??t Nam', 2130);

INSERT INTO Frontiere VALUES ('Mauritanie', 'Alg??rie', 463);
INSERT INTO Frontiere VALUES ('Mauritanie', 'Mali', 2237);
INSERT INTO Frontiere VALUES ('Mauritanie', 'Maroc', 1561);
INSERT INTO Frontiere VALUES ('Mauritanie', 'S??n??gal', 813);

INSERT INTO Frontiere VALUES ('Venezuela', 'Br??sil', 2200);
INSERT INTO Frontiere VALUES ('Venezuela', 'Colombie', 2050);
INSERT INTO Frontiere VALUES ('Venezuela', 'Guyana', 743);

INSERT INTO Frontiere VALUES ('Tha??lande', 'Birmanie', 1800);
INSERT INTO Frontiere VALUES ('Tha??lande', 'Cambodge', 803);
INSERT INTO Frontiere VALUES ('Tha??lande', 'Laos', 1754);
INSERT INTO Frontiere VALUES ('Tha??lande', 'Malaisie', 506);

INSERT INTO Frontiere VALUES ('Afrique du Sud', 'Botswana', 1840);
INSERT INTO Frontiere VALUES ('Afrique du Sud', 'Lesotho', 909);
INSERT INTO Frontiere VALUES ('Afrique du Sud', 'Mozambique', 491);
INSERT INTO Frontiere VALUES ('Afrique du Sud', 'Namibie', 967);
INSERT INTO Frontiere VALUES ('Afrique du Sud', 'Swaziland', 430);
INSERT INTO Frontiere VALUES ('Afrique du Sud', 'Zimbabwe', 225);

INSERT INTO Frontiere VALUES ('Soudan du Sud', '??thiopie', 883);
INSERT INTO Frontiere VALUES ('Soudan du Sud', 'Kenya', 232);
INSERT INTO Frontiere VALUES ('Soudan du Sud', 'Ouganda', 435);
INSERT INTO Frontiere VALUES ('Soudan du Sud', 'R??publique centrafricaine', 682);
INSERT INTO Frontiere VALUES ('Soudan du Sud', 'R??publique d??mocratique du Congo', 628);
INSERT INTO Frontiere VALUES ('Soudan du Sud', 'Soudan', 1937);

INSERT INTO Frontiere VALUES ('Ukraine', 'Bi??lorussie', 891);
INSERT INTO Frontiere VALUES ('Ukraine', 'Hongrie', 103);
INSERT INTO Frontiere VALUES ('Ukraine', 'Moldavie', 939);
INSERT INTO Frontiere VALUES ('Ukraine', 'Pologne', 526);
INSERT INTO Frontiere VALUES ('Ukraine', 'Roumanie', 531);
INSERT INTO Frontiere VALUES ('Ukraine', 'Russie', 1576);
INSERT INTO Frontiere VALUES ('Ukraine', 'Slovaquie', 97);

INSERT INTO Frontiere VALUES ('Vi??t Nam', 'Cambodge', 1228);
INSERT INTO Frontiere VALUES ('Vi??t Nam', 'Chine', 1281);
INSERT INTO Frontiere VALUES ('Vi??t Nam', 'Laos', 2130);

INSERT INTO Frontiere VALUES ('Mozambique', 'Afrique du Sud', 491);
INSERT INTO Frontiere VALUES ('Mozambique', 'Malawi', 1569);
INSERT INTO Frontiere VALUES ('Mozambique', 'Swaziland', 105);
INSERT INTO Frontiere VALUES ('Mozambique', 'Tanzanie', 756);
INSERT INTO Frontiere VALUES ('Mozambique', 'Zambie', 419);
INSERT INTO Frontiere VALUES ('Mozambique', 'Zimbabwe', 1231);

INSERT INTO Frontiere VALUES ('Arabie saoudite', '??mirats arabes unis', 457);
INSERT INTO Frontiere VALUES ('Arabie saoudite', 'Irak', 814);
INSERT INTO Frontiere VALUES ('Arabie saoudite', 'Jordanie', 744);
INSERT INTO Frontiere VALUES ('Arabie saoudite', 'Kowe??t', 222);
INSERT INTO Frontiere VALUES ('Arabie saoudite', 'Oman', 676);
INSERT INTO Frontiere VALUES ('Arabie saoudite', 'Qatar', 60);
INSERT INTO Frontiere VALUES ('Arabie saoudite', 'Y??men', 1458);

INSERT INTO Frontiere VALUES ('R??publique centrafricaine', 'R??publique d??mocratique du Congo', 1577);
INSERT INTO Frontiere VALUES ('R??publique centrafricaine', 'R??publique du Congo', 467);
INSERT INTO Frontiere VALUES ('R??publique centrafricaine', 'Soudan', 483);
INSERT INTO Frontiere VALUES ('R??publique centrafricaine', 'Soudan du Sud', 682);
INSERT INTO Frontiere VALUES ('R??publique centrafricaine', 'Tchad', 1197);

INSERT INTO Frontiere VALUES ('Libye', 'Alg??rie', 982);
INSERT INTO Frontiere VALUES ('Libye', '??gypte', 1115);
INSERT INTO Frontiere VALUES ('Libye', 'Niger', 354);
INSERT INTO Frontiere VALUES ('Libye', 'Soudan', 383);
INSERT INTO Frontiere VALUES ('Libye', 'Tchad', 1055);
INSERT INTO Frontiere VALUES ('Libye', 'Tunisie', 459);

INSERT INTO Frontiere VALUES ('Mexique', 'Belize', 193);
INSERT INTO Frontiere VALUES ('Mexique', '??tats-Unis', 3141);
INSERT INTO Frontiere VALUES ('Mexique', 'Guatemala', 959);

INSERT INTO Frontiere VALUES ('Bangladesh', 'Birmanie', 193);
INSERT INTO Frontiere VALUES ('Bangladesh', 'Inde', 4053);

INSERT INTO Frontiere VALUES ('France', 'Allemagne', 451);
INSERT INTO Frontiere VALUES ('France', 'Andorre', 57);
INSERT INTO Frontiere VALUES ('France', 'Belgique', 620);
INSERT INTO Frontiere VALUES ('France', 'Br??sil', 730);
INSERT INTO Frontiere VALUES ('France', 'Espagne', 623);
INSERT INTO Frontiere VALUES ('France', 'Italie', 488);
INSERT INTO Frontiere VALUES ('France', 'Luxembourg', 73);
INSERT INTO Frontiere VALUES ('France', 'Monaco', 4);
INSERT INTO Frontiere VALUES ('France', 'Pays-Bas', 10);
INSERT INTO Frontiere VALUES ('France', 'Suisse', 573);
INSERT INTO Frontiere VALUES ('France', 'Suriname', 510);

INSERT INTO Frontiere VALUES ('Nigeria', 'B??nin', 773);
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
INSERT INTO Frontiere VALUES ('Kirghizistan', 'Ouzb??kistan', 1099);
INSERT INTO Frontiere VALUES ('Kirghizistan', 'Tadjikistan', 870);

INSERT INTO Frontiere VALUES ('Tanzanie', 'Burundi', 451);
INSERT INTO Frontiere VALUES ('Tanzanie', 'Kenya', 769);
INSERT INTO Frontiere VALUES ('Tanzanie', 'Malawi', 475);
INSERT INTO Frontiere VALUES ('Tanzanie', 'Mozambique', 756);
INSERT INTO Frontiere VALUES ('Tanzanie', 'Ouganda', 396);
INSERT INTO Frontiere VALUES ('Tanzanie', 'R??publique d??mocratique du Congo', 459);
INSERT INTO Frontiere VALUES ('Tanzanie', 'Rwanda', 217);
INSERT INTO Frontiere VALUES ('Tanzanie', 'Zambie', 338);

INSERT INTO Frontiere VALUES ('Cameroun', 'Gabon', 298);
INSERT INTO Frontiere VALUES ('Cameroun', 'Guin??e ??quatoriale', 189);
INSERT INTO Frontiere VALUES ('Cameroun', 'Nigeria', 1690);
INSERT INTO Frontiere VALUES ('Cameroun', 'R??publique du Congo', 523);
INSERT INTO Frontiere VALUES ('Cameroun', 'Tchad', 1094);
INSERT INTO Frontiere VALUES ('Cameroun', 'R??publique centrafricaine', 822);

INSERT INTO Frontiere VALUES ('Paraguay', 'Argentine', 1699);
INSERT INTO Frontiere VALUES ('Paraguay', 'Bolivie', 750);
INSERT INTO Frontiere VALUES ('Paraguay', 'Br??sil', 1290);

INSERT INTO Frontiere VALUES ('Turkm??nistan', 'Afghanistan', 744);
INSERT INTO Frontiere VALUES ('Turkm??nistan', 'Iran', 992);
INSERT INTO Frontiere VALUES ('Turkm??nistan', 'Kazakhstan', 379);
INSERT INTO Frontiere VALUES ('Turkm??nistan', 'Ouzb??kistan', 1621);

INSERT INTO Frontiere VALUES ('Tadjikistan', 'Afghanistan', 1206);
INSERT INTO Frontiere VALUES ('Tadjikistan', 'Chine', 414);
INSERT INTO Frontiere VALUES ('Tadjikistan', 'Kirghizistan', 870);
INSERT INTO Frontiere VALUES ('Tadjikistan', 'Ouzb??kistan', 1161);

INSERT INTO Frontiere VALUES ('Irak', 'Arabie saoudite', 814);
INSERT INTO Frontiere VALUES ('Irak', 'Iran', 1458);
INSERT INTO Frontiere VALUES ('Irak', 'Jordanie', 181);
INSERT INTO Frontiere VALUES ('Irak', 'Kowe??t', 240);
INSERT INTO Frontiere VALUES ('Irak', 'Syrie', 605);
INSERT INTO Frontiere VALUES ('Irak', 'Turquie', 352);

INSERT INTO Frontiere VALUES ('Allemagne', 'Autriche', 784);
INSERT INTO Frontiere VALUES ('Allemagne', 'Belgique', 167);
INSERT INTO Frontiere VALUES ('Allemagne', 'Danemark', 68);
INSERT INTO Frontiere VALUES ('Allemagne', 'France', 451);
INSERT INTO Frontiere VALUES ('Allemagne', 'Luxembourg', 138);
INSERT INTO Frontiere VALUES ('Allemagne', 'Pays-Bas', 577);
INSERT INTO Frontiere VALUES ('Allemagne', 'Pologne', 456);
INSERT INTO Frontiere VALUES ('Allemagne', 'R??publique Tch??que', 646);
INSERT INTO Frontiere VALUES ('Allemagne', 'Suisse', 334);

INSERT INTO Frontiere VALUES ('Kenya', '??thiopie', 861);
INSERT INTO Frontiere VALUES ('Kenya', 'Ouganda', 933);
INSERT INTO Frontiere VALUES ('Kenya', 'Somalie', 682);
INSERT INTO Frontiere VALUES ('Kenya', 'Soudan du Sud', 232);
INSERT INTO Frontiere VALUES ('Kenya', 'Tanzanie', 769);

INSERT INTO Frontiere VALUES ('Guin??e', 'C??te d''Ivoire', 610);
INSERT INTO Frontiere VALUES ('Guin??e', 'Guin??e-Bissau', 386);
INSERT INTO Frontiere VALUES ('Guin??e', 'Liberia', 563);
INSERT INTO Frontiere VALUES ('Guin??e', 'Mali', 858);
INSERT INTO Frontiere VALUES ('Guin??e', 'S??n??gal', 330);
INSERT INTO Frontiere VALUES ('Guin??e', 'Sierra Leone', 652);

INSERT INTO Frontiere VALUES ('Burkina Faso', 'B??nin', 306);
INSERT INTO Frontiere VALUES ('Burkina Faso', 'C??te d''Ivoire', 584);
INSERT INTO Frontiere VALUES ('Burkina Faso', 'Ghana', 549);
INSERT INTO Frontiere VALUES ('Burkina Faso', 'Mali', 1000);
INSERT INTO Frontiere VALUES ('Burkina Faso', 'Niger', 628);
INSERT INTO Frontiere VALUES ('Burkina Faso', 'Togo', 126);

INSERT INTO Frontiere VALUES ('C??te d''Ivoire', 'Burkina Faso', 584);
INSERT INTO Frontiere VALUES ('C??te d''Ivoire', 'Ghana', 668);
INSERT INTO Frontiere VALUES ('C??te d''Ivoire', 'Guin??e', 610);
INSERT INTO Frontiere VALUES ('C??te d''Ivoire', 'Liberia', 716);
INSERT INTO Frontiere VALUES ('C??te d''Ivoire', 'Mali', 532);

INSERT INTO Frontiere VALUES ('Zimbabwe', 'Afrique du Sud', 225);
INSERT INTO Frontiere VALUES ('Zimbabwe', 'Botswana', 813);
INSERT INTO Frontiere VALUES ('Zimbabwe', 'Mozambique', 1231);
INSERT INTO Frontiere VALUES ('Zimbabwe', 'Zambie', 797);

INSERT INTO Frontiere VALUES ('Guyana', 'Br??sil', 1605);
INSERT INTO Frontiere VALUES ('Guyana', 'Suriname', 600);
INSERT INTO Frontiere VALUES ('Guyana', 'Venezuela', 743);

INSERT INTO Frontiere VALUES ('N??pal', 'Chine', 1236);
INSERT INTO Frontiere VALUES ('N??pal', 'Inde', 1690);

INSERT INTO Frontiere VALUES ('Bi??lorussie', 'Lettonie', 141);
INSERT INTO Frontiere VALUES ('Bi??lorussie', 'Lituanie', 502);
INSERT INTO Frontiere VALUES ('Bi??lorussie', 'Pologne', 407);
INSERT INTO Frontiere VALUES ('Bi??lorussie', 'Russie', 959);
INSERT INTO Frontiere VALUES ('Bi??lorussie', 'Ukraine', 891);

INSERT INTO Frontiere VALUES ('Malawi', 'Mozambique', 1569);
INSERT INTO Frontiere VALUES ('Malawi', 'Tanzanie', 475);
INSERT INTO Frontiere VALUES ('Malawi', 'Zambie', 837);

INSERT INTO Frontiere VALUES ('Indon??sie', 'Malaisie', 1782);
INSERT INTO Frontiere VALUES ('Indon??sie', 'Papouasie-Nouvelle-Guin??e', 820);
INSERT INTO Frontiere VALUES ('Indon??sie', 'Timor oriental', 228);

INSERT INTO Frontiere VALUES ('Pologne', 'Allemagne', 456);
INSERT INTO Frontiere VALUES ('Pologne', 'Bi??lorussie', 407);
INSERT INTO Frontiere VALUES ('Pologne', 'Lituanie', 91);
INSERT INTO Frontiere VALUES ('Pologne', 'R??publique Tch??que', 658);
INSERT INTO Frontiere VALUES ('Pologne', 'Russie', 232);
INSERT INTO Frontiere VALUES ('Pologne', 'Slovaquie', 444);
INSERT INTO Frontiere VALUES ('Pologne', 'Ukraine', 526);

INSERT INTO Frontiere VALUES ('Ouganda', 'Kenya', 933);
INSERT INTO Frontiere VALUES ('Ouganda', 'R??publique d??mocratique du Congo', 765);
INSERT INTO Frontiere VALUES ('Ouganda', 'Rwanda', 169);
INSERT INTO Frontiere VALUES ('Ouganda', 'Soudan du Sud', 435);
INSERT INTO Frontiere VALUES ('Ouganda', 'Tanzanie', 396);

INSERT INTO Frontiere VALUES ('Finlande', 'Norv??ge', 736);
INSERT INTO Frontiere VALUES ('Finlande', 'Russie', 1340);
INSERT INTO Frontiere VALUES ('Finlande', 'Su??de', 614);

INSERT INTO Frontiere VALUES ('Malaisie', 'Brunei', 381);
INSERT INTO Frontiere VALUES ('Malaisie', 'Indon??sie', 1782);
INSERT INTO Frontiere VALUES ('Malaisie', 'Tha??lande', 506);

INSERT INTO Frontiere VALUES ('??gypte', 'Isra??l', 266);
INSERT INTO Frontiere VALUES ('??gypte', 'Libye', 1115);
INSERT INTO Frontiere VALUES ('??gypte', 'Soudan', 1273);

INSERT INTO Frontiere VALUES ('S??n??gal', 'Gambie', 740);
INSERT INTO Frontiere VALUES ('S??n??gal', 'Guin??e', 330);
INSERT INTO Frontiere VALUES ('S??n??gal', 'Guin??e-Bissau', 338);
INSERT INTO Frontiere VALUES ('S??n??gal', 'Mali', 419);
INSERT INTO Frontiere VALUES ('S??n??gal', 'Mauritanie', 813);

INSERT INTO Frontiere VALUES ('Turquie', 'Arm??nie', 268);
INSERT INTO Frontiere VALUES ('Turquie', 'Azerba??djan', 9);
INSERT INTO Frontiere VALUES ('Turquie', 'Bulgarie', 240);
INSERT INTO Frontiere VALUES ('Turquie', 'G??orgie', 252);
INSERT INTO Frontiere VALUES ('Turquie', 'Gr??ce', 206);
INSERT INTO Frontiere VALUES ('Turquie', 'Irak', 352);
INSERT INTO Frontiere VALUES ('Turquie', 'Iran', 499);
INSERT INTO Frontiere VALUES ('Turquie', 'Syrie', 822);

INSERT INTO Frontiere VALUES ('Cambodge', 'Laos', 541);
INSERT INTO Frontiere VALUES ('Cambodge', 'Tha??lande', 803);
INSERT INTO Frontiere VALUES ('Cambodge', 'Vi??t Nam', 1228);

INSERT INTO Frontiere VALUES ('Autriche', 'Allemagne', 784);
INSERT INTO Frontiere VALUES ('Autriche', 'Hongrie', 366);
INSERT INTO Frontiere VALUES ('Autriche', 'Italie', 430);
INSERT INTO Frontiere VALUES ('Autriche', 'Liechtenstein', 35);
INSERT INTO Frontiere VALUES ('Autriche', 'R??publique Tch??que', 362);
INSERT INTO Frontiere VALUES ('Autriche', 'Slovaquie', 91);
INSERT INTO Frontiere VALUES ('Autriche', 'Slov??nie', 330);
INSERT INTO Frontiere VALUES ('Autriche', 'Suisse', 164);

INSERT INTO Frontiere VALUES ('Gabon', 'Cameroun', 298);
INSERT INTO Frontiere VALUES ('Gabon', 'Guin??e ??quatoriale', 350);
INSERT INTO Frontiere VALUES ('Gabon', 'R??publique du Congo', 1903);

INSERT INTO Frontiere VALUES ('Norv??ge', 'Finlande', 736);
INSERT INTO Frontiere VALUES ('Norv??ge', 'Russie', 196);
INSERT INTO Frontiere VALUES ('Norv??ge', 'Su??de', 1619);

INSERT INTO Frontiere VALUES ('Roumanie', 'Bulgarie', 608);
INSERT INTO Frontiere VALUES ('Roumanie', 'Hongrie', 443);
INSERT INTO Frontiere VALUES ('Roumanie', 'Moldavie', 450);
INSERT INTO Frontiere VALUES ('Roumanie', 'Serbie', 476);
INSERT INTO Frontiere VALUES ('Roumanie', 'Ukraine', 531);

INSERT INTO Frontiere VALUES ('Somalie', 'Djibouti', 58);
INSERT INTO Frontiere VALUES ('Somalie', '??thiopie', 1600);
INSERT INTO Frontiere VALUES ('Somalie', 'Kenya', 682);

INSERT INTO Frontiere VALUES ('Syrie', 'Irak', 605);
INSERT INTO Frontiere VALUES ('Syrie', 'Isra??l', 76);
INSERT INTO Frontiere VALUES ('Syrie', 'Jordanie', 375);
INSERT INTO Frontiere VALUES ('Syrie', 'Liban', 375);
INSERT INTO Frontiere VALUES ('Syrie', 'Turquie', 822);

INSERT INTO Frontiere VALUES ('Su??de', 'Finlande', 614);
INSERT INTO Frontiere VALUES ('Su??de', 'Norv??ge', 1619);

INSERT INTO Frontiere VALUES ('Croatie', 'Bosnie-Herz??govine', 932);
INSERT INTO Frontiere VALUES ('Croatie', 'Hongrie', 329);
INSERT INTO Frontiere VALUES ('Croatie', 'Mont??n??gro', 25);
INSERT INTO Frontiere VALUES ('Croatie', 'Serbie', 241);
INSERT INTO Frontiere VALUES ('Croatie', 'Slov??nie', 670);

INSERT INTO Frontiere VALUES ('Hongrie', 'Autriche', 366);
INSERT INTO Frontiere VALUES ('Hongrie', 'Croatie', 329);
INSERT INTO Frontiere VALUES ('Hongrie', 'Roumanie', 443);
INSERT INTO Frontiere VALUES ('Hongrie', 'Serbie', 151);
INSERT INTO Frontiere VALUES ('Hongrie', 'Slovaquie', 677);
INSERT INTO Frontiere VALUES ('Hongrie', 'Slov??nie', 102);
INSERT INTO Frontiere VALUES ('Hongrie', 'Ukraine', 103);

INSERT INTO Frontiere VALUES ('Ghana', 'Burkina Faso', 549);
INSERT INTO Frontiere VALUES ('Ghana', 'C??te d''Ivoire', 668);
INSERT INTO Frontiere VALUES ('Ghana', 'Togo', 877);

INSERT INTO Frontiere VALUES ('Sahara occidental', 'Alg??rie', 39);
INSERT INTO Frontiere VALUES ('Sahara occidental', 'Mauritanie', 1561);
INSERT INTO Frontiere VALUES ('Sahara occidental', 'Maroc', 443);

INSERT INTO Frontiere VALUES ('Serbie', 'Albanie', 115);
INSERT INTO Frontiere VALUES ('Serbie', 'Bosnie-Herz??govine', 302);
INSERT INTO Frontiere VALUES ('Serbie', 'Bulgarie', 318);
INSERT INTO Frontiere VALUES ('Serbie', 'Croatie', 241);
INSERT INTO Frontiere VALUES ('Serbie', 'Hongrie', 151);
INSERT INTO Frontiere VALUES ('Serbie', 'Mac??doine du Nord', 221);
INSERT INTO Frontiere VALUES ('Serbie', 'Mont??n??gro', 203);
INSERT INTO Frontiere VALUES ('Serbie', 'Roumanie', 476);

INSERT INTO Frontiere VALUES ('Maroc', 'Alg??rie', 1601);
INSERT INTO Frontiere VALUES ('Maroc', 'Espagne', 16);
INSERT INTO Frontiere VALUES ('Maroc', 'Sahara occidental', 443);

INSERT INTO Frontiere VALUES ('Azerba??djan', 'Arm??nie', 787);
INSERT INTO Frontiere VALUES ('Azerba??djan', 'G??orgie', 322);
INSERT INTO Frontiere VALUES ('Azerba??djan', 'Iran', 611);
INSERT INTO Frontiere VALUES ('Azerba??djan', 'Russie', 284);
INSERT INTO Frontiere VALUES ('Azerba??djan', 'Turquie', 9);

INSERT INTO Frontiere VALUES ('??quateur', 'Colombie', 590);
INSERT INTO Frontiere VALUES ('??quateur', 'P??rou', 1420);

INSERT INTO Frontiere VALUES ('B??nin', 'Burkina Faso', 306);
INSERT INTO Frontiere VALUES ('B??nin', 'Niger', 266);
INSERT INTO Frontiere VALUES ('B??nin', 'Nigeria', 773);
INSERT INTO Frontiere VALUES ('B??nin', 'Togo', 644);

INSERT INTO Frontiere VALUES ('Italie', 'Autriche', 430);
INSERT INTO Frontiere VALUES ('Italie', 'France', 488);
INSERT INTO Frontiere VALUES ('Italie', 'Saint-Marin', 39);
INSERT INTO Frontiere VALUES ('Italie', 'Slov??nie', 232);
INSERT INTO Frontiere VALUES ('Italie', 'Suisse', 740);
INSERT INTO Frontiere VALUES ('Italie', 'Vatican', 3);

INSERT INTO Frontiere VALUES ('Espagne', 'Andorre', 64);
INSERT INTO Frontiere VALUES ('Espagne', 'France', 623);
INSERT INTO Frontiere VALUES ('Espagne', 'Maroc', 16);
INSERT INTO Frontiere VALUES ('Espagne', 'Portugal', 1214);
INSERT INTO Frontiere VALUES ('Espagne', 'Royaume-Uni', 1);

INSERT INTO Frontiere VALUES ('R??publique Tch??que', 'Allemagne', 646);
INSERT INTO Frontiere VALUES ('R??publique Tch??que', 'Autriche', 362);
INSERT INTO Frontiere VALUES ('R??publique Tch??que', 'Pologne', 658);
INSERT INTO Frontiere VALUES ('R??publique Tch??que', 'Slovaquie', 215);

INSERT INTO Frontiere VALUES ('Suisse', 'Allemagne', 334);
INSERT INTO Frontiere VALUES ('Suisse', 'Autriche', 164);
INSERT INTO Frontiere VALUES ('Suisse', 'France', 573);
INSERT INTO Frontiere VALUES ('Suisse', 'Italie', 740);
INSERT INTO Frontiere VALUES ('Suisse', 'Liechtenstein', 41);

INSERT INTO Frontiere VALUES ('Bulgarie', 'Gr??ce', 494);
INSERT INTO Frontiere VALUES ('Bulgarie', 'Mac??doine du Nord', 148);
INSERT INTO Frontiere VALUES ('Bulgarie', 'Roumanie', 608);
INSERT INTO Frontiere VALUES ('Bulgarie', 'Serbie', 318);
INSERT INTO Frontiere VALUES ('Bulgarie', 'Turquie', 240);

INSERT INTO Frontiere VALUES ('Y??men', 'Arabie saoudite', 1458);
INSERT INTO Frontiere VALUES ('Y??men', 'Oman', 288);

INSERT INTO Frontiere VALUES ('Suriname', 'Br??sil', 593);
INSERT INTO Frontiere VALUES ('Suriname', 'France', 510);
INSERT INTO Frontiere VALUES ('Suriname', 'Guyana', 600);

INSERT INTO Frontiere VALUES ('Guatemala', 'Belize', 266);
INSERT INTO Frontiere VALUES ('Guatemala', 'Honduras', 256);
INSERT INTO Frontiere VALUES ('Guatemala', 'Mexique', 959);
INSERT INTO Frontiere VALUES ('Guatemala', 'Salvador', 203);

INSERT INTO Frontiere VALUES ('Cor??e du Nord', 'Chine', 1416);
INSERT INTO Frontiere VALUES ('Cor??e du Nord', 'Cor??e du Sud', 238);
INSERT INTO Frontiere VALUES ('Cor??e du Nord', 'Russie', 19);

INSERT INTO Frontiere VALUES ('Togo', 'B??nin', 644);
INSERT INTO Frontiere VALUES ('Togo', 'Burkina Faso', 126);
INSERT INTO Frontiere VALUES ('Togo', 'Ghana', 877);

INSERT INTO Frontiere VALUES ('??rythr??e', 'Djibouti', 109);
INSERT INTO Frontiere VALUES ('??rythr??e', '??thiopie', 912);
INSERT INTO Frontiere VALUES ('??rythr??e', 'Soudan', 605);

INSERT INTO Frontiere VALUES ('Liberia', 'C??te d''Ivoire', 716);
INSERT INTO Frontiere VALUES ('Liberia', 'Guin??e', 563);
INSERT INTO Frontiere VALUES ('Liberia', 'Sierra Leone', 306);

INSERT INTO Frontiere VALUES ('Uruguay', 'Argentine', 579);
INSERT INTO Frontiere VALUES ('Uruguay', 'Br??sil', 985);

INSERT INTO Frontiere VALUES ('Jordanie', 'Arabie saoudite', 744);
INSERT INTO Frontiere VALUES ('Jordanie', 'Irak', 181);
INSERT INTO Frontiere VALUES ('Jordanie', 'Isra??l', 238);
INSERT INTO Frontiere VALUES ('Jordanie', 'Syrie', 375);

INSERT INTO Frontiere VALUES ('Slovaquie', 'Autriche', 91);
INSERT INTO Frontiere VALUES ('Slovaquie', 'Hongrie', 677);
INSERT INTO Frontiere VALUES ('Slovaquie', 'Pologne', 444);
INSERT INTO Frontiere VALUES ('Slovaquie', 'R??publique Tch??que', 215);
INSERT INTO Frontiere VALUES ('Slovaquie', 'Ukraine', 97);

INSERT INTO Frontiere VALUES ('G??orgie', 'Arm??nie', 164);
INSERT INTO Frontiere VALUES ('G??orgie', 'Azerba??djan', 322);
INSERT INTO Frontiere VALUES ('G??orgie', 'Russie', 723);
INSERT INTO Frontiere VALUES ('G??orgie', 'Turquie', 252);

INSERT INTO Frontiere VALUES ('Tunisie', 'Alg??rie', 1010);
INSERT INTO Frontiere VALUES ('Tunisie', 'Libye', 459);

INSERT INTO Frontiere VALUES ('Bosnie-Herz??govine', 'Croatie', 932);
INSERT INTO Frontiere VALUES ('Bosnie-Herz??govine', 'Mont??n??gro', 225);
INSERT INTO Frontiere VALUES ('Bosnie-Herz??govine', 'Serbie', 302);

INSERT INTO Frontiere VALUES ('Moldavie', 'Roumanie', 450);
INSERT INTO Frontiere VALUES ('Moldavie', 'Ukraine', 939);

INSERT INTO Frontiere VALUES ('Belgique', 'Allemagne', 167);
INSERT INTO Frontiere VALUES ('Belgique', 'France', 620);
INSERT INTO Frontiere VALUES ('Belgique', 'Luxembourg', 148);
INSERT INTO Frontiere VALUES ('Belgique', 'Pays-Bas', 450);

INSERT INTO Frontiere VALUES ('Oman', 'Arabie saoudite', 676);
INSERT INTO Frontiere VALUES ('Oman', '??mirats arabes unis', 410);
INSERT INTO Frontiere VALUES ('Oman', 'Y??men', 288);

INSERT INTO Frontiere VALUES ('Slov??nie', 'Autriche', 330);
INSERT INTO Frontiere VALUES ('Slov??nie', 'Croatie', 670);
INSERT INTO Frontiere VALUES ('Slov??nie', 'Hongrie', 102);
INSERT INTO Frontiere VALUES ('Slov??nie', 'Italie', 232);

INSERT INTO Frontiere VALUES ('Lituanie', 'Bi??lorussie', 502);
INSERT INTO Frontiere VALUES ('Lituanie', 'Lettonie', 453);
INSERT INTO Frontiere VALUES ('Lituanie', 'Pologne', 91);
INSERT INTO Frontiere VALUES ('Lituanie', 'Russie', 280);

INSERT INTO Frontiere VALUES ('Arm??nie', 'Azerba??djan', 787);
INSERT INTO Frontiere VALUES ('Arm??nie', 'G??orgie', 164);
INSERT INTO Frontiere VALUES ('Arm??nie', 'Iran', 35);
INSERT INTO Frontiere VALUES ('Arm??nie', 'Turquie', 268);

INSERT INTO Frontiere VALUES ('Gr??ce', 'Albanie', 282);
INSERT INTO Frontiere VALUES ('Gr??ce', 'Bulgarie', 494);
INSERT INTO Frontiere VALUES ('Gr??ce', 'Mac??doine du Nord', 246);
INSERT INTO Frontiere VALUES ('Gr??ce', 'Turquie', 206);

INSERT INTO Frontiere VALUES ('Portugal', 'Espagne', 1214);

INSERT INTO Frontiere VALUES ('Lettonie', 'Bi??lorussie', 141);
INSERT INTO Frontiere VALUES ('Lettonie', 'Estonie', 339);
INSERT INTO Frontiere VALUES ('Lettonie', 'Lituanie', 453);
INSERT INTO Frontiere VALUES ('Lettonie', 'Russie', 217);

INSERT INTO Frontiere VALUES ('Bhoutan', 'Chine', 470);
INSERT INTO Frontiere VALUES ('Bhoutan', 'Inde', 605);

INSERT INTO Frontiere VALUES ('Pays-Bas', 'Allemagne', 577);
INSERT INTO Frontiere VALUES ('Pays-Bas', 'Belgique', 450);
INSERT INTO Frontiere VALUES ('Pays-Bas', 'France', 10);

INSERT INTO Frontiere VALUES ('Burundi', 'R??publique d??mocratique du Congo', 233);
INSERT INTO Frontiere VALUES ('Burundi', 'Rwanda', 290);
INSERT INTO Frontiere VALUES ('Burundi', 'Tanzanie', 451);

INSERT INTO Frontiere VALUES ('Sierra Leone', 'Guin??e', 652);
INSERT INTO Frontiere VALUES ('Sierra Leone', 'Liberia', 306);

INSERT INTO Frontiere VALUES ('Lesotho', 'Afrique du Sud', 909);

INSERT INTO Frontiere VALUES ('Rwanda', 'Burundi', 290);
INSERT INTO Frontiere VALUES ('Rwanda', 'Ouganda', 169);
INSERT INTO Frontiere VALUES ('Rwanda', 'R??publique d??mocratique du Congo', 217);
INSERT INTO Frontiere VALUES ('Rwanda', 'Tanzanie', 217);

INSERT INTO Frontiere VALUES ('??mirats arabes unis', 'Arabie saoudite', 457);
INSERT INTO Frontiere VALUES ('??mirats arabes unis', 'Oman', 410);

INSERT INTO Frontiere VALUES ('Honduras', 'Guatemala', 256);
INSERT INTO Frontiere VALUES ('Honduras', 'Nicaragua', 342);
INSERT INTO Frontiere VALUES ('Honduras', 'Salvador', 256);

INSERT INTO Frontiere VALUES ('Papouasie-Nouvelle-Guin??e', 'Indon??sie', 820);

INSERT INTO Frontiere VALUES ('Mac??doine du Nord', 'Albanie', 151);
INSERT INTO Frontiere VALUES ('Mac??doine du Nord', 'Bulgarie', 148);
INSERT INTO Frontiere VALUES ('Mac??doine du Nord', 'Gr??ce', 246);
INSERT INTO Frontiere VALUES ('Mac??doine du Nord', 'Serbie', 221);

INSERT INTO Frontiere VALUES ('Gambie', 'S??n??gal', 740);

INSERT INTO Frontiere VALUES ('Guin??e-Bissau', 'Guin??e', 386);
INSERT INTO Frontiere VALUES ('Guin??e-Bissau', 'S??n??gal', 338);

INSERT INTO Frontiere VALUES ('Albanie', 'Gr??ce', 282);
INSERT INTO Frontiere VALUES ('Albanie', 'Mac??doine du Nord', 151);
INSERT INTO Frontiere VALUES ('Albanie', 'Mont??n??gro', 172);
INSERT INTO Frontiere VALUES ('Albanie', 'Serbie', 115);

INSERT INTO Frontiere VALUES ('Kosovo', 'Serbie', 352);
INSERT INTO Frontiere VALUES ('Kosovo', 'Mac??doine du Nord', 159);
INSERT INTO Frontiere VALUES ('Kosovo', 'Albanie', 112);
INSERT INTO Frontiere VALUES ('Kosovo', 'Mont??n??gro', 79);

INSERT INTO Frontiere VALUES ('Isra??l', '??gypte', 266);
INSERT INTO Frontiere VALUES ('Isra??l', 'Jordanie', 238);
INSERT INTO Frontiere VALUES ('Isra??l', 'Liban', 79);
INSERT INTO Frontiere VALUES ('Isra??l', 'Syrie', 76);

INSERT INTO Frontiere VALUES ('Nicaragua', 'Costa Rica', 309);
INSERT INTO Frontiere VALUES ('Nicaragua', 'Honduras', 342);

INSERT INTO Frontiere VALUES ('Costa Rica', 'Nicaragua', 309);
INSERT INTO Frontiere VALUES ('Costa Rica', 'Panama', 330);

INSERT INTO Frontiere VALUES ('Estonie', 'Lettonie', 339);
INSERT INTO Frontiere VALUES ('Estonie', 'Russie', 294);

INSERT INTO Frontiere VALUES ('Mont??n??gro', 'Albanie', 172);
INSERT INTO Frontiere VALUES ('Mont??n??gro', 'Bosnie-Herz??govine', 225);
INSERT INTO Frontiere VALUES ('Mont??n??gro', 'Croatie', 25);
INSERT INTO Frontiere VALUES ('Mont??n??gro', 'Serbie', 203);

INSERT INTO Frontiere VALUES ('Panama', 'Colombie', 225);
INSERT INTO Frontiere VALUES ('Panama', 'Costa Rica', 330);

INSERT INTO Frontiere VALUES ('Guin??e ??quatoriale', 'Cameroun', 189);
INSERT INTO Frontiere VALUES ('Guin??e ??quatoriale', 'Gabon', 350);

INSERT INTO Frontiere VALUES ('Swaziland', 'Afrique du Sud', 430);
INSERT INTO Frontiere VALUES ('Swaziland', 'Mozambique', 105);

INSERT INTO Frontiere VALUES ('Djibouti', '??rythr??e', 109);
INSERT INTO Frontiere VALUES ('Djibouti', '??thiopie', 349);
INSERT INTO Frontiere VALUES ('Djibouti', 'Somalie', 58);

INSERT INTO Frontiere VALUES ('Palestine', '??gypte', 11);
INSERT INTO Frontiere VALUES ('Palestine', 'Isra??l', 358);
INSERT INTO Frontiere VALUES ('Palestine', 'Jordanie', 97);

INSERT INTO Frontiere VALUES ('Royaume-Uni', 'Chypre', 152);
INSERT INTO Frontiere VALUES ('Royaume-Uni', 'Espagne', 1);
INSERT INTO Frontiere VALUES ('Royaume-Uni', 'Irlande', 360);

INSERT INTO Frontiere VALUES ('Kowe??t', 'Arabie saoudite', 222);
INSERT INTO Frontiere VALUES ('Kowe??t', 'Irak', 240);

INSERT INTO Frontiere VALUES ('Belize', 'Guatemala', 266);
INSERT INTO Frontiere VALUES ('Belize', 'Mexique', 193);

INSERT INTO Frontiere VALUES ('Salvador', 'Guatemala', 203);
INSERT INTO Frontiere VALUES ('Salvador', 'Honduras', 256);

INSERT INTO Frontiere VALUES ('Liban', 'Isra??l', 79);
INSERT INTO Frontiere VALUES ('Liban', 'Syrie', 375);

INSERT INTO Frontiere VALUES ('Brunei', 'Malaisie', 381);

INSERT INTO Frontiere VALUES ('R??publique dominicaine', 'Ha??ti', 360);

INSERT INTO Frontiere VALUES ('Ha??ti', 'R??publique dominicaine', 360);

INSERT INTO Frontiere VALUES ('Irlande', 'Royaume-Uni', 360);

INSERT INTO Frontiere VALUES ('Luxembourg', 'Allemagne', 138);
INSERT INTO Frontiere VALUES ('Luxembourg', 'Belgique', 148);
INSERT INTO Frontiere VALUES ('Luxembourg', 'France', 73);

INSERT INTO Frontiere VALUES ('Cor??e du Sud', 'Cor??e du Nord', 238);

INSERT INTO Frontiere VALUES ('Timor oriental', 'Indon??sie', 228);

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
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Kilimandjaro - Kibo', 5892, 'Vall??e du grand rift');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Tanzanie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Kenya', 5199, 'Vall??e du grand rift');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Kenya');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Kilimandjaro - Mawenzi', 5149, 'Vall??e du grand rift');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Tanzanie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Stanley', 5109, 'Rwenzori');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'R??publique d??mocratique du Congo');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Ouganda');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Speke', 4890, 'Rwenzori');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Ouganda');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Baker', 4844, 'Rwenzori');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Ouganda');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Emin', 4798, 'Rwenzori');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'R??publique d??mocratique du Congo');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Gessi', 4715, 'Rwenzori');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Ouganda');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont M??ru', 4565, 'Vall??e du grand rift');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Tanzanie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Ras Dashan', 4550, 'Plateaux d''??thiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??thiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Karisimbi', 4507, 'Montagnes des Virunga');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'R??publique d??mocratique du Congo');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Rwanda');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Mikeno', 4437, 'Montagnes des Virunga');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'R??publique d??mocratique du Congo');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Bwahit', 4430, 'Plateaux d''??thiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??thiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Silki', 4420, 'Plateaux d''??thiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??thiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Batu', 4400, 'Plateaux d''??thiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??thiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pics Portal', 4391, 'Rwenzori');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Ouganda');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Elgon', 4321, 'Vall??e du grand rift');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Kenya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Ouganda');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Amba Farit', 4270, 'Plateaux d''??thiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??thiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Abune Yosef', 4260, 'Plateaux d''??thiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??thiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Bada', 4195, 'Plateaux d''??thiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??thiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Djebel Toubkal', 4167, 'Atlas');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Maroc');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Muhabura', 4127, 'Montagnes des Virunga');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Ouganda');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Rwanda');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Guna Terara', 4120, 'Plateaux d''??thiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??thiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Choqa', 4100, 'Plateaux d''??thiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??thiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Ighil M''Goun', 4071, 'Atlas');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Maroc');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Inatye', 4070, 'Plateaux d''??thiopie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??thiopie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Cameroun', 4040, 'Ligne du Cameroun');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Cameroun');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Oldoinyo Lesatima', 4001, 'Vall??e du grand rift');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Kenya');

-- Am??rique
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Denali', 6190, 'Cha??ne d''Alaska');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??tats-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Logan', 5959, 'Cha??ne Saint-??lie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pic d''Orizaba', 5675, 'Cordill??re n??ovolcanique');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Mexique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Saint-??lie', 5489, 'Cha??ne Saint-??lie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??tats-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Popocatepetl', 5426, 'Cordill??re n??ovolcanique');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Mexique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Foraker', 5304, 'Cha??ne d''Alaska');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??tats-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Lucania', 5240, 'Cha??ne Saint-??lie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Iztacc??huatl', 5230, 'Cordill??re n??ovolcanique');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Mexique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pic King', 5173, 'Cha??ne Saint-??lie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Steele', 5073, 'Cha??ne Saint-??lie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Bona', 5005, 'Cha??ne Saint-??lie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??tats-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Blackburn', 4996, 'Montagnes Wrangell');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??tats-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Sanford', 4949, 'Montagnes Wrangell');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??tats-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Wood', 4840, 'Cha??ne Saint-??lie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Vancouver', 4812, 'Cha??ne Saint-??lie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Slaggard', 4742, 'Cha??ne Saint-??lie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Nevado de Toluca', 4680, 'Cordill??re n??ovolcanique');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Mexique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Macaulay', 4680, 'Cha??ne Saint-??lie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Fairweather', 4671, 'Cha??ne Saint-??lie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??tats-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Sierra Negra', 4580, 'Cordill??re n??ovolcanique');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Mexique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Hubbard', 4557, 'Cha??ne Saint-??lie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??tats-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Bear', 4520, 'Cha??ne Saint-??lie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, '??tats-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Walsh', 4506, 'Cha??ne Saint-??lie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Canada');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Aconcagua', 6962, 'Cordill??re des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Nevado Ojos del Salado', 6893, 'Cordill??re des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chili');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Monte Pissis', 6793, 'Cordill??re des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Huascar??n Sur', 6768, 'Cordill??re des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'P??rou');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Cerro Bonete Chico', 6759, 'Cordill??re des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Tres Cruces Sur', 6748, 'Cordill??re des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chili');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Llullaillaco', 6739, 'Cordill??re des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chili');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mercedario', 6720, 'Cordill??re des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Huascar??n Norte', 6664, 'Cordill??re des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'P??rou');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Walter Penck I', 6658, 'Cordill??re des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Yerupaj??', 6635, 'Cordill??re des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'P??rou');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Tres Cruces Central', 6629, 'Cordill??re des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chili');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Nevado de Incahuasi', 6621, 'Cordill??re des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chili');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Tupungato', 6570, 'Cordill??re des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Argentine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chili');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Nevado Sajama', 6542, 'Cordill??re des Andes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Bolivie');

-- Antarctique
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Massif Vinson', 4892, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Tyree', 4852, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Shinn', 4661, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Epperly', 4602, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Gardner', 4587, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Kirkpatrick', 4528, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Elizabeth', 4480, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Rutford', 4477, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Craddock', 4368, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Markham', 4351, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Bell', 4303, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Mackellar', 4297, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Sidley', 4285, 'Cha??ne de l''Executive Committee');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Anderson', 4254, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Bentley', 4247, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Kaplan', 4230, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Sommet Fleming', 4200, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Ostenso', 4179, 'Monts Ellsworth');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Minto', 4166, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Miller', 4160, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Dickerson', 4120, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'D??me Argus', 4093, NULL);
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Wade', 4084, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Fisher', 4080, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pic Centennial', 4070, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Fridtjof Nansen', 4069, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Lister', 4025, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Wexler', 4024, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pic Decennial', 4020, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Adam', 4010, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Flat Top', 4000, 'Cha??ne Transantarctique');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Korsch', 4000, 'Cha??ne Transantarctique');

-- Asie
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Everest', 8848, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'N??pal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'K2', 8611, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Kangchenjunga', 8586, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Inde');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'N??pal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Lhotse', 8516, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'N??pal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Makalu', 8485, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'N??pal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Cho Oyu', 8188, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'N??pal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Dhaulagiri I', 8167, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'N??pal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Manaslu', 8163, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'N??pal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Nanga Parbat', 8126, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Annapurna I', 8091, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'N??pal');
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
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'N??pal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Annapurna II', 7937, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'N??pal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Gasherbrum IV', 7932, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Himalchuli', 7893, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'N??pal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Distaghil Sar', 7884, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Ngadi Chuli', 7871, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'N??pal');
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
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'N??pal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Saltoro Kangri', 7742, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Inde');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Jannu', 7711, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'N??pal');
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
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'N??pal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Kongur Tagh', 7649, 'Cordill??re du Kunlun');
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
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'N??pal');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mustagh Ata', 7546, 'Cordill??re du Kunlun');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Skyang Kangri', 7545, 'Karakoram');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Pakistan');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Changtse', 7543, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Kula Kangri', 7538, 'Himalaya');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Bhoutan');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Chine');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Kongur Tiube', 7530, 'Cordill??re du Kunlun');
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
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'G??orgie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Kochtan-Taou', 5150, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Kazbek', 5047, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'G??orgie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Blanc', 4809, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'France');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Italie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Djimara', 4780, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'G??orgie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Ouilpata', 4649, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pointe Dufour', 4634, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Tikhtengen', 4618, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'G??orgie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Ailama', 4546, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'G??orgie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Dom des Mischabel', 4545, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Jailik', 4533, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Salinan', 4508, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Weisshorn', 4505, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Teboulo', 4493, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'G??orgie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Cervin', 4478, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Italie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Bazard??z??', 4466, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Azerba??djan');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Shani', 4451, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'G??orgie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Tepli', 4431, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Dent Blanche', 4357, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Grand Combin', 4314, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Diklo', 4285, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'G??orgie');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Russie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Finsteraarhorn', 4274, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Shahdagh', 4243, 'Caucase');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Azerba??djan');
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
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Dent d''H??rens', 4171, 'Alpes');
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
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'M??nch', 4107, 'Alpes');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Suisse');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Barre des ??crins', 4102, 'Alpes');
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

-- Oc??anie
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Puncak Jaya', 4884, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Sumantri', 4870, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Nga Pulu', 4862, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Carstensz Oriental', 4820, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Puncak Trikora', 4750, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Ngga Pilimsit', 4717, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Puncak Mandala', 4640, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pic Wollaston', 4600, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Yamin', 4595, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont David', 4581, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Akimuga', 4525, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Wilhelm', 4509, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Valentiyn', 4453, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Giluwe', 4368, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Kubor', 4359, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Bakoppa', 4330, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Grasberg', 4270, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Herbert', 4262, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Leonard Darwin', 4230, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mauna Kea', 4207, '??le d''Hawa??');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL,'??tats-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mauna Loa', 4170, '??le d''Hawa??');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL,'??tats-Unis');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Platen Spitz', 4150, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Boising', 4150, 'Monts Finisterre');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Bangeta', 4121, 'Monts Finisterre');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Kabangama', 4104, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Nggumbulu', 4061, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Victoria', 4038, 'Cha??ne Owen Stanley');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Albert Edward', 3993, 'Cha??ne Owen Stanley');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Maurits', 3990, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Antares', 3970, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Angemuk', 3962, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Willem', 3905, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pic Tuktuai', 3889, 'Monts Finisterre');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Boongkat', 3875, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Hagen', 3834, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Cook', 3755, 'Alpes du Sud');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Nouvelle-Z??lande');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Suckling', 3676, 'Cha??ne Owen Stanley');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Putigibuli', 3660, 'Monts Maoke');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Indon??sie');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Michael', 3647, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Karoma', 3623, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Pics Doma', 3568, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
INSERT INTO Montagne VALUES (Seq_Montagne.NEXTVAL, 'Mont Priora', 3557, 'Monts Bismarck');
INSERT INTO Localiser VALUES (Seq_Montagne.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
COMMIT;



-- Afrique
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Medjerda', 460, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Tunisie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Bandama', 1050, 'lagune Lahou');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'C??te d''Ivoire');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Betsiboka', 525, 'baie de Bombetoka');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Madagascar');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Chelif', 733, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Alg??rie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Soummam', 425, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Alg??rie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Bouregreg', 240, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Maroc');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Casamance', 300, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'S??n??gal');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Cavally', 515, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Guin??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Liberia');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'C??te d''Ivoire');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Chari', 1200, 'lac Tchad');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'R??publique centrafricaine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Tchad');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Cameroun');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Como??', 813, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Burkina Faso');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'C??te d''Ivoire');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Congo', 4700, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'R??publique d??mocratique du Congo');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'R??publique du Congo');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Angola');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Dr??a', 1100, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Maroc');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Gambie', 1150, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Guin??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'S??n??gal');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Gambie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Jubba', 1658, 'oc??an Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, '??thiopie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Somalie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Limpopo', 1600, 'oc??an Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Botswana');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Afrique du Sud');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Zimbabwe');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mozambique');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Mangoky', 714, 'oc??an Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Madagascar');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Maningoza', NULL, 'oc??an Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Madagascar');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Mono', 467, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Togo');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'B??nin');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Moulouya', 600, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Maroc');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Niger', 4184, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Guin??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mali');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Niger');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'B??nin');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nigeria');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Nil', 6700, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, '??thiopie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, '??rythr??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Soudan');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Soudan du Sud');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, '??gypte');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Rwanda');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Tanzanie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ouganda');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Burundi');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'R??publique d??mocratique du Congo');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Kenya');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Nouveau Calabar', NULL, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nigeria');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Nyong', 690, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Cameroun');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Ogoou??', 893, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'R??publique du Congo');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Gabon');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Okavango', 1600, 'd??sert du Kalahari');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Angola');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Namibie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Botswana');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Orange', 2160, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Lesotho');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Afrique du Sud');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Namibie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Oti', 500, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Burkina Faso');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'B??nin');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Togo');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ghana');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Oum Errabi??', 550, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Maroc');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Ruvuma', 800, 'oc??an Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mozambique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Tanzanie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Saloum', 250, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'S??n??gal');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Sanaga', 918, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Cameroun');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Sebou', 614, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Maroc');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le S??n??gal', 1750, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Guin??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mali');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mauritanie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'S??n??gal');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Tana', 1014, 'oc??an Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Kenya');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Volta', 1346, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Burkina Faso');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ghana');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'C??te d''Ivoire');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Wouri', 160, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Cameroun');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Zamb??ze', 2750, 'oc??an Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Zambie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Angola');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Namibie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Zimbabwe');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mozambique');
	

-- Am??rique
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Amazone', 6437, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'P??rou');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Colombie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Br??sil');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Atrato', 750, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Colombie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Brazos', 2060, 'golfe du Mexique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, '??tats-Unis');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Colorado', 2330, 'golfe de Californie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, '??tats-Unis');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mexique');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Corentyne', 724, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Guyana');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Suriname');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Columbia', 1954, 'oc??an Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Canada');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, '??tats-Unis');	

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Essequibo', 1014, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Guyana');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Fraser', 1370, 'oc??an Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Canada');
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Hudson', 507, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, '??tats-Unis');	

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Lempa', 422, 'oc??an Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Guatemala');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Honduras');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Salvador');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Mackenzie', 1738, 'oc??an Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Canada');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Magdalena', 1558, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Colombie');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Maroni', 612, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Suriname');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Mississippi', 3780, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, '??tats-Unis');


INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Mobile', 72, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, '??tats-Unis');	

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Moche', 102, 'oc??an Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'P??rou');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Nelson', 660, 'baie d''Hudson');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Canada');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Or??noque', 2140, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Venezuela');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Colombie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Oyapock', 403, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Br??sil');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Paran??', 4099, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Br??sil');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Paraguay');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Argentine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Parna??ba', 1344, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Br??sil');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Potomac', 665, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, '??tats-Unis');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le R??mac', 160, 'oc??an Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'P??rou');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le R??o Chubut', 810, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Argentine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Rio Colorado', 1114, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Argentine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le R??o Grande', 3060, 'golfe du Mexique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, '??tats-Unis');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mexique');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le R??o Negro', 1135, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Argentine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Saint-Jean', 673, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, '??tats-Unis');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Canada');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Saint-Laurent', 1140, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Canada');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, '??tats-Unis');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le San Juan', 380, 'oc??an Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Colombie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Santa Cruz', 477, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Argentine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le S??o Francisco', 3160, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Br??sil');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Savannah', 563, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, '??tats-Unis');	

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Sinnamary', 262, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Suriname', 480, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Suriname');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Tocantins', 2600, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Br??sil');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Uruguay', 1600, 'r??o de la Plata');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Br??sil');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Argentine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Uruguay');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Yukon', 3185, 'mer de B??ring');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Canada');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, '??tats-Unis');	

-- Asie
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Alaze??a', 1590, 'oc??an Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Amou-Daria', 2580, 'mer d''Aral');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Afghanistan');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Tadjikistan');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ouzb??kistan');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Turkm??nistan');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Amour', 4354, 'oc??an Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Anabar', 939, 'oc??an Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Anadyr', 1146, 'mer de B??ring');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Brahmapoutre', 2896, 'golfe du Bengale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Bangladesh');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Cagayan', 505, 'mer des Philippines');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Philippines');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Cauvery', 950, 'golfe du Bengale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Chao Phraya', 372, 'golfe de Tha??lande');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Tha??lande');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Chatt-el-Arab', 200, 'golfe Persique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Irak');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Iran');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Euphrate', 2780, 'golfe Persique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Turquie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Syrie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Irak');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le fleuve Jaune', 5646, 'mer de Chine orientale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le fleuve Rouge', 1149, 'mer de Chine m??ridionale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Vi??t Nam');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Gange', 2510, 'golfe du Bengale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Bangladesh');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Godavari', 1500, 'golfe du Bengale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Hai He', 70, 'golfe de Bohai');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Iana', 1490, 'oc??an Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Ienisse??', 4093, 'mer de Kara');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mongolie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Ili', 1439, 'lac Balkhach');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Kazakhstan');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Indiguirka', 1726, 'oc??an Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Indus', 3180, 'mer d''Arabie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Pakistan');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Irrawaddy', 2170, 'oc??an Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Birmanie');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Jourdain', 360, 'mer Morte');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Syrie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Isra??l');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Palestine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Jordanie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Kamtchatka', 758, 'mer de B??ring');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Kapuas', 1143, 'mer de Chine m??ridionale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Indon??sie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Khatanga', 1636, 'oc??an Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Kolyma', 2129, 'oc??an Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Koura', 1514, 'mer Caspienne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Turquie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'G??orgie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Azerba??djan');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Krishn??', 1290, 'oc??an Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La L??na', 4400, 'oc??an Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Liao', 1345, 'golfe de Bohai');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Mah??nadi', 851, 'golfe du Bengale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le M??andre', 548, 'mer ??g??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Turquie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le M??kong', 4909, 'mer de Chine du Sud');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Birmanie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Tha??lande');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Laos');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Cambodge');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Vi??t Nam');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Nadym', 545, 'mer de Kara');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'La Narmad??', 1289, 'oc??an Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Ob', 3650, 'mer de Kara');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Oleniok', 2292, 'oc??an Arctique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'L''Oronte', 571, 'mer M??diterran??e');
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
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'G??orgie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Salouen', 2815, 'oc??an Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Birmanie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Tha??lande');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Sefid Roud', 670, 'mer Caspienne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Iran');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Sittang', 421, 'golfe de Martaban');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Birmanie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Syr-Daria', 2212, 'mer d''Aral');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Tadjikistan');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ouzb??kistan');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Kazakhstan');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Ta??myr', 840, 'mer de Kara');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Tapti', 724, 'oc??an Indien');
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
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Cor??e du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL,'Chine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Vaigai', 240, 'oc??an Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Inde');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Xi Jiang', 1772, 'mer de Chine m??ridionale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Yalu', 800, 'mer de Chine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Cor??e du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL,'Chine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'Le Yang Ts?? Kiang', 6380, 'mer de Chine orientale');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Chine');

-- Europe
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Aa', 89, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Adige', 410, 'mer Adriatique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Italie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Adour', 308, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Arno', 241, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Italie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Aude', 224, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Aulne', 144, 'mer d''Iroise');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Authie', 103, 'Manche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Blavet', 149, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Boug m??ridional', 806, 'mer Noire');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ukraine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Canche', 100, 'Manche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Charente', 381, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Corrib', 6, 'oc??an Atlantique');
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
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Bi??lorussie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Dniepr', 2290, 'mer Noire');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Bi??lorussie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ukraine');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Dniestr', 1362, 'mer Noire');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Ukraine');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Moldavie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Don', 1950, 'mer d''Azov');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Dordogne', 483, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Douro', 940, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Portugal');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Dvina septentrionale', 744, 'mer Blanche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''??bre', 928, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Elbe', 1091, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'R??publique Tch??que');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Allemagne');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''??lorn', 56, 'mer d''Iroise');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Ems', 371, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Allemagne');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Escaut', 355, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Belgique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Pays-Bas');	

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Garonne', 647, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Glomma', 608, 'Skagerrak');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Norv??ge');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le G??ta ??lv', 93, 'Catt??gat');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Su??de');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Guadalete', 157, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Guadalquivir', 657, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Guadiana', 744, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Portugal');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''H??rault', 148, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Irminio', 55, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Italie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Isonzo', 136, 'mer Adriatique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Italie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Slov??nie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le J??car', 498, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Kem', 191, 'mer Blanche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Kemijoki', 552, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Finlande');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Kouban', 870, 'mer d''Azov');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Lielupe', 119, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Lettonie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Loire', 1006, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Louga', 353, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Lule??lven', 461, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Su??de');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Maritsa', 480, 'mer ??g??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Bulgarie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Gr??ce');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Turquie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Meuse', 950, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Belgique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Pays-Bas');	

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Mezen', 857, 'mer Blanche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Minho', 318, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Portugal');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Narva', 75, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Estonie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Neva', 74, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Ni??men', 937, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Bi??lorussie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Lituanie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Oder', 854, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL,'R??publique Tch??que');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Pologne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Allemagne');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Odet', 63, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Onega', 416, 'mer Blanche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Orb', 135, 'mer M??diterran??e');
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
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le P??', 652, 'mer Adriatique');
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

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Rh??ne', 812, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Suisse');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Segura', 325, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Seine', 777, 'Manche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Severn', 354, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Royaume-Uni');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la S??vre Niortaise', 158, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Shannon', 386, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Irlande');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Somme', 245, 'Manche');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Strymon', 415, 'mer ??g??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Bulgarie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Gr??ce');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Tage', 1078, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Espagne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Portugal');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Tamise', 346, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Royaume-Uni');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Terek', 623, 'mer Caspienne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'G??orgie');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la T??t', 116, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Tibre', 405, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Italie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Torne', 521, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Finlande');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Su??de');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Trent', 297, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Royaume-Uni');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Var', 114, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Vardar', 388, 'mer ??g??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Mac??doine du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Gr??ce');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Vidourle', 95, 'mer M??diterran??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Vilaine', 218, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Vistule', 1047, 'mer Baltique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Pologne');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Volga', 3700, 'mer Caspienne');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Russie');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Weser', 452, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Allemagne');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Aven', 37, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le B??lon', 26, 'oc??an Atlantique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Yser', 78, 'mer du Nord');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'France');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Belgique');
	

-- Oc??anie
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Avon', 14, 'oc??an Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nouvelle-Z??lande');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Burdekin River', 710, 'oc??an Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Australie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Hastings River', 128, 'mer de Tasman');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Australie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Mokau', 158, 'mer de Tasman');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nouvelle-Z??lande');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Murray', 2530, 'oc??an Indien');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Australie');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'l''Oreti', 170, 'oc??an Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nouvelle-Z??lande');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Pomahaka', 80, 'oc??an Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nouvelle-Z??lande');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Rangitata River', 120, 'oc??an Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nouvelle-Z??lande');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Sepik', 1126, 'oc??an Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Papouasie-Nouvelle-Guin??e');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Indon??sie');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Waikato', 425, 'mer de Tasman');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nouvelle-Z??lande');

INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'le Waitaki', 110, 'oc??an Pacifique');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nouvelle-Z??lande');
	
INSERT INTO Fleuve VALUES (Seq_Fleuve.NEXTVAL, 'la Whanganui', 290, 'mer de Tasman');
INSERT INTO Traverser VALUES (Seq_Fleuve.CURRVAL, 'Nouvelle-Z??lande');
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

