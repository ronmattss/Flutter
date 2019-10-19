package com.shadedgames.student_info_system.helper_classes;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

public class DatabaseHelper extends SQLiteOpenHelper {
    Context myContext;

    private static final int DATABASE_VERSION = 2;
    private static final String DATABASE_NAME = "profile";

    //table names
    private static final String TABLE_PROFILE = "student";
    private static final String TABLE_GRADES = "SecondYearGrades";

    //student profile
    private static final String KEY_ID = "id";
    private static final String KEY_STUDENT_ID = "student";
    private static final String KEY_PASS = "password";
    private static final String KEY_COURSE = "course";
    private static final String KEY_NAME = "name";
    private static final String KEY_AGE = "age";

    //grades Key
    private static final String KEY_IDGRADES = "id";
    private static final String KEY_STUDENTID = "Student";
    private static final String KEY_FIRSTSUB = "DSA";
    private static final String KEY_SECONDSUB = "DST";
    private static final String KEY_THIRDSUB = "OOP";
    private static final String KEY_FOURTHSUB = "MS";
    private static final String KEY_FIFTHSUB = "LogDes";
    private static final String KEY_SIXTHSUB = "Elective";
    private static final String KEY_SEVENTHSUB = "Ethics";
    private static final String KEY_EIGHTHSUB = "WorldLiterature";
    private static final String KEY_NINETHSUB = "PhysicalEducation";

    //create table String
    String CREATE_PROFILE_TABLE = "CREATE TABLE " + TABLE_PROFILE + "("
            + KEY_ID + " INTEGER PRIMARY KEY," + KEY_STUDENT_ID + " TEXT,"
            + KEY_PASS + " TEXT," + KEY_COURSE + " TEXT," + KEY_NAME + " TEXT," + KEY_AGE + " INTEGER" + ")";

    String CREATE_GRADES_TABLE = "CREATE TABLE " + TABLE_GRADES + "(" + KEY_IDGRADES + " INTEGER PRIMARY KEY,"
            + KEY_STUDENTID + " TEXT," + KEY_FIRSTSUB + " REAL," + KEY_SECONDSUB + " REAL," + KEY_THIRDSUB + " REAL,"
            + KEY_FOURTHSUB + " REAL," + KEY_FIFTHSUB + " REAL," + KEY_SIXTHSUB + " REAL," + KEY_SEVENTHSUB + " REAL,"
            + KEY_EIGHTHSUB + " REAL," + KEY_NINETHSUB + " REAL" + ")";


    public DatabaseHelper(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(CREATE_PROFILE_TABLE);
        db.execSQL(CREATE_GRADES_TABLE);

    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_PROFILE);
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_GRADES);

        // Create tables again
        onCreate(db);
    }

    public void copyDataBase(String dbname) throws IOException {
        // Open your local db as the input stream
        InputStream myInput = myContext.getAssets().open(dbname);
        // Path to the just created empty db
        File outFileName = myContext.getDatabasePath(dbname);
        // Open the empty db as the output stream
        OutputStream myOutput = new FileOutputStream(outFileName);
        // transfer bytes from the inputfile to the outputfile
        byte[] buffer = new byte[1024];
        int length;
        while ((length = myInput.read(buffer)) > 0) {
            myOutput.write(buffer, 0, length);
        }
        // Close the streams
        myOutput.flush();
        myOutput.close();
        myInput.close();
    }


    //CRUD STUFF

    // code to add the new student to the database
    public void addStudent(Profile profile) {
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put(KEY_STUDENT_ID, profile.getStudentId()); // Contact Name
        values.put(KEY_PASS, profile.getPassword()); // Contact Phone
        values.put(KEY_COURSE, profile.getCourse());
        values.put(KEY_NAME, profile.getName());
        values.put(KEY_AGE, profile.getAge());

        // Inserting Row
        db.insert(TABLE_PROFILE, null, values);
        //2nd argument is String containing nullColumnHack
        db.close(); // Closing database connection
    }

    public void addGrade(Grades grades) {
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues val = new ContentValues();

        val.put(KEY_STUDENTID, grades.getStdId());
        val.put(KEY_FIRSTSUB, grades.getFirstSub());
        val.put(KEY_SECONDSUB, grades.getSecondSub());
        val.put(KEY_THIRDSUB, grades.getThirdSub());
        val.put(KEY_FOURTHSUB, grades.getFourthSub());
        val.put(KEY_FIFTHSUB, grades.getFifthSub());
        val.put(KEY_SIXTHSUB, grades.getSixthSub());
        val.put(KEY_SEVENTHSUB, grades.getSeventhSub());
        val.put(KEY_EIGHTHSUB, grades.getEightSub());
        val.put(KEY_NINETHSUB, grades.getNinthSub());


        db.insert(TABLE_GRADES, null, val);
        db.close();
    }


    // code to get the single contact via id
    public Profile getStudent(int id) {
        SQLiteDatabase db = this.getReadableDatabase();

        Cursor cursor = db.query(TABLE_PROFILE, new String[]{KEY_ID,
                        KEY_STUDENT_ID, KEY_PASS, KEY_COURSE, KEY_NAME, KEY_AGE}, KEY_ID + "=?",
                new String[]{String.valueOf(id)}, null, null, null, null);
        if (cursor != null)
            cursor.moveToFirst();

        Profile profile = new Profile((cursor.getInt(0)),
                cursor.getString(1), cursor.getString(2), cursor.getString(3), cursor.getString(4), cursor.getInt(5));
        // return contact
        return profile;
    }

    public Profile getStudent(String id) {
        SQLiteDatabase db = this.getReadableDatabase();

        Cursor cursor = db.query(TABLE_PROFILE, new String[]{KEY_ID,
                        KEY_STUDENT_ID, KEY_PASS, KEY_COURSE, KEY_NAME, KEY_AGE}, KEY_STUDENT_ID + "=?",
                new String[]{String.valueOf(id)}, null, null, null, null);
        if (cursor != null && cursor.moveToFirst()) {
            try {
                cursor.moveToFirst();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            //  Profile profile = new Profile(-1, "NULL", "NULL");
            return null;
        }

        Profile profile = new Profile((cursor.getInt(0)),
                cursor.getString(1), cursor.getString(2), cursor.getString(3), cursor.getString(4), cursor.getInt(5));
        // return contact
        return profile;
    }

    // code to get the single grade via id
    public Grades getGrades(int id) {
        SQLiteDatabase db = this.getReadableDatabase();

        Cursor cursor = db.query(TABLE_GRADES, new String[]{KEY_IDGRADES, KEY_STUDENTID, KEY_FIRSTSUB, KEY_SECONDSUB, KEY_THIRDSUB, KEY_FOURTHSUB, KEY_FIFTHSUB, KEY_SIXTHSUB, KEY_SEVENTHSUB, KEY_EIGHTHSUB, KEY_NINETHSUB}, KEY_IDGRADES + "=?", new String[]{String.valueOf(id)}, null, null, null, null);
        if (cursor != null)
            cursor.moveToFirst();
        Grades grades = new Grades(cursor.getInt(0), cursor.getString(1), cursor.getDouble(2), cursor.getDouble(3), cursor.getDouble(4), cursor.getDouble(5), cursor.getDouble(6), cursor.getDouble(7), cursor.getDouble(8), cursor.getDouble(9), cursor.getDouble(10));

        return grades;
    }

    public Grades getGrades(String id) {
        SQLiteDatabase db = this.getReadableDatabase();

        Cursor cursor = db.query(TABLE_GRADES, new String[]{KEY_IDGRADES, KEY_STUDENTID, KEY_FIRSTSUB, KEY_SECONDSUB, KEY_THIRDSUB, KEY_FOURTHSUB, KEY_FIFTHSUB, KEY_SIXTHSUB, KEY_SEVENTHSUB, KEY_EIGHTHSUB, KEY_NINETHSUB}, KEY_STUDENTID + "=?", new String[]{id}, null, null, null, null);
        if (cursor != null)
            cursor.moveToFirst();
        Grades grades = new Grades(cursor.getInt(0), cursor.getString(1), cursor.getDouble(2), cursor.getDouble(3), cursor.getDouble(4), cursor.getDouble(5), cursor.getDouble(6), cursor.getDouble(7), cursor.getDouble(8), cursor.getDouble(9), cursor.getDouble(10));

        return grades;
    }

    public List<Profile> getAllProfiles() {
        List<Profile> profiles = new ArrayList<Profile>();

        // Select All Query
        String selectQuery = "SELECT  * FROM " + TABLE_PROFILE;

        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);

        // looping through all rows and adding to list
        if (cursor.moveToFirst()) {
            do {
                Profile profile = new Profile();
                profile.setId(Integer.parseInt(cursor.getString(0)));
                profile.setStudentId(cursor.getString(1));
                profile.setPassword(cursor.getString(2));
                // Adding contact to list
                profiles.add(profile);
            } while (cursor.moveToNext());
        }

        // return contact list
        return profiles;
    }

    // code to update the single Profile
    public int updateProfile(Profile student) {
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put(KEY_STUDENT_ID, student.getStudentId());
        values.put(KEY_PASS, student.getPassword());
        values.put(KEY_COURSE, student.getCourse());
        values.put(KEY_NAME, student.getName());
        values.put(KEY_AGE, student.getAge());

        // updating row
        return db.update(TABLE_PROFILE, values, KEY_STUDENT_ID + " = ?",
                new String[]{String.valueOf(student.getStudentId())});
    }

    public int updateGrades(Grades grades) {
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put(KEY_STUDENTID, grades.getStdId());
        values.put(KEY_FIRSTSUB, grades.getFirstSub());
        values.put(KEY_SECONDSUB, grades.getSecondSub());
        values.put(KEY_THIRDSUB, grades.getThirdSub());
        values.put(KEY_FOURTHSUB, grades.getFourthSub());
        values.put(KEY_FIFTHSUB, grades.getFifthSub());
        values.put(KEY_SIXTHSUB, grades.getSixthSub());
        values.put(KEY_SEVENTHSUB, grades.getSeventhSub());
        values.put(KEY_EIGHTHSUB, grades.getEightSub());
        values.put(KEY_NINETHSUB, grades.getNinthSub());
        // updating row
        return db.update(TABLE_GRADES, values, KEY_STUDENTID + " = ?",
                new String[]{String.valueOf(grades.getStdId())});
    }

    public void deleteProfile(Profile contact) {
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_PROFILE, KEY_ID + " = ?",
                new String[]{String.valueOf(contact.getId())});
        db.close();
    }
    public void deleteProfile(String student) {
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_PROFILE, KEY_STUDENT_ID + " = ?",
                new String[]{String.valueOf(student)});
        deleteGrades(student);
        db.close();
    }
    public void deleteGrades(String stdId)
    {
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_GRADES, KEY_STUDENTID +" = ?", new String[]{stdId});
        db.close();
    }
    public void deleteAll()
    {
        // Straight forward Deletion of all contents
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_PROFILE,null,null);
        db.delete(TABLE_GRADES,null,null);
    }


    // Getting Prfile Count
    public int getProfileCount() {
        String countQuery = "SELECT  * FROM " + TABLE_PROFILE;
        int count = 0;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(countQuery, null);
        count = cursor.getCount();
        cursor.close();

        // return count
        return count;
    }

    public int getGradesCount() {
        String countQuery = "SELECT  * FROM " + TABLE_GRADES;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(countQuery, null);
        int count = cursor.getCount();
        cursor.close();
        return count;
    }

}
