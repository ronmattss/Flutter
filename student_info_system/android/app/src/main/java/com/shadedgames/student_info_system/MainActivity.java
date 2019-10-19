package com.shadedgames.student_info_system;

import android.os.Bundle;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.os.Debug;
import android.util.Log;

import com.google.gson.Gson;
import com.shadedgames.student_info_system.helper_classes.DatabaseHelper;
import com.shadedgames.student_info_system.helper_classes.Grades;
import com.shadedgames.student_info_system.helper_classes.Profile;

import java.io.IOException;


public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "samples.flutter.dev/battery";
    private static int i = 0;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        //TODO: JSON TO FLUTTER?
        DatabaseHelper db = new DatabaseHelper(this);






/*
        db.addStudent(new Profile("2018-0000-MN-0","qwerty","BSCS","Rivera",19));
        db.addGrade(new Grades("2018-0000-MN-0",1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0));

*/


        // When uninstalling pls change this two sample data
//        Grades g = db.getGrades(1);
//        Profile p = db.getStudent(1);
//        System.out.println(g.getStdId());
//        g.testGson();

        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                (call, result) -> {
                    if (call.method.equals("getSample")) {
                        Profile student = new Profile(-1, "NULL", "NULL", "NULL", "NULL", -1);
                        String getArg = call.argument("user");
                        String getPass = call.argument("pass");

                        try {
                            student = db.getStudent(getArg);
                            if (student == null) {
                                student = new Profile(-1, "NULL", "NULL", "NULL", "NULL", -1);
                                System.out.println("Error user not found");
                            } else {

                                System.out.println("Found! " + student.getStudentId());

                            }
                        } catch (NullPointerException e) {
                            e.printStackTrace();
                        }

                        System.out.println("user and pass:" + getArg + " " + getPass);

                        result.success(student.testGson());
                    } else if (call.method.equals("getGrades")) {
                        // return string of grades class
                        Grades grades = new Grades();
                        String getStudentId = call.argument("id");
                        try {
                            grades = db.getGrades(getStudentId);
                            if (grades == null) {
                                grades = new Grades(-1, "NULL", -1, -1, -1, -1, -1, -1, -1, -1, -1);
                            } else {
                                System.out.println("Found Grades! " + grades.getStdId());
                            }
                        } catch (NullPointerException e) {
                            e.printStackTrace();
                        }
                        result.success(grades.testGson());
                    }
                    else if(call.method.equals("insertProfile"))
                    { //  convert JSON String to Object
                        Gson json = new Gson();
                        String jsonString = call.argument("profile");
                        String jsonString2 = call.argument("grades");

                        Grades g1 = json.fromJson(jsonString2,Grades.class);
                        Profile p1 = json.fromJson(jsonString,Profile.class);

                        db.addStudent(new Profile(p1.getStudentId(), p1.getPassword(), p1.getCourse(), p1.getName(), p1.getAge()));
                        db.addGrade(new Grades(g1.getStdId(), g1.getFirstSub(), g1.getSecondSub(), g1.getThirdSub(), g1.getFourthSub(), g1.getFifthSub(), g1.getSixthSub(), g1.getSeventhSub(), g1.getEightSub(), g1.getNinthSub()));

                        result.success(p1.getName() + " and grades of " + g1.getStdId()+" Added to database!");
                        //  db.addStudent();
                    }
                    else if(call.method.equals("getStudentCount"))
                    {
                        result.success(db.getProfileCount());

                    }
                    else if (call.method.equals("getStudent"))
                    {
                        DatabaseHelper pdb = new DatabaseHelper(this);
                        int index = call.argument("id");
                        Profile profile = pdb.getStudent(index);
                        if(profile.getStudentId() == null)
                        {
                            result.error("Error",null,null);
                        }
                        else {
                            result.success(profile.testGson());
                        }

                        pdb.close();
                    }else if (call.method.equals("getUpdatedGrades"))
                    {
                        DatabaseHelper pdb = new DatabaseHelper(this);
                        int index = call.argument("id");
                        Grades profile = pdb.getGrades(index);
                        result.success(profile.testGson());
                        pdb.close();
                    }
                    else if (call.method.equals("deleteAll"))
                    {
                        db.deleteAll();
                        result.success("deleted all entries");

                    }
                    else if (call.method.equals("updateDatabase"))
                    {   int flag = 0;
                        Gson json = new Gson();

                        String studUpdate = call.argument("updateStudent");
                        String gradUpdate = call.argument("updateGrades");
                        Profile p1 = json.fromJson(studUpdate,Profile.class);
                        Grades g1 = json.fromJson(gradUpdate,Grades.class);

                         flag = db.updateProfile(p1);
                        flag += db.updateGrades(g1);

                        result.success("Updated the Database with result of: " + flag);


                    }
                    else if (call.method.equals("deleteRecord"))
                    {
                        String student = call.argument("student");
                            db.deleteProfile(student);
                            result.success("deleted "+ student);
                    }
                    else {
                        result.notImplemented();
                    }
                }
        );
    }



}

