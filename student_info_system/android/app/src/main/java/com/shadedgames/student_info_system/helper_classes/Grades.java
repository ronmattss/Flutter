package com.shadedgames.student_info_system.helper_classes;

import com.google.gson.Gson;

import java.util.HashMap;
import java.util.Map;

public class Grades {

    private int id;
    private String stdId;
    private  float firstSub;
    private  float secondSub;
    private float thirdSub;
    private float fourthSub;
    private float fifthSub;
    private float sixthSub;
    private float seventhSub;
    private float eightSub;
    private float ninthSub;

    public Grades()
    {

    }

    public Grades(int id, String stdId,float firstSub,float secondSub, float thirdSub, float fourthSub, float fifthSub, float sixthSub, float seventhSub, float eightSub, float ninthSub)
    {
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
    public Grades(String stdId,float firstSub,float secondSub, float thirdSub, float fourthSub, float fifthSub, float sixthSub, float seventhSub, float eightSub, float ninthSub)
    {
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

    public float getEightSub() {
        return eightSub;
    }

    public float getFifthSub() {
        return fifthSub;
    }

    public float getFirstSub() {
        return firstSub;
    }

    public float getFourthSub() {
        return fourthSub;
    }

    public float getNinthSub() {
        return ninthSub;
    }

    public float getSecondSub() {
        return secondSub;
    }

    public float getSeventSub() {
        return seventhSub;
    }

    public float getSixthSub() {
        return sixthSub;
    }

    public float getThirdSub() {
        return thirdSub;
    }

    public int getId() {
        return id;
    }

    public String getStdId() {
        return stdId;
    }

    public void setEightSub(float eightSub) {
        this.eightSub = eightSub;
    }

    public void setFifthSub(float fifthSub) {
        this.fifthSub = fifthSub;
    }

    public void setFirstSub(float firstSub) {
        this.firstSub = firstSub;
    }

    public void setFourthSub(float fourthSub) {
        this.fourthSub = fourthSub;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNinthSub(float ninthSub) {
        this.ninthSub = ninthSub;
    }

    public void setSecondSub(float secondSub) {
        this.secondSub = secondSub;
    }

    public void setSeventhSub(float seventhSub) {
        this.seventhSub = seventhSub;
    }

    public void setSixthSub(float sixthSub) {
        this.sixthSub = sixthSub;
    }

    public void setStdId(String stdId) {
        this.stdId = stdId;
    }

    public void setThirdSub(float thirdSub) {
        this.thirdSub = thirdSub;
    }

    public String testGson()
    {
        Gson gson = new Gson();
        Map<String,Object> profileMap = new HashMap<>();
        profileMap.put("id",getId());
        profileMap.put("stdId",getStdId());
        profileMap.put("firstSub",getFirstSub());
        profileMap.put("secondSub",getSecondSub());
        profileMap.put("thirdSub",getThirdSub());
        profileMap.put("fourthSub",getFourthSub());
        profileMap.put("fifthSub",getFifthSub());
        profileMap.put("sixthSub",getSixthSub());
        profileMap.put("seventhSub",getSeventSub());
        profileMap.put("eightSub",getEightSub());
        profileMap.put("ninthSub",getNinthSub());
        String output = gson.toJson(profileMap);

        return output;

    }

}

