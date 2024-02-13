package com.user.model;

    public class User {

        private String fname;
        private String lname;
        private String idNumber;
        private int pID;
        private String email;
        private String password;

        private String gender;
        private String dob;

        private String provinceName;

        private int age;


        public User(String fname, String lname, String idNumber, int pID, String email, String password,  String gender, String dob, int age) {
            this.fname = fname;
            this.lname = lname;
            this.idNumber = idNumber;
            this.pID = pID;
            this.email = email;

            this.password = password;

            this.gender = gender;
            this.dob=dob;
            this.provinceName = provinceName; // Set the country name
            this.age=age;

        }


        public String getFname() {
            return fname;
        }

        public String getLname(){
            return lname;
        }

        public String getBday(){return idNumber;}
        public int getProvince(){return pID;}

        public String getEmail(){
            return email;
        }

        public String getPassword(){
            return password;
        }



        public String getGender() {
            return gender;
        }

        public String getProvinceName() {
            return provinceName;
        }

        public void setProvinceName(String provinceName) {
            this.provinceName = provinceName;
        }


        public Object getidNumber() {
            return idNumber;
        }

        public int getAge() {
            return age;
        }
    }
