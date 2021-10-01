/* createbase.sql */

// Suppression des Tables

DROP TABLE Pandemic;
DROP TABLE Border;
DROP TABLE Country;
DROP TABLE Region;
DROP TABLE Continent;

// Création des Tables

CREATE TABLE Continent
(
 name VARCHAR(50),
 area NUMBER(12,2),
 CONSTRAINT pk_continent PRIMARY KEY (name),
 CONSTRAINT ck_continent_area CHECK (area > 0)
);

CREATE TABLE Region
(
 code CHAR(3),
 name VARCHAR(50),
 rcode CHAR(3),
 cname VARCHAR(50),
 CONSTRAINT pk_region PRIMARY KEY (code),
 CONSTRAINT uk_region_name UNIQUE (name),
 CONSTRAINT fk_region_rcode FOREIGN KEY (rcode) REFERENCES Region (code),
 CONSTRAINT fk_region_cname   FOREIGN KEY (cname)   REFERENCES Continent (name)
);

CREATE TABLE Country
(
 iso3 CHAR(3),
 iso2 CHAR(2),
 name VARCHAR(50),
 capital VARCHAR(50),
 population NUMBER,
 area NUMBER(12,2),
 expectancy NUMBER(4,2),
 rcode CHAR(3),
 CONSTRAINT pk_country PRIMARY KEY (iso3),
 CONSTRAINT uk_country_iso2 UNIQUE (iso2),
 CONSTRAINT uk_country_name UNIQUE (name),
 CONSTRAINT fk_country_rcode FOREIGN KEY (rcode) REFERENCES Region (code),
 CONSTRAINT ck_country_population CHECK (population >= 0),
 CONSTRAINT ck_country_area    CHECK (area > 0),
 CONSTRAINT ck_country_expectancy CHECK (expectancy > 0),
 CONSTRAINT ck_country_rcode CHECK (rcode IS NOT NULL)
);

CREATE TABLE Border
(
 country  CHAR(3),
 bcountry CHAR(3),
 length NUMBER,
 CONSTRAINT pk_border PRIMARY KEY (country, bcountry),
 CONSTRAINT fk_border_country  FOREIGN KEY (country)  REFERENCES Country (iso3),
 CONSTRAINT fk_border_bcountry FOREIGN KEY (bcountry) REFERENCES Country (iso3),
 CONSTRAINT ck_border_length CHECK (length > 0)
);

CREATE TABLE Pandemic
(
 iso3 CHAR(3),
 ddate DATE,
 cases NUMBER,
 deaths NUMBER,
 rrate NUMBER,
 icu NUMBER,
 hpatients NUMBER,
 tests NUMBER,
 prate NUMBER(4,3),
 vacc NUMBER,
 fvacc NUMBER
);


