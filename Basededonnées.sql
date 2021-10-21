SET NAMES UTF8MB4;

DROP DATABASE IF EXISTS expressfood;

CREATE DATABASE expressfood;

USE expressfood;

CREATE TABLE livreur (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom VARCHAR(60) NOT NULL,
    prenom VARCHAR(60) NOT NULL,
    mail VARCHAR(60) NOT NULL,
    telephone VARCHAR(20) NOT NULL,
    localite VARCHAR(60) NOT NULL,
    code_postal CHAR(5) NOT NULL,
    adresse VARCHAR(100) NOT NULL,
    complement_adresse VARCHAR(60) DEFAULT NULL,
    password BINARY(60) NOT NULL,
    status ENUM('absent', 'pause', 'attente', 'livraison') DEFAULT 'absent' NOT NULL,
    longitude DECIMAL(8, 5) DEFAULT NULL,
    latitude DECIMAL(7, 5) DEFAULT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO livreur
VALUES (
        1,
        'Dupont',
        'Michel',
        'dupont.michel@gmail.com',
        '0102030405',
        'Paris',
        '75000',
        '7 rue du Cognac',
        Null,
        'b341ceb4888aca659df99f63916693f07f3f53c467168f1601c89c0d4078',
        'absent',
        Null,
        Null
    ),
    (
        2,
        'Devaux',
        'Rémy',
        'r.devaux@aol.com',
        '0606060606',
        'Paris',
        '75000',
        '21 impasse de Buisson',
        Null,
        '53HPjTzIN6wDLhbsFEJp66C5L12X0RR9SQw9rSz66OjEwME58pxDjASmuiEM',
        'livraison',
        '48.84355',
        '2.37462'
    ),
    (
        3,
        'Lemaire',
        'Eric',
        'lemaire.erice@gmail.com',
        '0101010101',
        'Paris',
        '75000',
        '86 boulevard de Chauvin',
        'bâtiment C appt 14',
        'ALji3lGH7IFYwtSAfInIvGCST2Vu62v2n7N6tDZPdMZ254IDKMppI9m0W4MW',
        'pause',
        Null,
        Null
    ),
    (
        4,
        'Klein',
        'Grégoire',
        'k.greg@aol.fr',
        '0909090909',
        'Paris',
        '75000',
        '75 avenue de Herve',
        'bâtiment A appt 501',
        'MIJ49augKE7r3CTrV3lLrp6BB3YdCkfD2bU4VUuzqmCD3GiFtALGSsTWU3Yt',
        'attente',
        '48.85687',
        '2.36439'
    ),
    (
        5,
        'Rossi',
        'François',
        'f.rossi@yahoo.fr',
        '0505050505',
        'Orsay',
        '91400',
        '594 rue Leconte',
        Null,
        'r1aD2hSifrP4pznl4dtDCWAszy3UYExRqRTIL2YQY8O0b9Yi3xXp1qLQwJOm',
        'absent',
        Null,
        Null
    ),
    (
        6,
        'Meunier',
        'Sophie',
        'sophie.meunier@hotmail.com',
        '0606060606',
        'Massy',
        '91300',
        '68 avenue Gosselin',
        Null,
        'PuuuXw8mtLd1KOS3u5Hz5AlkPHKaswDQ5XGnr8MMsC2GzoUOeKM1kcTyjcmM',
        'attente',
        '48.86027',
        '2.36502'
    ),
    (
        7,
        'Paul',
        'Anaïs',
        'paul.anais@gmail.com',
        '0404040404',
        'Les Ulis',
        '91940',
        '43 avenue Anouk Leveque',
        'Résidence Mimosas appt 26',
        'PuuuXw8mtLd1KOS3u5Hz5AlkPHKaswDQ5XGnr8MMsC2GzoUOeKM1kcTyjcmM',
        'livraison',
        '48.87032',
        '2.40162'
    );

CREATE TABLE plat (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    dessert BOOLEAN NOT NULL DEFAULT FALSE,
    prix_unitaire DECIMAL(6, 2) NOT NULL,
    ingredient VARCHAR(500) NOT NULL,
    en_ligne BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id),
    UNIQUE INDEX ind_uni_nom (nom)
) ENGINE = InnoDB;

INSERT INTO plat
VALUES (
        1,
        'Blanquette de veau',
        FALSE,
        '18.50',
        'poivre - sel - vin blanc - farine - citron - champignons - carottes - oignon - crème fraîche - veau',
        TRUE
    ),
    (
        2,
        'Colombo de poulet',
        FALSE,
        '17.50',
        'poivre - sel - rhum blanc - pommes de terre - ail - citron - oignon - persil - poulet',
        TRUE
    ),
    (
        3,
        'Couscous royal',
        FALSE,
        '21',
        'poivre - sel - coriandre - harissa - cumin - safran - huile d''olive - raisins secs - pois chiches - merguez - agneau - poulet - semoule - navets - oignons - artichaut - courgettes - tomates - carottes',
        FALSE
    ),
    (
        4,
        'Pain perdu',
        TRUE,
        '8',
        'sucre - lait - oeufs - pain',
        TRUE
    ),
    (
        5,
        'Clafoutis aux cerises',
        TRUE,
        '9',
        'lait - farine - sucre - sel - cerises - beurre - oeufs',
        FALSE
    ),
    (
        6,
        'Brownies aux noix',
        TRUE,
        '8',
        'noix - sucre - farine - chocolat - beurre - oeufs',
        TRUE
    );

CREATE TABLE client (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom VARCHAR(60) NOT NULL,
    prenom VARCHAR(60) NOT NULL,
    mail VARCHAR(60) NOT NULL,
    telephone VARCHAR(20) NOT NULL,
    localite VARCHAR(60) NOT NULL,
    code_postal CHAR(5) NOT NULL,
    adresse VARCHAR(100) NOT NULL,
    complement_adresse VARCHAR(60) DEFAULT NULL,
    date_inscription DATETIME NOT NULL,
    password BINARY(60) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO client
VALUES (
        1,
        'Guerin',
        'Bernadette',
        'g.guerin@aol.fr',
        '0636656565',
        'Bagneux ',
        '92007',
        '18 impasse Morvan',
        'Bâtiment 4 appt 8',
        '2021-03-20 16:20:03',
        'MXDZWNYKntMugnuQIPbZ9zTGKaufh3xFlfnGkEH5i3WpZwOJyEiLkvGk8Vhp'
    ),
    (
        2,
        'Blanchet',
        'Jérôme',
        'jerome.blanchet@yahoo.fr',
        '0117555555',
        'Créteil',
        '94000',
        '56 rue Martel',
        Null,
        '2021-03-24 19:07:41',
        '3rdOKnseC721DmlNDH5IDMTpNa2pTcpudKxA2ZWaZtm2cv5oG634NkeNts4N'
    ),
    (
        3,
        'Lesage',
        'Michel',
        'michel87@gmail.fr',
        '0707070606',
        'Boulogne-Billancourt',
        '92100',
        '38 avenue Luc Germain',
        Null,
        '2021-03-27 11:12:27',
        'CETF8ccHoVd0VAOCRdyjdaG3L33QzFko6aimQI76EXooZKmeLH94mpyh3X7K'
    ),
    (
        4,
        'Bastin',
        'Margaux',
        'margauxbastin@aol.com',
        '0786000000',
        'Paris',
        '75000',
        '90 avenue Benali',
        'porte 503',
        '2021-04-03 18:27:44',
        '3y5ZwIZ6z2pjpizAmmFAvoxCSlCKEjDWi8LjTkpzEbIBUliouGEmhfmsnlfS'
    ),
    (
        5,
        'Gielen',
        'Louis',
        'louisgielen@gmail.com',
        '0401010000',
        'Cachan',
        '94230',
        '124 boulevard Masson',
        Null,
        '2021-04-03 19:01:32',
        'C2NSWVRmIqhHTGTnukjsMqJK3KPKkqC12EEa2YArXl9A0FX3BLuffZuIonAn'
    ),
    (
        6,
        'Gimenez',
        'Daniel',
        'gimenez.daniel@yahoo.fr',
        '0303020202',
        'Bourg-la-Reine',
        '92340',
        '6 rue Renaud',
        Null,
        '2021-04-05 10:15:01',
        'PWAlwppHrLrHUjyj1ZuEfHVXeego7WnfbwjO41f7YX3kNHdN9jfbDyy3gnha'
    ),
    (
        7,
        'Cousin',
        'Lucas',
        'lulu.cousin@gmail.com',
        '0111111111',
        'Levallois-Perret',
        '92300',
        '201 avenue de Marchand',
        'RésidenceBlaise Pascal  - appt 58',
        '2021-04-05 16:11:49',
        'GTLUKnbZ8xPzz5WkHSrstZrWm4iljTe83hezRvg9f4hKSjsNG6apjlWb08dd'
    ),
    (
        8,
        'Boutin',
        'Anouk-Isabelle',
        'boutin.anouk@aol.fr',
        '0404020202',
        'Paris',
        '75000',
        '30 chemin Benoît Verdier',
        Null,
        '2021-04-06 12:07:12',
        'EyQPWN0uYCMhfsPRzgttVThR4A5u6MBR4tqvKYD7JzX92iIEn9Ex30Q0Kms8'
    );

CREATE TABLE commande (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_client SMALLINT UNSIGNED DEFAULT NULL,
    date_commande DATETIME NOT NULL,
    date_livraison DATETIME DEFAULT NULL,
    status ENUM('attente', 'livraison', 'livree', 'annulee') DEFAULT 'attente' NOT NULL,
    id_livreur SMALLINT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO commande
VALUES (
        1,
        3,
        '2021-04-15 18:45:03',
        '2021-04-15 19:02:00',
        'livree',
        5
    ),
    (
        2,
        6,
        '2021-04-15 18:51:10',
        '2021-04-15 19:06:18',
        'livree',
        3
    ),
    (
        3,
        1,
        '2021-04-15 18:57:24',
        '2021-04-15 19:10:11',
        'livree',
        4
    ),
    (
        4,
        2,
        '2021-04-15 19:01:01',
        '2021-04-15 19:18:58',
        'livree',
        5
    ),
    (
        5,
        8,
        '2021-04-15 19:05:27',
        '2021-04-15 19:21:26',
        'livree',
        7
    ),
    (
        6,
        5,
        '2021-04-15 19:08:06',
        '2021-04-15 19:25:42',
        'livree',
        4
    ),
    (
        7,
        7,
        '2021-04-15 19:11:55',
        '2021-04-15 19:29:21',
        'livree',
        3
    ),
    (
        8,
        4,
        '2021-04-17 18:50:13',
        '2021-04-17 19:04:42',
        'livree',
        4
    ),
    (
        9,
        1,
        '2021-04-17 18:57:49',
        Null,
        'annulee',
        Null
    ),
    (
        10,
        1,
        '2021-04-17 19:00:04',
        Null,
        'livraison',
        7
    ),
    (
        11,
        2,
        '2021-04-17 19:02:19',
        Null,
        'livraison',
        2
    );

CREATE TABLE stock (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    date_realisation DATE NOT NULL,
    id_plat SMALLINT UNSIGNED NOT NULL,
    id_commande SMALLINT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO stock
VALUES (
        1,
        '2021-04-15',
        1,
        1
    ),
    (
        2,
        '2021-04-15',
        1,
        3
    ),
    (
        3,
        '2021-04-15',
        1,
        4
    ),
    (
        4,
        '2021-04-15',
        1,
        5
    ),
    (
        5,
        '2021-04-15',
        1,
        5
    ),
    (
        6,
        '2021-04-15',
        1,
        Null
    ),
    (
        7,
        '2021-04-15',
        1,
        Null
    ),
    (
        8,
        '2021-04-15',
        3,
        1
    ),
    (
        9,
        '2021-04-15',
        3,
        2
    ),
    (
        10,
        '2021-04-15',
        3,
        2
    ),
    (
        11,
        '2021-04-15',
        3,
        6
    ),
    (
        12,
        '2021-04-15',
        3,
        Null
    ),
    (
        13,
        '2021-04-15',
        4,
        5
    ),
    (
        14,
        '2021-04-15',
        4,
        6
    ),
    (
        15,
        '2021-04-15',
        4,
        Null
    ),
    (
        16,
        '2021-04-15',
        5,
        1
    ),
    (
        17,
        '2021-04-15',
        5,
        3
    ),
    (
        18,
        '2021-04-15',
        5,
        7
    ),
    (
        19,
        '2021-04-17',
        1,
        8
    ),
    (
        20,
        '2021-04-17',
        1,
        11
    ),
    (
        21,
        '2021-04-17',
        1,
        11
    ),
    (
        22,
        '2021-04-17',
        1,
        Null
    ),
    (
        23,
        '2021-04-17',
        2,
        8
    ),
    (
        24,
        '2021-04-17',
        2,
        8
    ),
    (
        25,
        '2021-04-17',
        2,
        10
    ),
    (
        26,
        '2021-04-17',
        4,
        Null
    ),
    (
        27,
        '2021-04-17',
        4,
        11
    ),
    (
        28,
        '2021-04-17',
        4,
        Null
    ),
    (
        29,
        '2021-04-17',
        4,
        Null
    ),
    (
        30,
        '2021-04-17',
        6,
        Null
    ),
    (
        31,
        '2021-04-17',
        6,
        Null
    ),
    (
        32,
        '2021-04-17',
        6,
        10
    ),
    (
        33,
        '2021-04-17',
        6,
        10
    );

ALTER TABLE commande
ADD CONSTRAINT fk_id_livreur FOREIGN KEY (id_livreur) REFERENCES livreur (id) ON DELETE
SET NULL;

ALTER TABLE commande
ADD CONSTRAINT fk_id_client FOREIGN KEY (id_client) REFERENCES client (id) ON DELETE
SET NULL;

ALTER TABLE stock
ADD CONSTRAINT fk_id_plat FOREIGN KEY (id_plat) REFERENCES plat (id);

ALTER TABLE stock
ADD CONSTRAINT fk_id_commande FOREIGN KEY (id_commande) REFERENCES commande (id) ON DELETE
SET NULL;

CREATE PROCEDURE supprimer_commandes_annulees()
DELETE FROM commande
WHERE status = 'annulee'; 

DELIMITER |

CREATE TRIGGER before_update_commande BEFORE UPDATE
ON commande FOR EACH ROW
BEGIN
    IF NEW.status = 'annulee' THEN
        UPDATE stock
        SET id_commande = Null
        WHERE id_commande = NEW.id;

        SET NEW.id_livreur = Null;

        SET NEW.date_livraison = Null;
    END IF;
END |

DELIMITER ;