DROP DATABASE IF EXISTS store;
CREATE DATABASE store;
USE store;

DROP TABLE IF EXISTS amministratore;

CREATE TABLE amministratore (	
  loginA varchar(60) primary key,
  pass varchar(20) not null
);

#metti le insert into per amministratore
insert into amministratore value('claudiabuono99@gmail.com', 'p1234');
insert into amministratore value('maria@gmail.com', 'p2nuy');
insert into amministratore value('vincentmilione@gmail.com', 'vm37');



DROP TABLE IF EXISTS product;

CREATE TABLE prodotto (	
  codice int primary key AUTO_INCREMENT,
  nome varchar(50) not null,
  descrizione char(100),
  prezzo numeric (6,2) default 0,
  quantita int default 0,
  personaggio varchar (30),
  foto varchar (100) default 'no image',
  iva numeric (4,2) default 0,
  sconto numeric (4,2) default 0,
  tipo varchar (30) not null,
  categoria int not null
);
#casa0	Accessori1	abbigliamento2 cancelleria3 articolifesta4 giochi5

CREATE TABLE registrato (
	loginA varchar(60) primary key,
	pass varchar(20) not null,
    nome varchar(30) not null,
    cognome varchar(30) not null
);

#metti le insert into per registrato
insert into registrato value('anna@virgilio.it','anna','anna','peduto');
insert into registrato value('matteo@alice.it','matteo','matteo','russo');
insert into registrato value('giulia@tiscali.it','giulia','giulia','musto');
insert into registrato value('rosalia@libero.it','rosalia','rosalia','capozzolo');
insert into registrato value('andrea@libero.it','andrea','andrea','caputo');


#metti le insert into per prodotto
#casa 
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Cuscino aristogatti',18.00,3,'Principessa','images/aristogattiCuscino.PNG',5,35,'cuscino',0);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Cuscino Aurora',18.00,3,'Aurora','images/auroraCuscino.PNG',5,35,'cuscino',0);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Cuscino Tamburello',18.00,3,'Bambi','images/coniglioCuscino.PNG',5,35,'cuscino',0);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Cuscino Dumbo',18.00,3,'Dumbo','images/dumboCuscino.PNG',5,35,'cuscino',0);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Cuscino ihoh',18.00,3,'Winnie the pooh','images/ihohCuscino.PNG',5,35,'cuscino',0);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Cuscino maialino',18.00,3,'Oceania','images/maialinoCuscino.PNG',5,35,'cuscino',0);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Cuscino Minnie',18.00,3,'Minnie','images/minniCuscino.PNG',5,35,'cuscino',0);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Cuscino Topolino',18.00,3,'Topolino','images/mouseCuscino.PNG',5,35,'cuscino',0);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('tazza Alice',10.00,3,'Alice','images/tazza.PNG',5,10,'tazza',0);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('tazza Ariel',15.00,3,'Ariel','images/tazzaAriel.PNG',5,10,'tazza',0);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('tazza Ariel',22.00,3,'Ariel','images/tazzaAriel2.PNG',5,10,'tazza',0);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Borsa mare',22.10,3,'Aladin','images/borsaMare.PNG',5,10,'borsa',0);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('tracolla',27.50,3,'Aladin','images/tracolla.PNG',5,10,'tracolla',0);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('orologio Cars',20.50,3,'Cars','images/orologioCars.PNG',5,10,'orologio',0);
#abbigliamento
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('maglia',28.00,3,'Alice','images/maglia.PNG',5,10,'maglia',1);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Costume Aladin',42.00,3,'Aladin','images/costume.PNG',5,10,'costume',1);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('accappatoio Ariel',11.00,4,'Ariel','images/accappatoio.PNG',5,10,'accappatoio',1);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('costume Ariel',22.00,4,'Ariel','images/costumeAriel.PNG',5,10,'costume',1);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('maglia Ariel',12.00,4,'Ariel','images/magliaAriel.PNG',5,10,'maglia',1);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('felpa Aladin',39.00,4,'Aladin','images/felpaAladin.PNG',5,10,'maglia',1);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('felpa Dumbo',60.00,4,'Dumbo','images/felpaDumbo60.PNG',5,10,'maglia',1);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('maglia Moana',19.00,4,'Moana','images/magliaMoana.PNG',5,10,'maglia',1);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('pigiama Belle',19.00,4,'Belle','images/pigiamaBelle.PNG',5,10,'pigiama',1);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('pigiama Aladin',19.00,4,'Aladin','images/pigiamaAladin.PNG',5,10,'pigiama',1);


#articoliFesta
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('tovaglioli Alice',3.00,3,'Alice','images/tovaglioli.PNG',5,10,'tovaglioli',2);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('bicchieri Alice',4.00,3,'Alice','images/bicchieri.PNG',5,10,'bicchieri',2);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('alzatina Alice',12.00,3,'Alice','images/alzatina.PNG',5,10,'alzatina',2);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('cartellone Alice',5.00,3,'Alice','images/cartellone.PNG',5,40,'cartellone',2);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('festone Alice',5.20,3,'Alice','images/festone.PNG',5,40,'festone',2);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('piatti Alice',4.00,3,'Alice','images/piatti.PNG',5,35,'piatti',2);
#giochi
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('bambola Alice',20.00,3,'Alice','images/bambola.PNG',5,35,'bambola',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Alice',35.00,3,'Alice','images/personaggio.PNG',5,10,'personaggio',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Set Gioco Alice',12.00,3,'Alice','images/setgioco.PNG',5,10,'personaggio',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('bambola Aurora',62.00,3,'Aurora','images/bambolaAurora.PNG',5,40,'bambola',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('bambola Ariel',16.00,3,'Ariel','images/bAriel.PNG',5,10,'bambola',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('bambola Ariel',32.00,3,'Ariel','images/b1Ariel.PNG',5,10,'bambola',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Eric e Ariel',32.00,3,'Ariel','images/EricAriel.PNG',5,10,'bambola',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Ariel',35.00,3,'Ariel','images/personaggioAriel.PNG',5,10,'personaggio',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('puzzle',12.00,3,'Principesse','images/puzzlePrincipesse.PNG',5,10,'puzzle',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Principesse',29.00,3,'Principesse','images/setPrincipesse.PNG',5,10,'personaggio',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Biancaneve',38.00,3,'Biancaneve','images/bambiancaneve.PNG',5,10,'bambola',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Biancaneve',64.00,3,'Biancaneve','images/bambolabiancaneve.PNG',5,10,'bambola',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Bambola canora Elsa',64.00,5,'Elsa','images/bambolacanoraElsa.PNG',5,10,'bambola',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Principesse',180.00,5,'Principesse','images/bambole2_175.PNG',5,10,'bambola',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Principesse',190.00,5,'Principesse','images/Bambole175.PNG',5,10,'bambola',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Biancaneve',49.00,5,'Biancaneve','images/Biancanevepersonaggio35.PNG',5,10,'personaggio',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Peluche Dumbo',19.00,5,'Dumbo','images/pelucheDumbo.PNG',5,10,'peluche',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('bambola Mulan',32.00,3,'Mulan','images/bambolaMulan.PNG',5,10,'bambola',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Peluche Angel',18.00,3,'Angel','images/pelucheAngel.PNG',5,10,'peluche',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Peluche Minnie',35.00,3,'Minnie','images/pelucheMinnie.PNG',5,2,'peluche',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Peluche Paperino',12.00,3,'Topolino','images/peluchePaperino.PNG',5,2,'peluche',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Peluche Pippo',19.00,3,'Topolino','images/PeluchePippo.PNG',5,2,'peluche',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Peluche Pluto',19.00,3,'Topolino','images/PeluchePluto.PNG',5,2,'peluche',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Peluche Principessa',16.00,3,'Aristogatti','images/peluchePrincipessa.PNG',5,10,'peluche',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Peluche Simba',16.00,5,'Simba','images/PelucheSimba.PNG',5,10,'peluche',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('peluche Stitch',16.00,5,'Stitch','images/pelucheStitch.PNG',5,10,'peluche',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Peluche Topolino',16.00,5,'Topolino','images/PelucheTopolino.PNG',5,10,'peluche',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Peluche Winnie the Pooh',16.00,5,'Winnie','images/PelucheWinnie.PNG',5,10,'peluche',3);
insert into prodotto (nome,prezzo,quantita,personaggio,foto,iva,sconto,tipo,categoria)	value('Set gioco Aladin',19.00,5,'Aladin','images/SetAladin.PNG',5,10,'peluche',3);



CREATE TABLE indirizzo (
	registrato varchar(60) references registrato (loginA)
		on update cascade
        on delete set null,
	codiceIndirizzo int auto_increment primary key,
    via varchar (50) not null,
    cap int (5) not null,
    nCivico int not null,
    citta varchar(60) not null,
    provincia varchar(60) not null,
    stato varchar(40) default 'italia'
);
insert into indirizzo (registrato, via, cap, nCivico, citta, provincia) value('matteo@alice.it','via parmenide',84069,1,'Roscigno','Salerno');
insert into indirizzo (registrato, via, cap, nCivico, citta, provincia) value('giulia@tiscali.it','via giuliani',84012,28,'Roma','Roma');
insert into indirizzo (registrato, via, cap, nCivico, citta, provincia) value('rosalia@libero.it','via tommasini ',84061,7,'Felitto','Salerno');
insert into indirizzo (registrato, via, cap, nCivico, citta, provincia) value('andrea@libero.it','via roma',85178,16,'Aquara','Salerno');


CREATE TABLE fattura(
	codiceFattura int primary key auto_increment,
    registrato varchar(60) references registrato (loginA)
		on update cascade
        on delete set null,
	dataFattura date not null,
	Indirizzo int not null
);

insert into fattura(registrato,dataFattura,Indirizzo) value('matteo@alice.it','2019-06-20',1);
insert into fattura(registrato,dataFattura,Indirizzo) value('giulia@tiscali.it','2019-09-20',1);
insert into fattura(registrato,dataFattura,Indirizzo) value('rosalia@libero.it','2019-09-10',1);


CREATE TABLE ordine (
	fattura int references fattura (codiceFattura)
		on update cascade
        on delete no action,
	prodotto int references prodotto (codice) 
		on update cascade
        on delete set null,
	primary key(fattura, prodotto),
    prezzoAp numeric (6,2) default 0,
	quantita int not null,
    ivaAp numeric (4,2) default 0,
	scontoAp numeric (4,2) default 0
);

insert into ordine value(1,2,16.00,1,5.0,10);
insert into ordine value(2,2,16.00,2,5.0,10);
insert into ordine value(2,7,17.00,1,5.0,10);
insert into ordine value(1,8,16.00,1,5.0,10);
insert into ordine value(2,9,15.00,2,5.0,10);
insert into ordine value(1,10,16.00,1,5.0,10);
insert into ordine value(2,25,13.00,1,5.0,10);
insert into ordine value(3,10,16.00,2,5.0,10);
insert into ordine value(2,22,13.00,1,5.0,10);

CREATE TABLE recenzione (
	prodottoR int references prodotto (codice) 
		on update cascade
        on delete cascade,
	utente varchar(60) references registrato (loginA)
		on update cascade
        on delete cascade,
	
    descrizioneRecenzione text,
    valutazione int not null,
    primary key (prodottoR, utente)
);

insert into recenzione value(2,'rosalia@libero.it','Prodotto curato nei minimi dettagli',4);
insert into recenzione value(2,'matteo@alice.it','Buona qualità e consegna in tempo',4);
insert into recenzione value(2,'giulia@tiscali.it','A me il prodotto è arrivato con qualche difetto e lo hanno cambiato, efficienti in tutto',5);
insert into recenzione value(3,'matteo@alice.it','Buona qualità e consegna in tempo',4);
insert into recenzione value(7,'giulia@tiscali.it','A me il prodotto è arrivato con qualche difetto e lo hanno cambiato, efficienti in tutto',5);
insert into recenzione value(8,'matteo@alice.it','Buona qualità e consegna in tempo',4);
insert into recenzione value(9,'giulia@tiscali.it','A me il prodotto è arrivato con qualche difetto e lo hanno cambiato, efficienti in tutto',5);
insert into recenzione value(10,'matteo@alice.it','Buona qualità e consegna in tempo',4);
insert into recenzione value(25,'giulia@tiscali.it','A me il prodotto è arrivato con qualche difetto e lo hanno cambiato, efficienti in tutto',5);
insert into recenzione value(10,'rosalia@libero.it','Prodotto curato nei minimi dettagli',4);
insert into recenzione value(22,'giulia@tiscali.it','A me il prodotto è arrivato con qualche difetto e lo hanno cambiato, efficienti in tutto',5);

