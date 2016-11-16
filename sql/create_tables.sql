USE liiga;

CREATE TABLE `AktiivinenKokoonpano` (
  `idAktiivinenKokoonpano` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `joukkueid` tinyint(4) DEFAULT NULL,
  `pelaajaid` int(10) unsigned DEFAULT NULL,
  `paivitetty` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idAktiivinenKokoonpano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paivitetaan kerran viikossa/kuukaudessa joukkueiden kokoonpanot http://liiga.fi/joukkueet/**joukkue**/, kaytetaan vertailtaessa otteluiden poisjaanteja yms. JoukkueID ja PelaajaID (liiga.fi).';

CREATE TABLE `Joukkue` (
  `idJoukkue` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nimi` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idJoukkue`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='Joukkueen autoincrementilla luotu id (ei linkkiä liigan sivuihin) ja nimi liigan sivuilta';

CREATE TABLE `Kausitilastot` (
  `idKausitilastot` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kausi` varchar(8) DEFAULT NULL,
  `turnaus` varchar(10) DEFAULT NULL,
  `pelaajaid` int(10) unsigned DEFAULT NULL,
  `joukkueid` tinyint(3) unsigned DEFAULT NULL,
  `ottelut` tinyint(3) unsigned DEFAULT NULL,
  `laukaukset+` smallint(5) unsigned DEFAULT NULL,
  `laukaukset-` smallint(5) unsigned DEFAULT NULL,
  `laukaukset+-` smallint(6) DEFAULT NULL,
  `COR%` decimal(5,2) unsigned DEFAULT NULL,
  `COR%-C` decimal(5,2) unsigned DEFAULT NULL,
  `HPA` smallint(5) unsigned DEFAULT NULL,
  `PPA` smallint(5) unsigned DEFAULT NULL,
  `PA%` decimal(5,2) unsigned DEFAULT NULL,
  `L%` decimal(5,2) unsigned DEFAULT NULL,
  `T%` decimal(5,2) unsigned DEFAULT NULL,
  `PDO` decimal(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`idKausitilastot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='liiga.fi edistyneet tilastot kausittain ja turnauksittain';

CREATE TABLE `laukaisukartta` (
  `idlaukaisukartta` int(10) unsigned NOT NULL,
  `otteluid` int(10) unsigned DEFAULT NULL,
  `pelaajaid` int(10) unsigned DEFAULT NULL,
  `topbottom` tinyint(4) DEFAULT NULL,
  `leftright` tinyint(4) DEFAULT NULL,
  `laukaisutulosid` tinyint(3) unsigned DEFAULT NULL,
  `aika` time DEFAULT NULL,
  PRIMARY KEY (`idlaukaisukartta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `laukaisutulos` (
  `idlaukaisutulos` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nimi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idlaukaisutulos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='laukaisutulostyypit liiga.fi seurannasta, shot-tooltip..';

CREATE TABLE `Ottelukokoonpano` (
  `idOttelukokoonpano` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `otteluid` int(10) unsigned DEFAULT NULL,
  `joukkueid` tinyint(3) unsigned DEFAULT NULL,
  `pelaajaid` int(10) unsigned DEFAULT NULL,
  `kentta` tinyint(3) unsigned DEFAULT NULL,
  `pelipaikka` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`idOttelukokoonpano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ottelun kokoonpano liiga.fi sivuilta pelipaivina/edeltavana';

CREATE TABLE `Otteluohjelma` (
  `idOtteluohjelma` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kausi` varchar(9) DEFAULT NULL,
  `turnaus` varchar(10) DEFAULT NULL,
  `pvm` date DEFAULT NULL,
  `aika` time DEFAULT NULL,
  `otteluid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idOtteluohjelma`)
) ENGINE=InnoDB AUTO_INCREMENT=23904 DEFAULT CHARSET=utf8 COMMENT='Turnausten (runkosarja, playoffs yms.) otteluohjelmat liiga.fi';

CREATE TABLE `Ottelu` (
  `idOttelu` int(10) unsigned NOT NULL,
  `kotijoukkueid` tinyint(4) DEFAULT NULL,
  `vierasjoukkueid` tinyint(4) DEFAULT NULL,
  `pvm` date DEFAULT NULL,
  `kotimaalit` tinyint(4) DEFAULT NULL,
  `vierasmaalit` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idOttelu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keskeinen taulu, ottelun perustiedot, linkkaa kaikkialle. Kerataan liiga.fi.';

CREATE TABLE `Pelaajat` (
  `idPelaajat` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pelaajaTunnus` int(10) unsigned NOT NULL,
  `joukkueid` tinyint(3) unsigned DEFAULT NULL,
  `etunimi` varchar(15) DEFAULT NULL,
  `sukunimi` varchar(30) DEFAULT NULL,
  `kausi` varchar(9) DEFAULT NULL,
  `pelipaikka` varchar(2) DEFAULT NULL,
  `syntymaaika` date DEFAULT NULL,
  `maila` varchar(1) DEFAULT NULL,
  `paino` tinyint(3) unsigned DEFAULT NULL,
  `pituus` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`idPelaajat`,`pelaajaTunnus`)
) ENGINE=InnoDB AUTO_INCREMENT=16112 DEFAULT CHARSET=utf8 COMMENT='Pelaajien perustiedot liiga.fi';
