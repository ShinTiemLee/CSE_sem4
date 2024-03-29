CREATE OR REPLACE PROCEDURE e2(d_name VARCHAR) IS
    CURSOR C1(d instructor.dept_name%TYPE) IS SELECT ID,name FROM instructor WHERE dept_name = d;
    CURSOR C2(d course.dept_name%TYPE) IS SELECT course_id, title FROM course WHERE dept_name = d;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Instructor ID    Instructor Name');
    FOR I IN C1(d_name)
    LOOP
        DBMS_OUTPUT.PUT_LINE(I.ID || ' ' || I.name);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Course ID    Course Title');
    FOR I IN C2(d_name)
    LOOP
        DBMS_OUTPUT.PUT_LINE(I.course_id || ' ' || I.title);
    END LOOP;
END;
/