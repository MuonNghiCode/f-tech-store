<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Order Details - F-TECH STORE</title>
        <link rel="stylesheet" href="css/order_details.css">
        <link rel="icon" type="image/x-icon" href="images/android-chrome-512x512-removebg-preview.png">
    </head>
    <body>
        <header>
            <div class="FPTlogo">
                <a href="MainController" class="logo large">
                    <img src="images/LogoSample_ByTailorBrands__1_-re.png" alt="FPTShop Logo">
                </a>
            </div>
            <div class="search-container">
                <form id="search-form" action="MainController" method="POST">
                    <input type="text" id="search" name="search" placeholder="Search products..." required autocomplete="off" value="${SEARCH_QUERY}">
                    <button type="submit" name="action" value="Search">
                        <img src="images/search-interface-symbol.png" alt="Search Icon" class="search-image">
                    </button>
                </form>
            </div>
            <div class="welcome-message">
                <c:if test="${not empty sessionScope.LOGIN_USER}">
                    <p>${sessionScope.LOGIN_USER.fullName}</p>
                </c:if>
            </div>
            <div class="user-container">
                <div class="UserLogo">
                    <a href="login.jsp" class="logo">
                        <img src="images/profile-user.jpg" alt="User Logo">
                    </a>
                    <div class="user-menu">
                        <ul>
                            <c:choose>
                                <c:when test="${not empty sessionScope.LOGIN_USER}">
                                    <li><a href="MainController?action=logout">Logout</a></li>
                                    <li><a href="MainController?action=orderHistory">History</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li><a href="login.jsp">Login</a></li>
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                    </div>
                </div>  
            </div>
            <div class="cart-container">
                <div class="CartLogo">
                    <a href="MainController?action=view" class="logo">
                        <img src="images/grocery-store.png" alt="Cart Logo">
                    </a>
                    <c:if test="${not empty ADD_SUCCESS}">
                        <div class="alert alert-danger">${ADD_SUCCESS}</div>
                    </c:if>
                </div>  
            </div>
            <div>
                <nav>
                    <ul>
                        <li><a href="MainController">Home</a></li>
                        <li><a href="#footer">About Us</a></li>
                    </ul>
                </nav>
            </div>        
        </header>

        <main>
            <div class="order-details-section">
                <h3 class="order-details-title">Chi Tiết Đơn Hàng ID: ${param.orderID}</h3>
                <table class="order-details-table">
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="totalAmount" value="0"/>
                        <c:forEach var="detail" items="${ORDER_DETAILS}">
                            <tr>
                                <td>${detail.productID}</td>
                                <td><fmt:formatNumber value="${detail.price}" type="currency" currencySymbol=""/>₫</td>
                                <td>${detail.quantity}</td>
                                <td>${detail.status}</td>
                            </tr>
                            <c:set var="totalAmount" value="${totalAmount + (detail.price * detail.quantity)}"/>
                        </c:forEach>
                        <c:if test="${empty ORDER_DETAILS}">
                            <tr>
                                <td colspan="4" class="no-details">Không có chi tiết đơn hàng nào.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
                <div class="total-amount-container">
                    <div class="totalPrice">
                        <strong>Tổng số tiền: </strong>
                        <fmt:formatNumber value="${totalAmount}" type="currency" currencySymbol=""/>₫
                    </div>
                </div>
            </div>
        </main>

        <footer id="footer">
            <div class="footer-content">
                <div class="footer-section about">
                    <h3>F-TECH STORE</h3>
                    <p>F-TECH STORE is your one-stop destination for the latest electronics, computers, and mobile devices. We strive to provide the best quality products at competitive prices with top-notch customer service.</p>
                    <div class="contact">
                        <p><strong>Address:</strong> Lô E2a-7, Đường D1 Khu Công nghệ cao, P. Long Thạnh Mỹ, TP. Thủ Đức, TP. Hồ Chí Minh</p>
                        <p><strong>Phone:</strong> 028 7300 1866</p>
                        <p><strong>Email:</strong> daihocfpt@fpt.edu.vn</p>
                    </div>
                </div>
                <div class="footer-section social">
                    <h3>Follow Us</h3>
                    <div class="social-icons">
                        <a href="https://www.facebook.com/FPTU.HCM" class="social-icon">
                            <img src="images/facebook.jpg" alt="FaceBook Logo">
                        </a>
                        <a href="https://www.youtube.com/channel/UC4vAAvyjYMpirmYayY4_lHQ/featured" class="social-icon">
                            <img src="images/youtube.jpg" alt="Youtube Logo">
                        </a>
                        <a href="https://www.linkedin.com/school/fpt-university/" class="social-icon">
                            <img src="images/linkedin.jpg" alt="Linkedin Logo">
                        </a>
                        <a href="https://www.instagram.com/fptuniversityhcm/" class="social-icon">
                            <img src="images/instagram.jpg" alt="Instagram Logo">
                        </a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 F-TECH STORE. All rights reserved.</p>
                <a href="#" class="back-to-top">Back to Top</a>
            </div>
        </footer>
    </body>
</html>