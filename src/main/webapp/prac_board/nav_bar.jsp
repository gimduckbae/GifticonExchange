<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <link rel="stylesheet" href="main_page.css">

    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</head>

<body>
    <!-- 상단 네비바 -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <img src="../2nd_project/images/아이콘.png" id="icon">
            <a class="navbar-brand" href="#">이지콘</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link nav-menu" aria-current="page" href="#">홈</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-menu" href="#">랭킹</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-menu" href="#">브랜드</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-menu" href="#">선물함</a>
                    </li>
                </ul>
                <form class="d-flex" role="search">
                    <input class="form-control" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn" type="submit"><img src="../search.svg" alt=""></button>
                </form>
            </div>
        </div>
    </nav>

    <!-- 작업공간 workspace 안에서 -->
    <div class="container work-space" style="margin-top: 100px;">
        <div class="card mb-3" style="max-width: 100%; border-style: none;">
            <div class="row g-0">
                <div class="col-md-4">

                </div>
                <div class="col-md-8">
                    <div class="card-body">
                    </div>
                </div>
            </div>
        </div>
    </div>

    





</body>

</html>