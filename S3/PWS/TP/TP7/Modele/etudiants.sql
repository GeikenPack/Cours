
drop table if exists etudiants;
drop table if exists groupes;

CREATE TABLE IF NOT EXISTS `Groupes` (
  `idGroupe` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nomGroupe` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`idGroupe`)
) ENGINE=InnoDB  ;

INSERT INTO `Groupes` (`idGroupe`, `nomGroupe`) VALUES
(1, 'Groupe 1'),
(2, 'Groupe 2'),
(3, 'Groupe 3');

CREATE TABLE IF NOT EXISTS `Etudiants` (
  `idEtudiant` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `idGroupe` tinyint(3) unsigned DEFAULT NULL,
  `nomEtu` varchar(20) DEFAULT NULL,
  `dateNaiss` date DEFAULT NULL,
  PRIMARY KEY (`idEtudiant`),
  KEY `idGroupe` (`idGroupe`)
) ENGINE=InnoDB;

INSERT INTO `Etudiants` (`idEtudiant`, `idGroupe`, `nomEtu`, `dateNaiss`) VALUES
(1, 3, 'Durand', '1997-05-28'),
(2, 3, 'Martin', '1996-08-21'),
(3, 3, 'Dupont', '1997-10-14'),
(4, 2, 'Nonne', '1976-12-23'),
(5, 2, 'Tuffery', '1936-02-28'),
(6, 1, 'Gates', '2000-02-12');


ALTER TABLE `Etudiants`
  ADD CONSTRAINT `etudiants_ibfk_1` FOREIGN KEY (`idGroupe`) REFERENCES `Groupes` (`idGroupe`);

