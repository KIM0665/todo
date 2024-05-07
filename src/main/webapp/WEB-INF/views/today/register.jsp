<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
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
			<div class="panel-heading">Board Register</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">
						<form role="form" action="/today/register" method="post">
							<div class="form-group">
								<label>학습내용</label> <input class="form-control" name="title">

							</div>

							<div class="form-group">
								<label>진도율</label> <input type="number" class="form-control"
									rows="6" name="finished"></input>
							</div>

							<div class="form-group">
								<div class="form-group">
									<label>작성자</label> <input class="form-control"
										placeholder="이름 입력" name="writer">
								</div>

							</div>
							<button type="submit" data-oper="insert" class="btn btn-default">등록</button>
							<input type="reset" class="btn btn-default" value="취소"></button>
							<button type="submit" data-oper="list" class="btn btn-info">목록</button>
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

	/* window.onload = function() {
		alert("화면이 로드되었습니다!");
		// 추가적인 자바스크립트 코드를 작성할 수 있습니다.
	}; */
	
	
	
	$(document).ready(function() {


		
	
		$("button").on("click", function(e) {
			e.preventDefault();
			const titleValue = $("input[name='title']").val();
			const finishedValue = $("input[name='finished']").val();
			const writerValue = $("input[name='writer']").val();
			const formObj = $("form");
			const operation = $(this).data("oper");
		
			if (operation === "insert") {
				if (titleValue.trim() == "") {
					alert("제목을 입력하세요.");
					return false; // 폼 제출 중단
				}

				if (finishedValue.trim() == "") {
					alert("진도율을 입력하세요.");
					return false; // 폼 제출 중단
				}
				if (writerValue.trim() == "") {
					alert("작성자를 입력하세요.");
					return false; // 폼 제출 중단
				}
				formObj.attr("action", "/today/register").attr("method", "POST");
				
				
				
			} else if (operation === "list") {
				formObj.attr("action", "/today/list").attr("method", "GET");
			}
			formObj.submit();
		});
	});

</script>









<%@ include file="../includes/footer.jsp"%>



