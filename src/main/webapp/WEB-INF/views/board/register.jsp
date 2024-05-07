<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>
           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시글 등록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           	Board Register
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form role="form" action="/board/register" method="post">
                                        <div class="form-group">
                                            <label>제목</label>
                                            <input class="form-control" name="title" required>
                                           
                                        </div>                                                                              
                                       
                                        <div class="form-group">
                                            <label>내용</label>
                                            <textarea class="form-control" rows="6" name="content" required></textarea>
                                        </div>
                                        
                                        <div class="form-group">
                                            <div class="form-group">
                                            <label>작성자</label>
                                            <input class="form-control" placeholder="이름 입력" name="writer" required>
                                        </div>
                                      
                                        </div>
                                        <button type="submit" class="btn btn-default">등록</button>
                                        <button type="reset" class="btn btn-default">취소</button>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            
            <%@ include file="../includes/footer.jsp" %>