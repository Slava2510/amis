INSERT INTO SLAVA.RESTAURANTS (ID, "Name", "Description", "Address") VALUES (1, 'Black Captain', 'Restaurant in the center of the city', 'Kiev, Saksaganskogo, 12');
INSERT INTO SLAVA.RESTAURANTS (ID, "Name", "Description", "Address") VALUES (2, 'Jule Vern', 'Little restaurant in Podol historic area        ', 'Kiev, Poshtova plocha');
INSERT INTO SLAVA.RESTAURANTS (ID, "Name", "Description", "Address") VALUES (3, 'Lord Malkoff', 'VIP restaurant', 'Kiev, Chrecatic');

INSERT INTO SLAVA.MENUS (ID, REST_ID, "Name", "Description") VALUES (1, 1, 'gag', 'gag');
INSERT INTO SLAVA.MENUS (ID, REST_ID, "Name", "Description") VALUES (2, 2, 'gag ', 'gag');
INSERT INTO SLAVA.MENUS (ID, REST_ID, "Name", "Description") VALUES (3, 3, 'gag', 'gag');


INSERT INTO SLAVA.MEALS (ID, MENU_ID, "Name", "Description", "Price") VALUES (1, 1, 'Borch', 'Traditional ukrinian dish', 26);
INSERT INTO SLAVA.MEALS (ID, MENU_ID, "Name", "Description", "Price") VALUES (2, 1, 'Varenyky', 'Ukrainian dish', 40);
INSERT INTO SLAVA.MEALS (ID, MENU_ID, "Name", "Description", "Price") VALUES (3, 1, 'Galushki', 'Very good with borch', 36);
INSERT INTO SLAVA.MEALS (ID, MENU_ID, "Name", "Description", "Price") VALUES (4, 2, 'Pelmeni ', 'Russian dish', 15);
INSERT INTO SLAVA.MEALS (ID, MENU_ID, "Name", "Description", "Price") VALUES (5, 2, 'Yushka', 'Special sup ', 38);
