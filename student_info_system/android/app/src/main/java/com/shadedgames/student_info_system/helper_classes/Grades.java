package com.shadedgames.student_info_system.helper_classes;

import com.google.gson.Gson;

import java.util.HashMap;
import java.util.Map;

public class Grades {

    private int id;
    private String stdId;
    private double firstSub;
    private double secondSub;
    private double thirdSub;
    private double fourthSub;
    private double fifthSub;
    private double sixthSub;
    private double seventhSub;
    private double eightSub;
    private double ninthSub;

    public Grades() {

    }

    // constructor from a Database INPUT
    public Grades(int id, String stdId, double firstSub, double secondSub, double thirdSub, double fourthSub, double fifthSub, double sixthSub, double seventhSub, double eightSub, double ninthSub) {
        setId(id);
        setStdId(stdId);
        setFirstSub(firstSub);
        setSecondSub(secondSub);
        setThirdSub(thirdSub);
        setFourthSub(fourthSub);
        setFifthSub(fifthSub);
        setSixthSub(sixthSub);
        setSeventhSub(seventhSub);
        setEightSub(eightSub);
        setNinthSub(ninthSub);
    }

    // constructor from a JSON STRING INPUT
    public Grades(String stdId, double firstSub, double secondSub, double thirdSub, double fourthSub, double fifthSub, double sixthSub, double seventhSub, double eightSub, double ninthSub) {
        setStdId(stdId);
        setFirstSub(firstSub);
        setSecondSub(secondSub);
        setThirdSub(thirdSub);
        setFourthSub(fourthSub);
        setFifthSub(fifthSub);
        setSixthSub(sixthSub);
        setSeventhSub(seventhSub);
        setEightSub(eightSub);
        setNinthSub(ninthSub);
    }

    public double getEightSub() {
        return eightSub;
    }

    public double getFifthSub() {
        return fifthSub;
    }

    public double getFirstSub() {
        return firstSub;
    }

    public double getFourthSub() {
        return fourthSub;
    }

    public double getNinthSub() {
        return ninthSub;
    }

    public double getSecondSub() {
        return secondSub;
    }

    public double getSeventhSub() {
        return seventhSub;
    }

    public double getSixthSub() {
        return sixthSub;
    }

    public double getThirdSub() {
        return thirdSub;
    }

    public int getId() {
        return id;
    }

    public String getStdId() {
        return stdId;
    }

    public void setEightSub(double eightSub) {
        this.eightSub = eightSub;
    }

    public void setFifthSub(double fifthSub) {
        this.fifthSub = fifthSub;
    }

    public void setFirstSub(double firstSub) {
        this.firstSub = firstSub;
    }

    public void setFourthSub(double fourthSub) {
        this.fourthSub = fourthSub;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNinthSub(double ninthSub) {
        this.ninthSub = ninthSub;
    }

    public void setSecondSub(double secondSub) {
        this.secondSub = secondSub;
    }

    public void setSeventhSub(double seventhSub) {
        this.seventhSub = seventhSub;
    }

    public void setSixthSub(double sixthSub) {
        this.sixthSub = sixthSub;
    }

    public void setStdId(String stdId) {
        this.stdId = stdId;
    }

    public void setThirdSub(double thirdSub) {
        this.thirdSub = thirdSub;
    }

    public String testGson() {
        Gson gson = new Gson();
        Map<String, Object> profileMap = new HashMap<>();
        profileMap.put("id", getId());
        profileMap.put("stdId", getStdId());
        profileMap.put("firstSub", getFirstSub());
        profileMap.put("secondSub", getSecondSub());
        profileMap.put("thirdSub", getThirdSub());
        profileMap.put("fourthSub", getFourthSub());
        profileMap.put("fifthSub", getFifthSub());
        profileMap.put("sixthSub", getSixthSub());
        profileMap.put("seventhSub", getSeventhSub());
        profileMap.put("eightSub", getEightSub());
        profileMap.put("ninthSub", getNinthSub());
        String output = gson.toJson(profileMap);

        return output;

    }

}

