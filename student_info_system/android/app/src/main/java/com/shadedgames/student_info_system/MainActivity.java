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
        db.addStudent(new Profile("2018-0001-MN-0","QWERTY","BSCS","Matthew",20));
        db.addGrade(new Grades("2018-0000-MN-0",1.0f,1.0f,1.0f,1.0f,1.0f,1.0f,1.0f,1.0f,1.0f));
        db.addGrade(new Grades("2018-0001-MN-0",1.50f,1.0f,1.0f,1.50f,1.25f,1.0f,1.75f,1.0f,1.25f));
*/


        // When uninstalling pls change this two sample data
        Grades g = db.getGrades(1);
        Profile p = db.getStudent(1);
        System.out.println(g.getStdId());
        g.testGson();

        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, Result result) {
                        if (call.method.equals("getSample")) {
                            Profile student = new Profile(-1, "NULL", "NULL","NULL","NULL",-1);
                            String getArg = call.argument("user");
                            String getPass = call.argument("pass");

                            try {
                                student = db.getStudent(getArg);
                                if (student == null) {
                                    student =  new Profile(-1, "NULL", "NULL","NULL","NULL",-1);
                                    System.out.println("Error user not found");
                                } else {

                                    System.out.println("Found! " + student.getStudentId());

                                }
                            } catch (NullPointerException e) {
                                e.printStackTrace();
                            }

                            System.out.println("user and pass:" + getArg + " " + getPass);

                            result.success(student.testGson());
                        } else {
                            result.notImplemented();
                        }
                    }
                }
        );
    }

    private int incrementI(int y) {
        y += 1;
        return y++;
    }

    void GetProfileData() {

    }


}

