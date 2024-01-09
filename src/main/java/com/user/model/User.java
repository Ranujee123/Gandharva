package com.user.model;

    public class User {

        private String fname;
        private String lname;
        private String bday;
        private String country;
        private String email;
        private String password;
        private String cpassword;

        public User(String fname,String lname,String bday,String country,String email,String password,String cpassword){

            this.fname=fname;
            this.lname=lname;
            this.bday=bday;
            this.country=country;
            this.email= email;
            this.password=password;
            this.cpassword=cpassword;
    }



        public String getFname() {
            return fname;
        }

        public String getLname(){
            return lname;
        }

        public String getBday(){return bday;}
        public String getCountry(){return country;}

        public String getEmail(){
            return email;
        }

        public String getPassword(){
            return password;
        }

        public String getCpassword(){
            return cpassword;
        }

        

}
