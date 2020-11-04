BEGIN
  FOR cur_rec IN (SELECT object_name, object_type
                  FROM all_objects
                  WHERE owner = 'NET_ADMIN' AND object_type IN
                                                                            ('TABLE',
                                                                             'VIEW',
                                                                             'MATERIALIZED VIEW',
                                                                             'PACKAGE',
                                                                             'PROCEDURE',
                                                                             'FUNCTION',
                                                                             'SEQUENCE',
                                                                             'SYNONYM',
                                                                             'PACKAGE BODY'
                                                                              ))
    LOOP
      BEGIN
        IF cur_rec.object_type = 'TABLE'
        THEN
          EXECUTE IMMEDIATE 'DROP '
            || cur_rec.object_type
            || ' "'
            || cur_rec.object_name
            || '" CASCADE CONSTRAINTS';
        ELSE
          EXECUTE IMMEDIATE 'DROP '
            || cur_rec.object_type
            || ' "'
            || cur_rec.object_name
            || '"';
        END IF;
      EXCEPTION
        WHEN OTHERS
          THEN
            DBMS_OUTPUT.put_line ('FAILED: DROP '
              || cur_rec.object_type
              || ' "'
              || cur_rec.object_name
              || '"'
              );
      END;
    END LOOP;

  BEGIN
    EXECUTE IMMEDIATE 'DROP USER NET_ADMIN CASCADE';
  EXCEPTION
    WHEN OTHERS
      THEN
        NULL;
  END;
END;
/