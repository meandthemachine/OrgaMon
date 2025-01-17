----------------
RETURNING clause
----------------

  Function:
    Allow to return the column values actually stored in the table as a result of the "INSERT",
    "UPDATE OR INSERT", UPDATE and DELETE statements.
    The most common usage is to retrieve the value of the primary key generated inside a BEFORE-trigger.

  Authors:
    Dmitry Yemanov <yemanov@yandex.ru>
    Adriano dos Santos Fernandes <adrianosf@uol.com.br>

  Syntax rules:
    INSERT INTO ... VALUES (...) [RETURNING <column_list> [INTO <variable_list>]]
    INSERT INTO ... SELECT ... [RETURNING <column_list> [INTO <variable_list>]]
    UPDATE OR INSERT INTO ... VALUES (...) ... [RETURNING <column_list> [INTO <variable_list>]]
    UPDATE ... [RETURNING <column_list> [INTO <variable_list>]]
    DELETE FROM ... [RETURNING <column_list> [INTO <variable_list>]]

  Scope:
    DSQL, PSQL

  Example(s):
    1. INSERT INTO T1 (F1, F2)
       VALUES (:F1, :F2)
       RETURNING F1, F2 INTO :V1, :V2;
    2. INSERT INTO T2 (F1, F2)
       VALUES (1, 2)
       RETURNING ID INTO :PK;
    3. DELETE FROM T1 WHERE F1 = 1 RETURNING F2;
    4. UPDATE T1 SET F2 = F2 * 10 RETURNING OLD.F2, NEW.F2;

  Note(s):
    1. The INTO part (i.e. the variable list) is allowed in PSQL only (to assign local variables)
       and rejected in DSQL.
    2. In DSQL, values are being returned within the same protocol roundtrip as the INSERT itself
       is executed.
    3. If the RETURNING clause is present, then the statement is described as
       isc_info_sql_stmt_exec_procedure by the API (instead of isc_info_sql_stmt_insert),
       so the existing connectivity drivers should support this feature automagically.
    4. Any explicit record change (update or delete) performed by AFTER-triggers is ignored by
       the RETURNING clause.
    5. OLD and NEW could be used in RETURNING clause of UPDATE and INSERT OR UPDATE statements.
    6. In UPDATE and INSERT OR UPDATE statements, unqualified or qualified by table name/alias
       fields are resolved to NEW.

  Limitations:
    1. The modify statement (INSERT, UPDATE, DELETE) should operate in no more than one record
       (i.e. should be singleton).
    2. The statement always return one row in DSQL, even if no record is inserted/updated/deleted.
       This may be changed in the future (i.e. return empty resultset).
