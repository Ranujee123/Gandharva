<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="Final_Sidebar.jsp" />

<%String serviceType=request.getAttribute("serviceType").toString();%>

<html>

<head>
    <title>${title}</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <link rel="stylesheet" href="styles/modal.css">
    <link rel="stylesheet" href="styles/main.css">

    <style>
        * {
            font-family: "Poppins", sans-serif;
        }

        body {
            display: flex;
            min-height: 100vh;
            background-color: #f0f0f0;
            align-items: flex-start;
            justify-content: center;
        }

        .main-content {
            display: flex;
            flex-direction: column;
            width: calc(100% - 120px);
            margin-left: 50px;
            margin-right: 50px;
            padding-top: 30px;
        }
        
        table {
			border-collapse: collapse;
			width: 100%;
			margin-top: 20px;
		}
		
		table td, table th {
			border: 1px solid #ddd;
			padding: 8px;
		}
		
		table tr:nth-child(even){background-color: #f2f2f2;}
		
		table tr:hover {background-color: #ddd;}
		
		table th {
			padding-top: 12px;
			padding-bottom: 12px;
			text-align: left;
			background-color: #273B4A;
			color: white;
		}

        label {
            font-weight: bold;
            margin-bottom: 20px;
        }

        .details span {
            font-weight: normal;
        }

    </style>


</head>

<body>
    <div class="main-content">
        <h1>${heading}</h1>

        <table>
            <%if(serviceType.equals("ASTROLOGER")) {%>
                <th>Request Date</th>
                <th>Deadline</th>
                <th>Comments</th>
                <th>Feedbak</th>
                <th>Status</th>
                <th></th>

                <c:forEach var="serviceRequest" items="${serviceRequests}">
                    <tr onclick="openModal(
                        '${serviceRequest.id}',
                        '${serviceRequest.startDate}',
                        '${serviceRequest.deadline}',
                        '${serviceRequest.status}',
                        '${serviceRequest.comments}',
                        '${serviceRequest.feedback}',
                        '${serviceRequest.astrologerId}',
                        '${serviceRequest.feedbackImageString}'
                    )">
                        <td><c:choose><c:when test="${empty serviceRequest.startDate}">N/A</c:when><c:otherwise>${serviceRequest.startDate}</c:otherwise></c:choose></td>
                        <td><c:choose><c:when test="${empty serviceRequest.deadline}">N/A</c:when><c:otherwise>${serviceRequest.deadline}</c:otherwise></c:choose></td>
                        <td><c:choose><c:when test="${empty serviceRequest.comments}">N/A</c:when><c:otherwise>${serviceRequest.comments}</c:otherwise></c:choose></td>
                        <td><c:choose><c:when test="${empty serviceRequest.feedback}">N/A</c:when><c:otherwise>${serviceRequest.feedback}</c:otherwise></c:choose></td>
                        <td><c:choose><c:when test="${empty serviceRequest.status}">N/A</c:when><c:otherwise>${serviceRequest.status}</c:otherwise></c:choose></td>
                        <!-- if serviceRequest.status is ACCEPTED -->
                        <td>
                            <c:choose>
                                <c:when test="${serviceRequest.status == 'ACCEPTED'}">
                                <a href="SendHoroscope?id=${serviceRequest.id}">Pay</a>
                                </c:when><c:otherwise></c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            <%} else if(serviceType.equals("EVENT_PLANNER")) { %>
                <th>Request Date</th>
                <th>Food</th>
                <th>Chairs</th>
                <th>Decoration</th>
                <th>Audio</th>
                <th>Request Status</th>
                <th>Payment Status</th>
                <c:forEach var="serviceRequest" items="${serviceRequests}">
                    <tr>
                        <td>${serviceRequest.requestedDate}</td>
                        <td>${serviceRequest.foodBevSupplier}</td>
                        <td>${serviceRequest.tablesChairsSupplier}</td>
                        <td>${serviceRequest.decorationsSupplier}</td>
                        <td>${serviceRequest.audioSupplier}</td>
                        <td>${serviceRequest.requestStatus}</td>
                        <td>${serviceRequest.paymentStatus}</td>
                    </tr>
                </c:forEach>
            <%} %>
        </table>
        <!-- if there is no serviceRequests  -->
        <c:choose>
            <c:when test="${empty serviceRequests}">
                <h3 style="text-align: center;">No service requests found</h3>
            </c:when>
        </c:choose>

        <div id="popupModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2>Service Request Details</h2>
                <div class="details">
                    <label>Start Date:</label>
                    <span id="startDate"></span>
                    <br />

                    <label>Deadline:</label>
                    <span id="deadline"></span>
                    <br />

                    <label>Status:</label>
                    <span id="status"></span>
                    <br />

                    <label>Comments:</label>
                    <span id="comments"></span>
                    <br />

                    <label>Feedback:</label>
                    <span id="feedback"></span>
                    <br />

                    <!-- <label>Astrologer ID:</label>
                    <span id="astrologerId"></span>
                    <br /> -->

                    <label>Feedback Image:</label>
                    <img id="feedbackImage" src="" alt="Feedback Image" style="width: 100%;">
                    <br />
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    function openModal(id, startDate, deadline, status, comments, feedback, astrologerId, feedbackImage) {
        document.getElementById("popupModal").style.display = "block";

        document.getElementById("startDate").innerHTML = startDate;
        document.getElementById("deadline").innerHTML = deadline;
        document.getElementById("status").innerHTML = status;
        document.getElementById("comments").innerHTML = comments ? comments : "N/A";
        document.getElementById("feedback").innerHTML = feedback ? feedback : "N/A";
        document.getElementById("feedbackImage").src = feedbackImage;
        /* document.getElementById("astrologerId").innerHTML = astrologerId; */
    }

    function closeModal() {
        document.getElementById("popupModal").style.display = "none";
    }
</script>

</html>