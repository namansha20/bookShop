<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Books - BookHub</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 40px 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
            text-align: center;
            font-size: 2.5em;
        }
        .actions {
            display: flex;
            gap: 15px;
            margin-bottom: 30px;
            justify-content: center;
        }
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        .btn-secondary {
            background: #f0f0f0;
            color: #333;
        }
        .btn-secondary:hover {
            background: #e0e0e0;
        }
        .books-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            overflow: hidden;
            border-radius: 8px;
        }
        .books-table thead {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .books-table th,
        .books-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .books-table th {
            font-weight: bold;
            font-size: 1.1em;
        }
        .books-table tbody tr {
            transition: background-color 0.3s ease;
        }
        .books-table tbody tr:hover {
            background-color: #f5f5f5;
        }
        .books-table tbody tr:last-child td {
            border-bottom: none;
        }
        .price {
            color: #27ae60;
            font-weight: bold;
        }
        .empty-message {
            text-align: center;
            padding: 40px;
            color: #666;
            font-size: 1.2em;
        }
        .empty-message p {
            margin-bottom: 20px;
        }
        .book-id {
            color: #667eea;
            font-weight: bold;
        }
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
            .books-table {
                font-size: 0.9em;
            }
            .books-table th,
            .books-table td {
                padding: 10px;
            }
            h1 {
                font-size: 2em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📚 All Books</h1>
        
        <div class="actions">
            <a href="${pageContext.request.contextPath}/books/addBook" class="btn btn-primary">
                ➕ Add New Book
            </a>
            <a href="${pageContext.request.contextPath}/books/" class="btn btn-secondary">
                🏠 Home
            </a>
        </div>
        
        <c:choose>
            <c:when test="${not empty books}">
                <table class="books-table">
                    <thead>
                        <tr>
                            <th>Book ID</th>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="book" items="${books}">
                            <tr>
                                <td class="book-id">#${book.bookId}</td>
                                <td>${book.title}</td>
                                <td>${book.author}</td>
                                <td class="price">$${book.price}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="empty-message">
                    <p>📭 No books found in the library.</p>
                    <a href="${pageContext.request.contextPath}/books/addBook" class="btn btn-primary">
                        Add Your First Book
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
