create or replace procedure addUser(login       IN varchar2, 
                                    pass        IN varchar2,
                                    first_name  IN varchar2,
                                    last_name   IN varchar2,
                                    email       IN  varchar2,
                                    status      OUT boolean)
AS
  begin
    status := true;
    
    insert into users("Login", "Pass", "First_Name", "Last_Name", "Email")
      VALUES (login, pass, first_name, last_name, email);
    commit;
    
    exception 
      WHEN OTHERS THEN
      status := false;
      rollback;
  end;
/

create or replace 
procedure addQuery(query_value IN varchar2, user_id IN integer, query_id OUT integer)
AS
  begin
      
    insert into search_query("USER_ID", "Query", "Date")
      VALUES (user_id, query_value, CURRENT_DATE);
    
    select max(search_query.ID) into query_id from search_query; 
    commit;    
      
    exception 
      WHEN OTHERS THEN
      rollback;
  end;
/

 create or replace 
procedure addToMealQueryLink(query_id IN integer, meal_id IN integer)
AS
  begin
      
    insert into meal_result("QUERY_ID", "MEAL_ID")
      VALUES (query_id, meal_id); 
    commit;    
      
    exception 
      WHEN OTHERS THEN
      rollback;
  end;
/

  create or replace 
procedure addToRestQueryLink(query_id IN integer, res_id IN integer)
AS
  begin
      
    insert into restaurant_result("QUERY_ID", "RES_ID")
      VALUES (query_id, res_id); 
    commit;    
      
    exception 
      WHEN OTHERS THEN
      rollback;
  end;
/

  create or replace 
procedure addUser(login       IN varchar2, 
                  pass        IN varchar2,
                  first_name  IN varchar2,
                  last_name   IN varchar2,
                  email       IN varchar2,
                  status      OUT integer)
AS
  login_check varchar2(256);
  begin
  
    status := 1;
    
    begin

    select "Login" into login_check from users where "Login" = login;

    EXCEPTION WHEN NO_DATA_FOUND then
      status := 1;
    end;
    
    if login_check is not null then
      begin 
      
        status := 2;
        
      end;
    else 
      begin 
      
        insert into users("Login", "Pass", "First_Name", "Last_Name", "Email")
          VALUES (login, pass, first_name, last_name, email);
        commit;
        
      end;
    end if;
      
    exception 
      WHEN OTHERS THEN
      status := 0;
      rollback;
  end;
/

create or REPLACE PROCEDURE addRest(name IN VARCHAR2, description IN VARCHAR2, address IN VARCHAR2)
  as
  restaurant_id INTEGER;
  BEGIN
    INSERT INTO RESTAURANTS ("Name", "Description", "Address") 
      VALUES (name, description, address);
    
    select max(ID) INTO restaurant_id FROM RESTAURANTS;

    INSERT INTO MENUS (REST_ID, "Name" ,"Description")
      VALUES (restaurant_id, 'gag', 'gag');
  end;
/

create or REPLACE PROCEDURE addMeal(restaurant_id IN INTEGER, 
                                    name IN VARCHAR2, 
                                    description IN VARCHAR2, 
                                    price IN FLOAT)
as
  menu_id INTEGER;
  BEGIN
    
    SELECT ID into menu_id from MENUS
      WHERE MENUS.REST_ID = restaurant_id;
    
    INSERT INTO MEALS (MENU_ID, "Name", "Description", "Price")
      VALUES (menu_id, name, description, price);
  end;
/

create or REPLACE PROCEDURE updateMeal(restaurant_id IN INTEGER,
                                    meal_id IN INTEGER,
                                    name IN VARCHAR2,
                                    description IN VARCHAR2,
                                    price IN FLOAT)
as
  m_id INTEGER;
  BEGIN

    SELECT ID into m_id from MENUS
    WHERE MENUS.REST_ID = restaurant_id;
    
    UPDATE MEALS SET
      "Name" = name,
      "Description" = description,
      "Price" = price
      WHERE MENU_ID = m_id and ID = meal_id;
  end;
/

create or REPLACE PROCEDURE updateRest(
                                        rest_id IN INTEGER, 
                                        name IN VARCHAR2, 
                                        description IN VARCHAR2, 
                                        address IN VARCHAR2)
as
  restaurant_id INTEGER;
  BEGIN
    
    UPDATE RESTAURANTS SET 
      "Name" = name,
      "Description" = description,
      "Address" = address
    WHERE ID = rest_id;
    
  end;
/

create or REPLACE PROCEDURE deleteRest(rest_id IN INTEGER)
as
  BEGIN

    DELETE FROM RESTAURANTS WHERE ID = rest_id;

  end;
/

create or REPLACE PROCEDURE deleteMeal(meal_id IN INTEGER)
as
  BEGIN

    DELETE FROM MEALS WHERE ID = meal_id;

  end;
/

create or REPLACE PROCEDURE checkUser(login IN VARCHAR2, pass IN VARCHAR2, status OUT INTEGER, user_id OUT INTEGER)
as
  BEGIN
    status := 1;
    
    SELECT ID into user_id from USERS 
      where "Login" = login and "Pass" = pass;

    exception
    WHEN OTHERS THEN
    status := 0;

  end;
  /
