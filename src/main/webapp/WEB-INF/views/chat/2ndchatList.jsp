<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

   
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chatting</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
    <link rel="stylesheet" href="/resources/css/styles-dark.min.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7cfe0a988351b935c1deefc425b4cc46"></script>
    <script
    src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
    <script
   src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
   

 
</head>

<body>
	<!-- <c:import url="../template/header.jsp"></c:import> -->

    <!-- Layout -->
    <div class="layout">
        <!-- Navigation -->
        <div class="navigation navbar border-end h-100 py-6">
            <!-- Nav -->
            <ul class="nav nav-pills" role="tablist">
                <!-- Friends -->
                <li class="nav-item mb-5" role="presentation">
                    <a class="nav-link" data-bs-toggle="pill" href="#friends-tab" role="tab" aria-selected="false" title="Friends">
                        <i class="ri-group-line"></i>
                    </a>
                </li>
                <!-- Friends -->
                <!-- Chats -->
                <li class="nav-item mb-5" role="presentation">
                    <a class="nav-link active" data-bs-toggle="pill" href="#chats-tab" role="tab" aria-selected="true" title="Chats">
                        <i class="ri-chat-3-line"></i>
                    </a>
                </li>
                <!-- Chats -->
            </ul>
            <!-- Nav -->
        </div>
        <!-- Navigation -->
        <!-- Sidebar -->
        <div class="sidebar border-end overflow-hidden h-100">
            <div class="tab-content h-100">
                <!-- Friends Tab -->
                <div class="tab-pane fade h-100" id="friends-tab" role="tabpanel">
                    <div class="d-flex flex-column h-100">
                        <!-- Tab Header -->
                        <div class="tab-header d-flex align-items-center border-bottom">
                            <ul class="d-flex justify-content-between align-items-center list-unstyled w-100 mx-4 mb-0">
                                <!-- Title -->
                                <li>
                                    <h3 class="mb-0">Friends</h3>
                                </li>
                                <!-- Title -->

                                <!-- Buttons -->
                                <li>
                                    <ul class="list-inline">
                                        <!-- Menu Button -->
                                        <li class="list-inline-item">
                                            <button type="button" class="navigation-toggle btn btn-secondary btn-icon d-xl-none">
                                                <i class="ri-menu-line"></i>
                                            </button>
                                        </li>
                                        <!-- Menu Button -->
                                    </ul>
                                </li>
                                <!-- Buttons -->
                            </ul>
                        </div>
                        <!-- Tab Header -->
                        <!-- Tab Content -->
                        <div class="hide-scrollbar h-100">
                            <div class="m-4">
                                <!-- Contact List A -->
                                <div>
                                    <!--  Friends List -->
                                    <ul class="list-unstyled" id="userList">
                                        <!-- Chat Link -->
                                   
                                   
                                                    
                                        <!-- Chat Link -->
                                    </ul>
                                    <!--  Friends List -->
                                </div>
                                <!-- Contact List A -->

                            </div>
                        </div>
                        <!-- Tab Content -->
                    </div>
                </div>
                <!-- Friends Tab -->
                <!-- Chats Tab -->
                <div class="tab-pane fade show active h-100" id="chats-tab" role="tabpanel">
                    <div class="d-flex flex-column h-100">
                        <!-- Tab Header -->
                        <div class="tab-header d-flex align-items-center border-bottom">
                            <ul class="d-flex justify-content-between align-items-center list-unstyled w-100 mx-4 mb-0">
                                <!-- Title -->
                                <li>
                                    <h3 class="mb-0">Chats</h3>
                                </li>
                                <!-- Title -->

                                <!-- Buttons -->
                                <li>
                                    <ul class="list-inline">
                                        <!-- Menu Button -->
                                        <li class="list-inline-item">
                                            <button type="button" class="navigation-toggle btn btn-secondary btn-icon d-xl-none">
                                                <i class="ri-menu-line"></i>
                                            </button>
                                        </li>
                                        <!-- Menu Button -->                                        
                                    </ul>
                                </li>
                                <!-- Buttons -->
                            </ul>
                        </div>
                        <!-- Tab Header -->


                        <!-- Segmented Control -->
                        <div class="text-center mb-3">
                            <ul class="nav nav-pills nav-segmented" id="pills-tab" role="tablist">

                            </ul>
                        </div>
                        <!-- Segmented Control -->

                        <!-- Tab Content -->
                        <div class="hide-scrollbar h-100">
                            <div class="tab-content m-4 mt-1">
                                <!-- Direct Chats Tab -->
                                <div class="tab-pane fade show active" id="direct-tab" role="tabpanel">
                                    <ul class="list-unstyled js-contact-list mb-0">
                                        <!-- Chat Link 1 -->
                                        <li class="card contact-item active mb-3">
                                            <div class="contact-link"></div>
                                            <div class="card-body">
                                                <div class="d-flex align-items-center">

                                                    <!-- Content -->
                                                    <div class="flex-grow-1 overflow-hidden">
                                                        <div class="d-flex align-items-center mb-1">
                                                            <h5 class="text-truncate mb-0 me-auto">Ariel Martinez</h5>
                                                            <p class="small text-muted text-nowrap ms-4 mb-0">8:12 AM</p>
                                                        </div>
                                                        <div class="d-flex align-items-center">
                                                            <div class="line-clamp me-auto">Yes, I want to participate in the
                                                                project.
                                                            </div>
                                                            <span class="badge rounded-pill bg-primary ms-2">2</span>
                                                        </div>
                                                    </div>
                                                    <!-- Content -->
                                                </div>
                                            </div>
                                        </li>
                                        <!-- Chat Link 1 -->

                                    </ul>
                                </div>
                                <!-- Direct Chats Tab -->

                            </div>
                        </div>
                        <!-- Tab Content -->
                    </div>
                </div>
                <!-- Chats Tab -->

            </div>
        </div>
        <!-- Sidebar -->

        <div id="map" class="h-100 w-100"></div>
        <!-- Main Content -->
        <div class="main main-visible overflow-hidden h-100">
            
        </div>
        <!-- Main Content -->
    </div>
    <!-- Layout -->
    

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/js/app.min.js"></script>
    <script src="/resources/js/chatList.js"></script>
    <!-- Scripts -->
    <c:import url="../template/common_js.jsp"></c:import>
    <script >
        id='${member.memberId}'
    </script>
</body>

</html>