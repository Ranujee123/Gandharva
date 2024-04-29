<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <c:import url="Final_Sidebar.jsp" />
        
        <%String serviceType = request.getAttribute("serviceType").toString();%>
        
        <html>

        <head>
            <title>${title}</title>
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">

            <style>
                * {
                    font-family: "Poppins", sans-serif;
                }

                body {
                    display: flex;
                    min-height: 100vh;
                    background-color: #f0f0f0;
                    align-items: flex-start;
                    /* Ensures items start from the top */
                    justify-content: center;
                    /* Adds space at the top for any header or spacing */
                }

                .main-content {
                    display: flex;
                    flex-direction: column;
                    width: calc(100% - 120px);
                    margin-left: 50px;
                    margin-right: 50px;
                    padding-top: 30px;
                }

                .details-card {
                    min-width: 300px;
                    align-items: center;
                    justify-content: flex-start;
                    padding: 30px;
                    border-radius: 10px;
                    background-color: #ffffff;
                    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                    text-decoration: none;
                }

                .profile-image {
                    border-radius: 50%;
                    width: 100px;
                    height: 100px;
                    margin-right: 20px;
                    align-self: center;
                }

                a {
                    text-decoration: none;
                    color: inherit;
                }

                a.requests {
                    padding: 10px;
                    border-radius: 5px;
                    border: 1px solid #ccc;
                    background-color: #273B4A;
                    color: white;
                    cursor: pointer;
                    width: 220px;
                    text-align: center;
                    margin-bottom: 20px;
                    text-decoration: none;

                    /* center the text */
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                }

                .wrap-items {
                    display: flex;
                    flex-wrap: wrap;
                    width: 100%;
                    gap: 15px;
                    margin-top: 30px;
                }

                .search {
                    display: flex;
                    gap: 10px;
                    margin-bottom: 20px;
                }

                input[type="text"] {
                    padding: 10px;
                    border-radius: 5px;
                    border: 1px solid #ccc;
                    width: 300px;
                }

                input[type="submit"] {
                    padding: 10px;
                    border-radius: 5px;
                    border: 1px solid #ccc;
                    background-color: #273B4A;
                    color: white;
                    cursor: pointer;
                }
            </style>


        </head>

        <body>
            <div class="main-content">
                <%
                if (request.getAttribute("successMessage") != null) {
                %>
                <div style="color: green;"><%=request.getAttribute("successMessage").toString()%></div>
                <%
                    request.removeAttribute("successMessage");
                }
                %>
                <h1>${heading}</h1>


                <!-- Search -->
                <%if(serviceType.equals("ASTROLOGER")) {%>
                    <div style="display: flex; gap: 10px;">
                        <a href="AcceptedRequests" class="requests">Accepted Requests</a>
                        <a href="ViewAstroReq" class="requests">All Requests</a>
                    </div>
                    <form action="AstrologyService" method="post" class="search">
                        <input type="text" name="filterText" placeholder="Search by name..." />
                        <input type="submit" value="Search" />
                    </form>
                <%} else if(serviceType.equals("EVENT_PLANNER")) { %>
                	<a href="ViewEventReq" class="requests">View Requests</a>
                    <form action="EventPlannerService" method="post" class="search">
                        <input type="text" name="filterText" placeholder="Search by name..." />
                        <input type="submit" value="Search" />
                    </form>
                <%} %>

                <div class="wrap-items">
                    <c:forEach var="serviceProvider" items="${serviceProviders}">
                    
                    <%if(serviceType.equals("ASTROLOGER")) {%>
                    <a href="SendAstroReq?id=${serviceProvider.id}" style="display: block; text-decoration: none; color: inherit;">
                    <%} else if(serviceType.equals("EVENT_PLANNER")) { %>
                    <a href="SendEventReq?id=${serviceProvider.id}" style="display: block; text-decoration: none; color: inherit;">
                    <%} %>
                            
                            <div class="details-card">
                                <img class="profile-image" src="${serviceProvider.base64Image}" />
                                <h2>${serviceProvider.firstName} ${serviceProvider.lastName}</h2>
                                <p>${serviceProvider.district}</p>
                                <p>${serviceProvider.email}</p>
                                <p>Number of cases handled:
                                    ${serviceProvider.numberOfCasesHandled}</p>
                                <p>Years of experience: ${serviceProvider.yearsOfExperience}</p>
                            </div>
                        </a>
                    </c:forEach>
                </div>

                <!-- Empty serviceProviders message -->
                <c:if test="${empty serviceProviders}">
                    <p>No service found.</p>
                </c:if>
            </div>
        </body>

        </html>