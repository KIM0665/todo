<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Today Modify</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-8">
		<div class="panel panel-default">
			<div class="panel-heading">Today Modify</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">
						<form role="form" action="/today/modify" method="post" >
							<!-- 페이지 번호 -->

							<div class="form-group">
								<label>번호</label> <input class="form-control" name="tno"
									value="${today.tno}" readonly>
							</div>

							<div class="form-group">
								<label>학습내용</label> <input class="form-control" name="title"
									value="${today.title}" required>
							</div>
							<div class="form-group">
								<label>진도율</label> <input type="number" class="form-control"
									rows="6" name="finished" placeholder="${today.finished}"
									required></input>
								<!-- required 여기부분 체크해줘 -->

							</div>

							<div class="form-group">
								<div class="form-group">
									<label>작성자</label> <input class="form-control" name="writer"
										value="${today.writer}" readonly>
								</div>

								<div class="form-group">
									<div class="form-group">
										<label>학습일자</label> <input class="form-control" readonly
											value="<fmt:formatDate value="${today.dueDate}" type="both" />" />

									</div>



								</div>
								<button type="submit" data-oper="modify" class="btn btn-default">수정</button>
								<button type="submit" data-oper="remove" class="btn btn-danger">삭제</button>
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
	$(document).ready(function() {
		const formObj = $("form");

		$("button").on("click", function(e) {
			e.preventDefault();
			/* 커스텀 속성 */
			const titleValue = $("input[name='title']").val();
			const finishedValue = $("input[name='finished']").val();

			const operation = $(this).data("oper");

			console.log(operation);

			if (operation === "remove") {
				formObj.attr("action", "/today/remove").attr("method", "POST")

			}

			else if (operation === "modify") {

				if (titleValue.trim() === "") {
					alert("제목을 입력하세요.");
					return false; // 폼 제출 중단
				}

				if (finishedValue.trim() === "") {
					alert("진도율을 입력하세요.");
					return false; // 폼 제출 중단
				}
				formObj.attr("action", "/today/modify").attr("method", "POST")
			}

			else if (operation === "list") {
				formObj.attr("action", "/today/list").attr("method", "GET")
				const pageNumTag = $("input[name='pageNum']").clone();
				const amountTag = $("input[name='amount']").clone();
				const typeTag = $("input[name='type']").clone();
				const keyword = $("input[name='keyword']").clone();
				formObj.empty();
				formObj.append(typeTag);
				formObj.append(keyword);
				formObj.append(pageNumTag);
				formObj.append(amountTag);

			}

			formObj.submit();

		})

	})
</script>



<%@ include file="../includes/footer.jsp"%>