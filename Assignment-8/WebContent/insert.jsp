<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>Insert Book</title></head>
<body>
<h2>Insert New Book</h2>
<form method="post">
    Book ID: <input type="text" name="book_id" /><br/>
    Title: <input type="text" name="book_title" /><br/>
    Author: <input type="text" name="author" /><br/>
    Price: <input type="text" name="price" /><br/>
    Quantity: <input type="text" name="quantity" /><br/>
    <input type="submit" value="Insert" />
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
            "INSERT INTO ebookshop (book_id, book_title, author, price, quantity) VALUES (?, ?, ?, ?, ?)");
        ps.setInt(1, book_id);
        ps.setString(2, book_title);
        ps.setString(3, author);
        ps.setInt(4, price);
        ps.setInt(5, quantity);
        ps.executeUpdate();
        con.close();
        out.println("<p style='color:green;'>✅ Book inserted successfully!</p>");
        out.println("<a href='index.jsp'>Back to Records</a>");
    } catch (Exception e) {
        out.println("<p style='color:red;'>❌ Error: " + e + "</p>");
    }
}
%>
</body>
</html> 