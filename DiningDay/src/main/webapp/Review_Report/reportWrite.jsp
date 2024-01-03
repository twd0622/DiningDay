<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>DiningDay</title> 
</head>

<%@ include file="/Template/header.jsp"%> 
	<!-- main은 속성 값은 왠만하면 건들지x -->
	<main style="display: flex; align-items: center; text-align: center; padding: 120px 50px 20px 50px;">
		<!-- 예시div style속성 값 조절해서 사용! -->
		<div class="mainContainer"
			style="width: 100%; height: 850px; background: white;">
			<form method="post" action="reportWritePro.re" enctype="multipart/form-data">
				<h4 style="text-align: left; padding-top: 20px;">&lt; 식당 신고 작성 &gt;</h4>
				<hr>
				<div class="container" style="padding: 0 7% 0 7%;">
					<table class="table table-hover">
						<tbody>
							<tr>
								<td>
									<input type="hidden" name="cus_no" value="${sessionScope.CUS_NO}">
									<input type="text" class="form-control"
									placeholder="제목명" name="srep_subject" maxlength="40">
								</td>
							</tr>
							<tr>
								<td>
									<input type="hidden" name="store_no" value="${requestScope.STORE_NO}">
									<input type="text" class="form-control"
									value="${requestScope.STORE_NAME}" name="store_name" maxlength="40" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td><input type="file" class="form-control"
									placeholder="사진첨부파일" name="srep_file" maxlength="40"></td>
							</tr>
							<tr>
								<td><textarea type="text" class="form-control"
										placeholder="신고내용" name="srep_content" maxlength="1024"
										style="height: 400px;"></textarea></td>
							</tr>
						</tbody>
					</table>
					<hr>
					<input type="submit" class="btn btn-outline-success" value="신고">
					<input type="button" class="btn btn-outline-dark" value="취소" onclick="window.history.back()">
				</div>
			</form>
		</div>
	</main>
<%@ include file="/Template/footer.jsp"%>
</html> 