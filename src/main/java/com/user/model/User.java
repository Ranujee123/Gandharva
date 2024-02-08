package com.user.model;

    public class User {

        private String fname;
        private String lname;
        private String bday;
        private int cID;
        private String email;
        private String password;

        private int gID;
        private String countryName;


        public User(String fname, String lname, String bday, int cID, String email, String password,  int gID, String countryName) {
            this.fname = fname;
            this.lname = lname;
            this.bday = bday;
            this.cID = cID;
            this.email = email;
            this.password = password;

            this.gID = gID;
            this.countryName = countryName; // Set the country name
        }


        public String getFname() {
            return fname;
        }

        public String getLname(){
            return lname;
        }

        public String getBday(){return bday;}
        public int getCountry(){return cID;}

        public String getEmail(){
            return email;
        }

        public String getPassword(){
            return password;
        }



        public int getgID() {
            return gID;
        }

        public String getCountryName() {
            return countryName;
        }

        public void setCountryName(String countryName) {
            this.countryName = countryName;
        }




    }
