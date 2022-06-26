package com.vinson.plms;

public class SQLQueries {
    public static String select(String tName, String order) {
        return "select*from "+tName+" order by "+order;
    }
    public static String selectWhere(String tName, String... where){
        StringBuilder str = new StringBuilder();
        for (String i : where) {
            str.append(i).append("=? and ");
        }
        str.delete(str.length()-4, str.length());
        return "select*from "+tName+" where "+str;
    }
    public static String update(String tName, String where, String... par) {
        StringBuilder set = new StringBuilder();
        for (String i : par) {
            set.append(i).append("=?, ");
        }
        set.delete(set.length()-2, set.length());
        return "update "+tName+ " set "+set+" where "+where+"=?";
    }
    public static String insert(String tName, String... par) {
        StringBuilder colNames = new StringBuilder();
        StringBuilder qn = new StringBuilder("?");
        for (String i : par){
            colNames.append(i).append(", ");
            qn.append(", ?");
        }
        colNames.delete(colNames.length()-2, colNames.length());
        qn.delete(qn.length()-3, qn.length());
        return "insert into "+tName+" ("+colNames+") values ("+qn+")";
    }
    public static String delete(String tName) {
        return "delete from "+tName+" where slot=?";
    }
}
