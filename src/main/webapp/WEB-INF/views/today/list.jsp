<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">TODO 목록</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				Board List Page
				<button id="regBtn" type="button"
					class="btn-primary pull-right btn-xs btn">할 일 등록</button>
			</div>
			<!-- <div class="text-right">
                          <a href="/board/register">게시글등록</a>
                        </div> -->
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>해야하는 일</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
					</thead>

					<c:forEach var="today" items="${today }">
						<tr>
							<td>${today.tno }</td>
							<%-- <td><a href="/board/get?bno=${board.bno}">${board.title }</a></td> --%>
							<!-- 상세 조회에서 페이지 이동을 위한 수정 -->
							<td>
							  <a class='move' href="${today.tno}">${today.title }</a>
							</td>
							<td>${today.writer }</td>
					
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${today.dueDate }" /></td>
						</tr>
					</c:forEach>
				</table>
				<!-- /.table-responsive -->
					<form id='actionForm' action="/board/list" method='get'>

				</form>
				
				
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<script type="text/javascript">
	$(document).ready(
			function() {
				const result = '<c:out value="${result}"/>';

				checkModal(result);

				$("#regBtn").on("click", function() {
					self.location = "/today/register";
				})
				
				const actionForm = $("#actionForm");
				$(".paginate_button a").on("click", function(e){
					e.preventDefault();
					console.log("click임");
					actionForm.find("input[name='pageNum']").val($(this).attr("href"));
					actionForm.submit();
				})
				
				$(".move").on("click", function(e){
					console.log("move임");
					e.preventDefault();
					actionForm.append(
							"<input type='hidden' name='tno' value='" 
							+ $(this).attr("href") + "'>");
					actionForm.attr("action", "/today/get");
					actionForm.submit();
				})
				
				/* 검색 버튼의 이벤트처리 */
				const searchForm = $("#searchForm");
				
				$("#searchForm button").on("click",function(e){
					alert("함수 들어옴");
					if(!searchForm.find("option:selected").val()){
						alert("검색 종류를 선택하세요");
						return false;
					}
					if(!searchForm.find("input[name='keyword']").val()){
						alert("검색어를 입력해주세요");
						return false;
						
						
					}
					
					searchForm.find("input[name='pageNum']").val("1");
					e.preventDefault();
					searchForm.submit();
				
				})
				
				
				
				
				
				
				
				
				
				
				
				

				function checkModal(result) {
					if (result === '') {
						return;
					}

					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글 " + parseInt(result) + " 번이 등록되었습니다.");
					}
					$("#myModal").modal("show");
				}

			});
</script>


<%@include file="../includes/footer.jsp"%>