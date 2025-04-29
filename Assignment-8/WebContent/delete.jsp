<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>Delete Book</title></head>
<body>
<h2>Delete Book Record</h2>
<form method="post">
    Book ID (to delete): <input type="text" name="book_id" /><br/>
    <input type="submit" value="Delete" />
</form>

<%
if (request.getMethod().equalsIgnoreCase("post")) {
    try {
        int book_id = Integer.parseInt(request.getParameter("book_id"));

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pragati", "root", "");
        PreparedStatement ps = con.prepareStatement("DELETE FROM ebookshop WHERE book_id=?");
        ps.setInt(1, book_id);
        int rows = ps.executeUpdate();
        con.close();
        
        if (rows > 0) {
            out.println("<p style='color:green;'>✅ Book record deleted successfully!</p>");
            out.println("<a href='index.jsp'>Back to Records</a>");
        } else {
            out.println("<p style='color:orange;'>⚠️ No record found with that Book ID.</p>");
            out.println("<a href='index.jsp'>Back to Records</a>");
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>❌ Error: " + e + "</p>");
    }
}
%>
</body>
</html>
