package com.vinson.plms;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.TimeZone;
import java.util.Date;

public class ParkingDAO {
    static Connection conn = ConnectionProvider.getConnection();
    static PreparedStatement pst;

    public static int registerUser(ParkingBean u){
        int status = 0;
        String sql = SQLQueries.insert("userLogin", "username", "password", "email", "member", "request");
        try{
            pst = conn.prepareStatement(sql);
            pst.setString(1, u.getUsername());
            pst.setString(2, u.getPassword());
            pst.setString(3, u.getEmail());
            pst.setBoolean(4, false);
            pst.setBoolean(5, false);
            status = pst.executeUpdate();
        }
        catch (Exception e){
            System.out.println(e);
        }
        return status;
    }

    public static int validateUserLogin(String username, String password){
        int status = 0;
        String sql = SQLQueries.selectWhere("userLogin", "username", "password");
        try{
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                status = 1;
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        return status;
    }

    public static int validateSecurityLogin(String username, String password){
        int status = 0;
        String sql = SQLQueries.selectWhere("securityLogin", "username", "password");
        try{
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                status = 1;
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        return status;
    }

    public static int twoWheeler(){
        String sql = SQLQueries.select("twoWheeler", "slot");
        int a=0, status=0; String b="";
        try{
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            while(rs.next()){
                a = rs.getInt("slot");
                b = rs.getString("state");
                if(b.equals("Free")){
                    return a;
                }
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        return status;
    }

    public static int fourWheeler(){
        String sql = SQLQueries.select("fourWheeler", "slot");
        int a=0, status=0; String b="";
        try{
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            while(rs.next()){
                a = rs.getInt("slot");
                b = rs.getString("state");
                if(b.equals("Free")){
                    return a;
                }
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        return status;
    }

    public static int twoCheckin(ParkingBean u, String uname){
        int status = 0;
        String sql = SQLQueries.update("twoWheeler", "slot", "username", "state", "time");
        try {
            pst= conn.prepareStatement(sql);
            pst.setString(1, uname);
            pst.setString(2, "Occupied");
            pst.setString(3, u.getTime());
            pst.setInt(4, u.getSlot());
            status=pst.executeUpdate();
        }catch(Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static int fourCheckin(ParkingBean u, String uname){
        int status = 0;
        String sql = SQLQueries.update("fourWheeler", "slot", "username", "state", "time");
        try {
            pst= conn.prepareStatement(sql);
            pst.setString(1, uname);
            pst.setString(2, "Occupied");
            pst.setString(3, u.getTime());
            pst.setInt(4, u.getSlot());
            status=pst.executeUpdate();
        }catch(Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static int twoPayment(ParkingBean u){
        int status=0;
        String sql = SQLQueries.update("twoWheeler", "slot", "username", "state", "time");
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, null);
            pst.setString(2, "Free");
            pst.setString(3, "0:0");
            pst.setInt(4, u.getSlot());
            status = pst.executeUpdate();
        } catch (Exception e){
            System.out.println(e);
        }
        return status;
    }

    public static int fourPayment(ParkingBean u){
        int status=0;
        String sql = SQLQueries.update("fourWheeler", "slot", "username", "state", "time");
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, null);
            pst.setString(2, "Free");
            pst.setString(3, "0:0");
            pst.setInt(4, u.getSlot());
            status = pst.executeUpdate();
        } catch (Exception e){
            System.out.println(e);
        }
        return status;
    }

    public static String twoCheckinTime(int slot){
        String cinTime = "";
        String sql = SQLQueries.selectWhere("twoWheeler", "slot");
        try{
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, slot);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                cinTime = rs.getString("time");
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        return cinTime;
    }

    public static String fourCheckinTime(int slot){
        String cinTime = "";
        String sql = SQLQueries.selectWhere("fourWheeler", "slot");
        try{
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, slot);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                cinTime = rs.getString("time");
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        return cinTime;
    }

    public static void increaseSlot(int slot){
        String tName = vehicleType(slot)+"Wheeler";
        String sql = SQLQueries.insert(tName, "slot", "username", "state", "time");
        try{
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, slot+1);
            pst.setString(2, null);
            pst.setString(3, "Free");
            pst.setString(4, "0:0");
            pst.executeUpdate();
        }
        catch (Exception e){
            System.out.println(e);
        }
    }

    public static void decreaseSlot(int slot){
        String sql;
        String tName = vehicleType(slot)+"Wheeler";
        sql = SQLQueries.delete(tName);
        try{
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, slot);
            pst.executeUpdate();
        }
        catch (Exception e){
            System.out.println(e);
        }
    }

    public static int floorExtract(int slot) {
        int status = 0;
        String str = String.valueOf(slot);
        char floor = str.charAt(1);
        status = Character.getNumericValue(floor);
        return status;
    }

    public static String vehicleType(int slot){
        String str = String.valueOf(slot);
        char floor = str.charAt(0);
        int status = Character.getNumericValue(floor);
        if(status==2){
            return "two";
        }
        else {
            return "four";
        }
    }

    public static void reserveSlot(int slot){
        String vehType = vehicleType(slot);
        String tName = vehType+"Wheeler";
        String sql = SQLQueries.update(tName, "slot", "state");
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, "Reserved");
            pst.setInt(2, slot);
            pst.executeUpdate();
        } catch (Exception e){
            System.out.println(e);
        }
    }

    public static void unReserveSlot(int slot){
        String vehType = vehicleType(slot);
        String tName = vehType+"Wheeler";
        String sql = SQLQueries.update(tName, "slot", "state");
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, "Free");
            pst.setInt(2, slot);
            pst.executeUpdate();
        } catch (Exception e){
            System.out.println(e);
        }
    }

    public static void dePromote(String uname){
        String sql = SQLQueries.update("userLogin", "username", "member");
        try {
            pst = conn.prepareStatement(sql);
            pst.setBoolean(1, false);
            pst.setString(2, uname);
            pst.executeUpdate();
        } catch (Exception e){
            System.out.println(e);
        }
    }

    public static void acceptRequest(String uname){
        String sql = SQLQueries.update("userLogin", "username", "member", "request");
        try {
            pst = conn.prepareStatement(sql);
            pst.setBoolean(1, true);
            pst.setBoolean(2, false);
            pst.setString(3, uname);
            pst.executeUpdate();
        } catch (Exception e){
            System.out.println(e);
        }
    }

    public static void sendRequest(String uname){
        SQLQueries.update("userLogin", "username", "request");
        String sql = SQLQueries.update("userLogin", "username", "request");
        try {
            pst = conn.prepareStatement(sql);
            pst.setBoolean(1, true);
            pst.setString(2, uname);
            pst.executeUpdate();
        } catch (Exception e){
            System.out.println(e);
        }
    }

    public static boolean memberCheck(String uname){
        boolean res = false;
        String sql = SQLQueries.select("userLogin", "username");
        try{
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                if (resultSet.getString("username").equals(uname)){
                    res = resultSet.getBoolean("member");
                }
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        return res;
    }

    public static boolean requestCheck(String uname){
        boolean res = false;
        String sql = SQLQueries.select("userLogin", "username");
        try{
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                if (resultSet.getString("username").equals(uname)){
                    res = resultSet.getBoolean("request");
                }
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        return res;
    }

    public static int checkOutConfirm(String uname){
        try{
            String sql = SQLQueries.select("twoWheeler", "slot");
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                String str = resultSet.getString("username");
                if (str!=null && str.equals(uname)){
                    return 1;
                }
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        try{
            String sql1 = SQLQueries.select("fourWheeler", "slot");
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql1);
            while(resultSet.next()){
                String str = resultSet.getString("username");
                if (str!=null && str.equals(uname)){
                    return 1;
                }
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        return 0;
    }

    public static int[] checkOutVehicles(String uname){
        int arr[] = new int[20];
        int i=0;
        try{
            String sql = SQLQueries.select("twoWheeler", "slot");
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                int slot = resultSet.getInt("slot");
                String str = resultSet.getString("username");
                if (str!=null && str.equals(uname)){
                    arr[i] = slot;
                    i++;
                }
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        try{
            String sql1 = SQLQueries.select("fourWheeler", "slot");
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql1);
            while(resultSet.next()){
                int slot = resultSet.getInt("slot");
                String str = resultSet.getString("username");
                if (str!=null && str.equals(uname)){
                    arr[i] = slot;
                    i++;
                }
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        return arr;
    }
    public static String currentTime(){
        SimpleDateFormat sd = new SimpleDateFormat("HH:mm");
        Date date = new Date();
        sd.setTimeZone(TimeZone.getTimeZone("IST"));
        return sd.format(date);
    }
    public static void memberCheckIn(String vehType, String uname, int slot){
        String sql = SQLQueries.update(vehType+"Wheeler", "slot", "username", "state", "time");
        String time = currentTime();
        try {
            pst= conn.prepareStatement(sql);
            pst.setString(1, uname);
            pst.setString(2, "Occupied");
            pst.setString(3, time);
            pst.setInt(4, slot);
            pst.executeUpdate();
        }catch(Exception e) {
            System.out.println(e);
        }
    }

    public static int autoPark(String vehType, String floor, String uname){
        int slot = 0, status=0;
        int fNo = Character.getNumericValue(floor.charAt(0));
        if (fNo>0){
            try {
                String sql = SQLQueries.select(vehType+"Wheeler", "slot");
                Statement statement = conn.createStatement();
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()){
                    int a = resultSet.getInt("slot");
                    String state = resultSet.getString("state");
                    int b = ParkingDAO.floorExtract(a);
                    if (b==fNo && (state.equals("Reserved")||state.equals("Free"))){
                        memberCheckIn(vehType, uname, a);
                        slot = a;
                        status++;
                        break;
                    }
                }
            } catch (Exception e){
                System.out.println(e);
            }
            if (status==0){
                try {
                    String sql = SQLQueries.select(vehType+"Wheeler", "slot");
                    Statement statement = conn.createStatement();
                    ResultSet resultSet = statement.executeQuery(sql);
                    while(resultSet.next()){
                        int a = resultSet.getInt("slot");
                        String state = resultSet.getString("state");
                        int b = ParkingDAO.floorExtract(a);
                        if (state.equals("Reserved")||state.equals("Free")){
                            memberCheckIn(vehType, uname, a);
                            slot = a;
                            break;
                        }
                    }
                } catch (Exception e){
                    System.out.println(e);
                }
            }
        }
        else {
            try {
                String sql = SQLQueries.select(vehType+"Wheeler", "slot");
                Statement statement = conn.createStatement();
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()){
                    int a = resultSet.getInt("slot");
                    String state = resultSet.getString("state");
                    if (state.equals("Reserved")){
                        memberCheckIn(vehType, uname, a);
                        slot = a;
                        status++;
                        break;
                    }
                }
            } catch (Exception e){
                System.out.println(e);
            }
            if (status==0){
                try {
                    String sql = SQLQueries.select(vehType+"Wheeler", "slot");
                    Statement statement = conn.createStatement();
                    ResultSet resultSet = statement.executeQuery(sql);
                    while(resultSet.next()){
                        int a = resultSet.getInt("slot");
                        String state = resultSet.getString("state");
                        if (state.equals("Free")){
                            memberCheckIn(vehType, uname, a);
                            slot = a;
                            status++;
                            break;
                        }
                    }
                } catch (Exception e){
                    System.out.println(e);
                }
            }
        }
        return slot;
    }

    public static Statement getStatement() throws SQLException {
        return conn.createStatement();
    }

    public static void logFile(String str) {
        try {
            FileWriter fw = new FileWriter("C:\\Users\\vinso\\IdeaProjects\\ParkingLot\\src\\main\\files\\log-file.txt", true);
            fw.write(str);
            fw.write(System.getProperty( "line.separator" ));
            fw.close();
        }
        catch (Exception e) {
            e.getStackTrace();
        }
    }
}
