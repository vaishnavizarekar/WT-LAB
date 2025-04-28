<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>  
<head>
    <title>eBookShop Data</title>
</head>
<body>  

<h1>Welcome to Sanjivani College of Engineering, IT Department</h1>
<h2>eBookShop Records</h2>
<table border='5'>
    <tr>
        <th>Book ID</th>
        <th>Book Title</th>
        <th>Book Author</th>
        <th>Book Price</th>
        <th>Quantity</th>
    </tr>

<%
try { 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pragati", "root", "");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM ebookshop");

    while (rs.next()) {    
%>
        <tr>
            <td><%= rs.getInt(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getDouble(4) %></td>
            <td><%= rs.getInt(5) %></td>
        </tr>
<%
    }
    con.close();
} catch (Exception e) {
    out.println("<tr><td colspan='5'>Error: " + e + "</td></tr>");
}
%>
</table>
<br><br>
<!-- Operation Buttons -->
<div style="text-align: center;">
    <form action="insert.jsp" method="get" style="display: inline;">
        <input type="submit" value="INSERT" />
    </form>

    <form action="update.jsp" method="get" style="display: inline; margin-left: 10px;">
        <input type="submit" value="UPDATE" />
    </form>

    <form action="delete.jsp" method="get" style="display: inline; margin-left: 10px;">
        <input type="submit" value="DELETE" />
    </form>
</div>

</body>  
</html>