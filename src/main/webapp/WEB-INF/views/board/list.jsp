<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시글 목록</h1>
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
					class="btn-primary pull-right btn-xs btn">게시글 등록</button>
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
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>

					<c:forEach var="board" items="${list }">
						<tr>
							<td>${board.bno }</td>
							<%-- <td><a href="/board/get?bno=${board.bno}">${board.title }</a></td> --%>
							<!-- 상세 조회에서 페이지 이동을 위한 수정 -->
							<td>
							  <a class='move' href="${board.bno}">${board.title }</a>
							</td>
							
							<td>${board.writer }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updatedate }" /></td>
						</tr>
					</c:forEach>
				</table>
				<!-- /.table-responsive -->
				
				<!-- 검색창 -->
				<div class='row'>
				  <div class="col-lg-12">
				    <form id="searchForm" action="/board/list" method="get">
				      <select name="type">
				        <option value="${pageMaker.cri.type == null?'selected':''}" >--</option>
				        <option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected':'' }"/>  >제목</option>
				        <option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected':'' }"/> >내용</option>
				        <option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected':'' }"/> >작성자</option>
				        <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':'' }"/>>제목 or 내용</option>
				        <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':'' }"/>>제목 or 작성자</option>
				        <option value="CW" <c:out value="${pageMaker.cri.type eq 'CW' ? 'selected':'' }"/>>작성자 or 내용</option>
				        <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW' ? 'selected':'' }"/>>제목 or 내용 or작성자</option>
				      </select>
				      <input type="text" name="keyword" value="${pageMaker.cri.keyword}">
				      <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				      <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			
				      <button class="btn btn-default">검색</button>
				    </form>
				  </div>
				</div>
				
				<!-- page -->
				
				<div class="dataTables_paginate paging_simple_numbers"
					id="dataTables-example_paginate">
					<ul class="pagination">
					<li class="paginate_button previous"
							aria-controls="dataTables-example" tabindex="0"
							id="dataTables-example_previous"><a href="${pageMaker.first}">처음으로</a></li>
					
					   <c:if test="${pageMaker.prev }">
						<li class="paginate_button previous"
							aria-controls="dataTables-example" tabindex="0"
							id="dataTables-example_previous"><a href="${pageMaker.startPage - 1 }">Previous</a></li>
					    </c:if>		
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="paginate_button ${pageMaker.cri.pageNum==num?'active':'' }" >
							<a href="${num }">${num }</a></li>
						</c:forEach>	
						<c:if test="${pageMaker.next }">
							<li class="paginate_button next"
								aria-controls="dataTables-example" tabindex="0"
								id="dataTables-example_next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
					    </c:if>
					    <li class="paginate_button previous"
							aria-controls="dataTables-example" tabindex="0"
							id="dataTables-example_previous"><a href="${pageMaker.last}">마지막으로</a></li>
					</ul>
				</div>
				
				<!-- 페이지 처리를 위한 form tag 추가 -->
				<form id='actionForm' action="/board/list" method='get'>
				  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				  <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				  	      <input type="hidden" name="type" value="${pageMaker.cri.type }">
				       <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
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
					self.location = "/board/register";
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
							"<input type='hidden' name='bno' value='" 
							+ $(this).attr("href") + "'>");
					actionForm.attr("action", "/board/get");
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