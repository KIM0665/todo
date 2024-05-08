<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Today Detail</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-8">
		<div class="panel panel-default">
			<div class="panel-heading">Today Detail</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">



						<div class="form-group">
							<label>번호</label> <input class="form-control" name="tno"
								value="${today.tno}" readonly>
						</div>

						<div class="form-group">
							<label>해야되는 일</label> <input class="form-control" name="title"
								value="${today.title}" readonly>
						</div>
						<div class="form-group">
							<label>학습률</label> <input class="form-control" name="finished"
								readonly value="${today.finished}"></input>
						</div>
						<div class="form-group">
							<label>학습일자</label> <input class="form-control" 
								readonly
								value="<fmt:formatDate value="${today.dueDate}" type="both" />" />


						</div>

						<div class="form-group">
							<div class="form-group">
								<label>작성자</label> <input class="form-control" name="writer"
									value="${today.writer}" readonly>
							</div>

						</div>
						<%--                  <button data-oper="modify" class="btn btn-default"
                                          onclick="location.href='/board/modify?bno=${board.bno }'">글수정</button> --%>
						<!--          <button data-oper="list" class="btn btn-info"
                                          onclick="location.href='/board/list'">목록</button> -->
						<!-- 페이지 처리를 위한 수정 -->


						<button data-oper="modify" class="btn btn-default">글수정</button>
						<button data-oper="list" class="btn btn-info">목록</button>
						<form id="operForm" action="/today/modify" method="get">
							<input type="hidden" id="tno" name="tno" value="${today.tno }">
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

<script type="text/javascript">
	const operForm = $("#operForm");
	


	$("button[data-oper='modify']").on("click", function(e) {
		operForm.attr("action", "/today/modify").submit();

	});
	$("button[data-oper='list']").on("click", function(e) {
		operForm.find("#tno").remove();
		operForm.attr("action", "/today/list").submit();

	});
</script>




<%@ include file="../includes/footer.jsp"%>