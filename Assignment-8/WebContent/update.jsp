<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>Update Book</title></head>
<body>
<h2>Update Book Record</h2>
<form method="post">
    Book ID (to update): <input type="text" name="book_id" /><br/>
    New Title: <input type="text" name="book_title" /><br/>
    New Author: <input type="text" name="author" /><br/>
    New Price: <input type="text" name="price" /><br/>
    New Quantity: <input type="text" name="quantity" /><br/>
    <input type="submit" value="Update" />
</form>

<%
if (request.getMethod().equalsIgnoreCase("post")) {
    try {
        int book_id = Integer.parseInt(request.getParameter("book_id"));
        String book_title = request.getParameter("book_title");
        String author = request.getParameter("author");
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pragati", "root", "");
        PreparedStatement ps = con.prepareStatement(
            "UPDATE ebookshop SET book_title=?, author=?, price=?, quantity=? WHERE book_id=?");
        ps.setString(1, book_title);
        ps.setString(2, author);
        ps.setInt(3, price);
        ps.setInt(4, quantity);
        ps.setInt(5, book_id);
        int rows = ps.executeUpdate();
        con.close();
        
        if (rows > 0) {
            out.println("<p style='color:green;'>✅ Book record updated successfully!</p>");
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
