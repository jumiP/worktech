<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>공지사항 상세</title>

    <!-- CSS Libraries -->
    <link rel="stylesheet" href="resources/dist/assets/modules/summernote/summernote-bs4.css">
    <link rel="stylesheet" href="resources/dist/assets/modules/codemirror/lib/codemirror.css">
    <link rel="stylesheet" href="resources/dist/assets/modules/codemirror/theme/duotone-dark.css">
    <link rel="stylesheet" href="resources/dist/assets/modules/jquery-selectric/selectric.css">

    <style>
        .inputData {
            border: 1px #dff5fa solid;
            padding: 10px;
            border-radius: 5px;
            text-align: left;
        }

        .half-col {
            display: inline-block;
            width: 49%;
        }

        .left-item {
            margin-right: 19px;
        }

        :disabled,
        input[type="text"]:disabled,
        input[type="date"]:disabled,
        input[type="number"]:disabled {
            background: white;
        }
    </style>
</head>

<body>
    <c:import url="../common/headerAdmin.jsp" />
    <!-- Main Content -->
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>공지사항 상세</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active">
                        <a href="#">게시판</a>
                    </div>
                    <div class="breadcrumb-item">공지사항 게시판</div>
                </div>
            </div>

            <div class="section-body">
                <h2 class="section-title">공지사항 상세</h2>
                <div class="row">
                    <div class="col-12 col-md-12 col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-group">
                                    <label>글 제목</label>
                                    <input type="hidden" name="bNo" value="${ b.bNo }">
                                    <input type="text" class="form-control" name="bTitle" disabled
                                        value="${ b.bTitle }">
                                </div>
                                <div class="form-group half-col left-item">
                                    <label>작성자</label>
                                    <input type="text" class="form-control" name="name" disabled value="${ b.name }">
                                    <input type="hidden" name="bWriter" value="${ b.bWriter }">
                                </div>
                                <div class="form-group half-col">
                                    <label>작성일</label>
                                    <input type="date" class="form-control" name="bDate" disabled
                                        value="${ b.bDate }">
                                </div>
                                <div class="form-group">
                                    <label>조회수</label>
                                    <input type="number" class="form-control" name="bCount" disabled value="${ b.bCount }">
                                </div>
                                <div class="form-group">
                                    <label>작성 내용</label>
                                    <div>
                                        <textarea class="inputData" style="width: 100%; height: 450px;" name="bContent"
                                            disabled>${ b.bContent }</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer text-right">
                                <button class="btn btn-primary mr-1" type="button" onclick="location.href=''">수정</button>
                                <button class="btn btn-danger" type="button">삭제</button>
                                <button class="btn btn-secondary" type="button" onclick="location.href='noticeList.ad'">목록으로</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <c:import url="../common/footer.jsp" />
    <script src="resources/dist/assets/modules/summernote/summernote-bs4.js"></script>
    <script src="resources/dist/assets/modules/codemirror/lib/codemirror.js"></script>
    <script src="resources/dist/assets/modules/codemirror/mode/javascript/javascript.js"></script>
    <script src="resources/dist/assets/modules/jquery-selectric/jquery.selectric.min.js"></script>

</body>

</html>