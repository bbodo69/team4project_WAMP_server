<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<!-- ajax 글 등록 :  https://gangnam-americano.tistory.com/32 -->
<body>
<div class="container-fluid">
    <form id="commentForm" name="commentForm" method="post">  
    	<input type="hidden" id= "num" name="num" value="<%=request.getParameter("num")%>">

<!-- graph 부분 -->   
	    <div id="ajax_graph" class="container-fluid">
		</div>
<!-- /graph 부분 -->  
		<br>     
		<p>
			<a class="btn btn-primary " data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
				투표하기 / 글쓰기
			</a>
		</p>
		<div class="collapse" id="collapseExample">
			<div class="card card-body">
   				<br><br>
		        <div>
		            <div>
		                <span><strong>의견</strong></span>
		            </div>
		            <div>
		                <table class="table">                    
		                    <tr>
		                        <td>
									<div class="form-group green-border-focus">
		                           		<textarea class="form-control" style="width: 100% "  rows="5" id="content" name="content" placeholder="글을 입력해주세요."></textarea>
		                           	</div>
		                            <br>
		                            <div class="row text-center" style="width: 100%">
		                            	<div style="width: 30%; float:none; margin:0 auto" >
		                            		<h3>찬성/반대 선택</h3>
		<!-- radio button 추가 -->     
											<div id="voteForm" class="container-fluid">
											</div>
										</div>
									</div>
		<!-- 
		<a class="btn btn-primary " data-toggle="collapse" href="#collapseReple" role="button" aria-expanded="false" aria-controls="collapseExample"></a>
		<div class="collapse" id="collapseReple"><div class="form-group green-border-focus"><textarea class="form-control" style="width: 100% "  rows="5" id="content" name="content" placeholder="글을 입력해주세요."></textarea></div></div>
		
		
		
									<div id="voteForm" class="container-fluid">
									<p><strong>찬반 투표</strong></p>
							            <c:if test='${check == 0}'>                       
								            <label class='radio-inline'>
								            	<input type='radio' name='inlineRadioOptions' id='inlineRadio4' value='1'> 찬성
								            </label>
								            <label class='radio-inline'>
								            	<input type='radio' name='inlineRadioOptions' id='inlineRadio5' value='-1'> 반대
								            </label>
							            </c:if>
							            <c:if test='${check == 1}'>
							            	<h3>투표 완료</h3>    
							            </c:if>
		        					</div>
		 -->        					
		<!-- /radio button 추가 -->                            
		                            <div>
		                            	<c:if test="${empty sessionScope.sId}">
		                                	<a href='#' onClick="alertLogin();" class="btn pull-right btn-success">등록</a>
		                                </c:if>
		                                <c:if test="${not empty sessionScope.sId}">
		                                	<a href='#' onClick="fn_comment(); default_text(); getGraphData(); voteCheck();" class="btn pull-right btn-success">등록</a>
		                                </c:if>
		                            </div>
		                        </td>
		                    </tr>
		                </table>
		            </div>
		        </div>
			</div>
		</div>                         
    </form>
</div>
 <div class="container-fluid">
 	
 	 	
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList" class="container-fluid">
        </div>	
        
<!-- pagination -->        
<!-- =============================================pagination ============================================= -->
				<div class="row text-center" style="width: 100%">
					<div style="width: 30%; float:none; margin:0 auto" >	
						<div id="div_pageNumber" class="pagination" align="center">
							<c:if test="${count > 0 }">
								<fmt:parseNumber var="res" value="${count/pageSize}" integerOnly="true" />
								<c:set var="pageCount" value="${res + (count % pageSize == 0 ? 0 : 1)}" />
								<c:set var="pageBlock" value="10" />
								<fmt:parseNumber var="result" value="${currentPage/pageBlock}" integerOnly="true" />
								<fmt:parseNumber var="startPage" value="${result * pageBlock +1}" />
								<fmt:parseNumber var="endPage" value="${startPage + pageBlock - 1}" />
								<c:if test="${endPage > pageCount}" >
									<c:set var="endPage" value="${pageCount}" />
								</c:if>										
								<nav>
									<ul class="pagination">
									    <li>
											<a onClick="" aria-label="Previous">
								        		<span aria-hidden="true">&laquo;</span>
								      		</a>
								    	</li>		
										<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1" >							
											<li><a class="page-numbers" onClick="getCommentList(${i});">${i}&nbsp;</a></li>							
										</c:forEach>
										<li>
											<a onClick="" aria-label="Next">
								        		<span aria-hidden="true">&raquo;</span>
								    		</a>
								    	</li>
									</ul>
								</nav>							
							</c:if>			
						</div>
					</div>
				</div>
<!-- ================================================================================================== -->    
<!-- pagination -->    
	<div class="nkoBox">아라비아나이트완전짜증나는구만</div>    
       	
    </form>
</div>
 
<script>

function choice(){
	alert("하나만 선택 가능")
}

function alertLogin(){
	alert("로그인이 필요한 서비스")
}

function error(){
	console.log('error');
}

function default_text(){		// 글 내용 초기화 하기
	$('#content').val('');	
}

function reReple(num, ref, step, level){
	
	alert($("#repleForm"+num).serialize());
	var jsonData = $("#repleForm"+num).serialize()+"&num="+num+"&ref="+ref+"&step="+step+"&level="+level;
	alert(jsonData);

	$.ajax({
        type:'POST',
        url : "<c:url value='/debate/reReple.do'/>",
        data:jsonData,         
        success : function(data){
            if(data=="success")
            {
                getCommentList();
            }
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//			alert("빈칸을 채워주세요");
       }
    });
	
}

function deleteReple(num){			// 댓글 지워주기
	
	var jsonData = "&num="+num;
	
    $.ajax({
        type:'POST',
        url : "<c:url value='/debate/debateRepleDelete.do'/>",
        data:jsonData,         
//jQuery에서는 serialize() 라는 메소드를 제공하는데, 해당 메소드를 사용하면 Form 태그내의 항목들을 자동으로 읽어와
//https://fruitdev.tistory.com/174
        success : function(data){
            if(data=="success")
            {
                getCommentList();
            }
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//			alert("빈칸을 채워주세요");
       }
    });
	getGraphData();
}



function fn_comment(){			// 댓글 등록하기(Ajax) 
	
    $.ajax({
        type:'POST',
        url : "<c:url value='/debate/debateReplePro.do'/>",
        data:$("#commentForm").serialize(),         
//jQuery에서는 serialize() 라는 메소드를 제공하는데, 해당 메소드를 사용하면 Form 태그내의 항목들을 자동으로 읽어와
//https://fruitdev.tistory.com/174
        success : function(data){
            if(data=="success")
            {
                getCommentList();
            }
        },
        error:function(request,status,error){
//            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("빈칸을 채워주세요");
       }
    });
	getGraphData();
}

function like(num, ref){			 
	
	var jsonData = "num="+num+"&ref="+ref;
    $.ajax({
        type:'POST',
        url : "<c:url value='/debate/like.do'/>",
        data:jsonData,
        success : function(data){
            if(data=="success")
            {
                getCommentList();
            }
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
    });
}

function unlike(num, ref){			 
	
	var jsonData = "num="+num+"&ref="+ref;
    $.ajax({
        type:'POST',
        url : "<c:url value='/debate/unlike.do'/>",
        data:jsonData,
        success : function(data){
            if(data=="success")
            {
                getCommentList();
            }
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
    });
}

function likeCancel(num, ref){			 
	
	var jsonData = "num="+num+"&ref="+ref;
    $.ajax({
        type:'POST',
        url : "<c:url value='/debate/likeCancel.do'/>",
        data:jsonData,
        success : function(data){
            if(data=="success")
            {
                getCommentList();
            }
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
    });
}

function unlikeCancel(num, ref){			 
	
	var jsonData = "num="+num+"&ref="+ref;
    $.ajax({
        type:'POST',
        url : "<c:url value='/debate/unlikeCancel.do'/>",
        data:jsonData,
        success : function(data){
            if(data=="success")
            {
                getCommentList();
            }
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
    });
}

$(function(){				// 시작구문  '$(document)ready.function(){}' 와도 같음
	getCommentList();
	voteCheck();
	getGraphData();
	topView();
});
// https://www.youtube.com/watch?v=CE-6QdHI3Ug 변수 넘기는거 참고
function getCommentList(pageNum){
	if (pageNum == null){
		pageNum = 1;
		
	}
	var jsonData = $("#num").serialize()+"&pageNum="+pageNum;	// 데이터 넘겨주기
	
	var reple = "";
	
    $.ajax({        
        type:'POST',
        url : "<c:url value='/debate/debateRepleList.do'/>",
        data:jsonData,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        dataType :"json",
        success : function(data){   
        	
            var html = "";
            var list_length = data.length;
            var vote = "";
            if((data.length > 0) && (${sessionScope.sId != "admin"}) && (${sessionScope.sId != null})) {
                for(i=0; i<data.length; i++){
                	
                	// 찬성 반대 여부 확인,relevel, restep 구분해주기
                	if(data[i].ok == 1){
						html += "<blockquote>";
					}else if(data[i].ok == -1){
						html += "<blockquote class='blockquote-reverse'>";
					}else{
						html += "<blockquote><footer>";
                	}
                	
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성날짜 =  "+ data[i].reg + "</strong></h6>";
                    //좋아요 여부 확인
                    if((data[i].check != 0) && (data[i].check == 1)){
                    	html += "<a href='#' onclick='choice()' class='btn pull-right btn-success'>비공감" + data[i].unlikeCount + "</a>";
                        html += "<a href='#' onClick='likeCancel(" + data[i].num + "," + data[i].ref + ")' class='btn pull-right btn-success'>공감 취소" + data[i].likeCount + "</a>";
                        html += "<tr><td class='listth'>" + data[i].content;
                       
                        html += "<form id='repleForm" + data[i].num + "' name='repleForm" + data[i].num + "'>";
                        html += '<a class="btn pull-right btn-success" data-toggle="collapse" href="#collapseReple' + data[i].num + '" role="button" aria-expanded="false" aria-controls="collapseExample">reple</a><div class="collapse" id="collapseReple' + data[i].num + '"><div class="form-group green-border-focus"><textarea class="form-control' + data[i].num + '" style="width: 100% "  rows="5" id="content" name="content" placeholder="글을 입력해주세요."></textarea>';
                        html += '<a class="btn pull-right btn-success" onClick="reReple(' + data[i].num + ',' + data[i].ref + ',' + data[i].re_step + ',' + data[i].re_level + ')">확인</a></div></div></td></tr>';
                        html += "</form>";
                        
                        html += "</table></div>";
                        html += "</div>";
                    }else if((data[i].check != 0) && (data[i].check == -1)){
                    	html += "<a href='#' onClick='unlikeCancel(" + data[i].num + "," + data[i].ref + ")' class='btn pull-right btn-success'>반대 취소" + data[i].unlikeCount + "</a>";
                    	html += "<a href='#' onclick='choice()' class='btn pull-right btn-success'>공감" + data[i].likeCount + "</a>";
                        html += "<tr><td class='listth'>" + data[i].content;
                        
                        html += "<form id='repleForm" + data[i].num + "' name='repleForm" + data[i].num + "'>";
                        html += '<a class="btn pull-right btn-success" data-toggle="collapse" href="#collapseReple' + data[i].num + '" role="button" aria-expanded="false" aria-controls="collapseExample">reple</a><div class="collapse" id="collapseReple' + data[i].num + '"><div class="form-group green-border-focus"><textarea class="form-control' + data[i].num + '" style="width: 100% "  rows="5" id="content" name="content" placeholder="글을 입력해주세요."></textarea>';
                        html += '<a class="btn pull-right btn-success" onClick="reReple(' + data[i].num + ',' + data[i].ref + ',' + data[i].re_step + ',' + data[i].re_level + ')">확인</a></div></div></td></tr>';
                        html += "</form>";
                        
                        html += "</table></div>";
                        html += "</div>";
                    }else {
                  	//좋아요 여부 확인
	                html += "<a href='#' onClick='unlike(" + data[i].num + "," + data[i].ref + ")' class='btn pull-right btn-success'>비공감" + data[i].unlikeCount + "</a>";
                    html += "<a href='#' onClick='like(" + data[i].num + "," + data[i].ref + ")' class='btn pull-right btn-success'>공감" + data[i].likeCount + "</a>";
                    html += "<tr><td class='listth'>" + data[i].content;
                    
                    html += "<form id='repleForm" + data[i].num + "' name='repleForm" + data[i].num + "'>";
                    html += '<a class="btn pull-right btn-success" data-toggle="collapse" href="#collapseReple' + data[i].num + '" role="button" aria-expanded="false" aria-controls="collapseExample">reple</a><div class="collapse" id="collapseReple' + data[i].num + '"><div class="form-group green-border-focus"><textarea class="form-control' + data[i].num + '" style="width: 100% "  rows="5" id="content" name="content" placeholder="글을 입력해주세요."></textarea>';
                    html += '<a class="btn pull-right btn-success" onClick="reReple(' + data[i].num + ',' + data[i].ref + ',' + data[i].re_step + ',' + data[i].re_level + ')">확인</a></div></div></td></tr>';
                    html += "</form>";
                    
                    html += "</table></div>";
                    html += "</div>";
                    }
                    
                    if(data[i].ok == 1 || data[i].ok == -1){
                    	html += "</blockquote>";
                    }else{
                    	html += "</footer></blockquote>";
                    }
                	
                }
            }
            if((data.length > 0) && (${sessionScope.sId == "admin"})){
				for(i=0; i<data.length; i++){
					// relevel, restep 구분해주기
					if(data[i].ok == 1){
						html += "<blockquote>";
					}else if(data[i].ok == -1){
						html += "<blockquote class='blockquote-reverse'>";
					}else{
						html += "<blockquote><footer>";
					}
					
					
	                html += "<form id='repleForm" + data[i].num + "' name='repleForm" + data[i].num + "'>";
	            	html += "<div>";
	                html += "<div><table class='table'><h6><strong>"+data[i].writer+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성날짜 =  "+ data[i].reg +  "</strong></h6>";
	              	//좋아요 여부 확인
	                
	              	//좋아요 여부 확인
	                html += "<a href='#' onClick='unlike(" + data[i].num + "," + data[i].ref + ")' class='btn pull-right btn-success'>비공감" + data[i].unlikeCount + "</a>";
	                html += "<a href='#' onClick='like(" + data[i].num + "," + data[i].ref + ")' class='btn pull-right btn-success'>공감" + data[i].likeCount + "</a>";
	                html += "<tr><td class='listth'>" + data[i].content + "<a href='#' onClick='deleteReple(" + data[i].num + ")' class='btn pull-right btn-success'>삭제</a>";
	                
                    html += '<a class="btn pull-right btn-success" data-toggle="collapse" href="#collapseReple' + data[i].num + '" role="button" aria-expanded="false" aria-controls="collapseExample">reple</a><div class="collapse" id="collapseReple' + data[i].num + '"><div class="form-group green-border-focus"><textarea class="form-control' + data[i].num + '" style="width: 100% "  rows="5" id="content" name="content" placeholder="글을 입력해주세요."></textarea>';
                    html += '<a class="btn pull-right btn-success" onClick="reReple(' + data[i].num + ',' + data[i].ref + ',' + data[i].re_step + ',' + data[i].re_level + ')">확인</a></div></div></td></tr>';
	                
	                html += "</table></div>";
	                html += "</div>";
                    html += "</form>";
                    
                    if(data[i].ok == 1 || data[i].ok == -1){
                    	html += "</blockquote>";
                    }else{
                    	html += "</footer></blockquote>";
                    }
                    
				}
            }

            if((data.length > 0) && (${sessionScope.sId == null})){

            	for(i=0; i<data.length; i++){
                	if(data[i].ok == 1){
						html += "<blockquote>";
					}else if(data[i].ok == -1){
						html += "<blockquote class='blockquote-reverse'>";
					}else{
						html += "<blockquote><footer>";
					}
                    html += "";
                    html += "<div><strong>"+data[i].writer+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성날짜 =  "+ data[i].reg + "</h6>";
                    html += "</div>";
	                html += "<div><a href='#' onClick='alertLogin()' >비공감" + data[i].unlikeCount + "</a>";
                    html += "<a href='#' onClick='alertLogin()' >공감" + data[i].likeCount + "</a></div>";
                    html += "<div style=''>"+data[i].content+"</div>";
                    
                    html += "<form id='repleForm" + data[i].num + "' name='repleForm" + data[i].num + "'>";
                    html += '<a data-toggle="collapse" href="#collapseReple' + data[i].num + '" role="button" aria-expanded="false" aria-controls="collapseExample">reple</a><div class="collapse" id="collapseReple' + data[i].num + '"><div class="form-group green-border-focus"><textarea class="form-control' + data[i].num + '" style="width: 100% "  rows="5" id="content" name="content" placeholder="글을 입력해주세요."></textarea>';
                    html += '<a onClick="reReple(' + data[i].num + ',' + data[i].ref + ',' + data[i].re_step + ',' + data[i].re_level + ')">확인</a></div></div></td></tr>';
                    html += "</form>";
                    
                    if(data[i].ok == 1 || data[i].ok == -1){
                    	html += "</blockquote>";
                    }else{
                    	html += "</footer></blockquote>";
                    }
                    
                }
                
                
            }else if(!(data.length > 0)){
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            $("#list_length").html(list_length);
            $("#commentList").html(html);
        },
        error:function(request,status,error){
        	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
        }
    });
}


// ================================== graph
/* */
function getGraphData(){
	
	var jsonData = $("#num").serialize();	// 데이터 넘겨주기
	
    $.ajax({        
        type:'POST',
        url : "<c:url value='/debate/debateGetGraphData.do'/>",
        data:jsonData,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        dataType :"json",
        success : function(data){        
            var graph = "";
            if(data[0].ok != 0 || data[0].Nok != 0){ 	
	            graph += '<div class="row">';
	            graph += '<div class="col-md-12" id="graph">';
	            graph += '<div class="widget widget-black shadow">';
	            graph += '<div class="widget-title">찬성 VS 반대</div>';
	            graph += '<div style="clear: both;"></div>';
	            graph += '<div class="" style="max-height: 5px;">';
	            graph += '<div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" style="width:' + data[0].ok + '%">';
	            graph += '<strong style="color: black;">찬성' + data[0].ok + '%</strong>';
	            graph += '</div>';
	            graph += '<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" style="width:' + data[0].Nok + '%">';
	            graph += '<strong style="color: black;">반대' + data[0].Nok + ' %</strong>';
	            graph += '</div>';
	            graph += '</div>';
	            graph += '<div class="widget-controls hidden">';
	            graph += '<a href="#" class="widget-control-right"><span class="fa fa-times"></span></a>';
	            graph += '</div></div></div></div>';
			}else{
            	graph += "<div>";
            	graph += "<div><table class='table'><h6><strong>등록된 투표가 없습니다.</strong></h6>";
            	graph += "</table></div>";
            	graph += "</div>";
            }
            $("#ajax_graph").html(graph);
        },
        error:function(request,status,error){
        	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
        }
    });
}

// ==================================  /graph
// 투표 여부 확인
function voteCheck(){

	var jsonData = $("#num").serialize();	// 데이터 넘겨주기
	
    $.ajax({        
        type:'POST',
        url : "<c:url value='/debate/voteCheck.do'/>",
        data:jsonData,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        dataType :"json",
        success : function(data){        
            var vote = "";
            if(data[0].check == 0){               	
	            vote += '<p><strong>찬반 투표</strong></p>';
	            vote += '<label class="radio-inline">';
	            vote += '<input type="radio" name="inlineRadioOptions" id="inlineRadio4" value="1"> 찬성';
	            vote += '</label>';
	            vote += '<label class="radio-inline">';
	            vote += '<input type="radio" name="inlineRadioOptions" id="inlineRadio5" value="-1"> 반대';
	            vote += '</label>';
            }else if(${sessionScope.sId == "admin"}){
            	vote += '<p><strong>찬반 투표</strong></p>';
	            vote += '<label class="radio-inline">';
	            vote += '<input type="radio" name="inlineRadioOptions" id="inlineRadio4" value="1"> 찬성';
	            vote += '</label>';
	            vote += '<label class="radio-inline">';
	            vote += '<input type="radio" name="inlineRadioOptions" id="inlineRadio5" value="-1"> 반대';
	            vote += '</label>';
            }else{
	            vote += '<h3>투표 완료</h3>';
            }
            $("#voteForm").html(vote);
        },
        error:function(request,status,error){
        	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
        }
    });
}
// !투표 여부 확인


</script>
</body>
</html>