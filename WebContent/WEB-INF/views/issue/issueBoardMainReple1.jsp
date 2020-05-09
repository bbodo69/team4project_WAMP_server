<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<head>
	<title>이슈 게시판 메인 댓글 달기</title>
</head>
<body>
<div class="container-fluid">
    <form id="commentForm<%=request.getParameter("num")%>" name="commentForm<%=request.getParameter("num")%>" method="post">  
    <input type="hidden" id = "num" name="num" value="<%=request.getParameter("num")%>">

<!-- graph 부분 -->    
	<div id="ajax_graph" class="container-fluid"></div>
<!-- /graph 부분 -->        
    <br><br>
        <div>
            <div>
                <span><strong>의견</strong></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: auto"  rows="3" cols="30" id="content" name="content" placeholder="글을 입력해주세요."></textarea>
                            <br>
                            <h3>기사의 정치성향으로 생각되는 것에 투표해주세요.</h3>
<!-- radio button 추가 -->     
							<div id="voteForm" class="container-fluid">
							</div>
<!-- 
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
                            <!--  
                            	<c:if test="${empty sessionScope.sId}">
                                	<a href='#' onClick="alertLogin();" class="btn pull-right btn-success">등록</a>    voteCheck();
                                </c:if>-->
                                <c:if test="${empty sessionScope.sId}">
                                	<a href='#' onClick="fn_comment(); default_text(); getGraphData(); " class="btn pull-right btn-success"><%=request.getParameter("num")%>등록</a>
                                </c:if>
                                <c:if test="${not empty sessionScope.sId}">
                                	<a href='#' onClick="fn_comment(); default_text(); getGraphData(); " class="btn pull-right btn-success"><%=request.getParameter("num")%>등록</a>
                                </c:if>
                            </div>
                        </td>
                    </tr>
                </table>
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
										<li><a class="page-numbers" onClick="getCommentList(${i});" > &nbsp; ${i} &nbsp; </a></li>							
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
<!-- ================================================================================================== -->    
<!-- pagination -->        
       	
    </form>
</div>
 
<script>
/*
script if 문
function test2(){
	if($('#inlineRadio4').serialize() == ""){
		alert("값이 없음")
	}else{
		alert("값있음")
	}
}
*/

function alertLogin(){
	alert("로그인이 필요한 서비스")
}

function error(){
	console.log('error');
}

function default_text(){		// 글 내용 초기화 하기
	$('#content').val('');	
}


function fn_comment(){			// 댓글 등록하기(Ajax) 

	getGraphData();
	
    $.ajax({
        type:'POST',
        url : "<c:url value='/issue/issueBoardMainReplePro.do'/>",
        data:$("#commentForm2").serialize(),         
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
}

$(function(){				// 시작구문  '$(document)ready.function(){}' 와도 같음
	alert($("#commentForm<%=request.getParameter("num")%>").serialize());
	alert($("#commentForm2").serialize());
	getCommentList();
	getGraphData();
	voteCheck();
});
// https://www.youtube.com/watch?v=CE-6QdHI3Ug 변수 넘기는거 참고
function getCommentList(pageNum){
	if (pageNum == null){
		pageNum = 1;
	}
	var jsonData = $("#num").serialize()+"&pageNum="+pageNum;	// 데이터 넘겨주기
	
	console.log($("#num"));
	console.log($("#num").serialize());
	console.log(pageNum);
	console.log(jsonData);
	
    $.ajax({        
        type:'POST',
        url : "<c:url value='/issue/issueBoardMainList.do'/>",
        data:jsonData,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        dataType :"json",
        success : function(data){        
            var html = "";
            var list_length = data.length;
            var vote = "";
            if(data.length > 0){
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].writer+$("#num").serialize()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;time =  "+ data[i].reg + "</strong></h6>";
                    html += "<tr><td class='listth'>" + data[i].content + pageNum + "</td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                }
            } else {
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
        url : "<c:url value='/issue/issueBoardMainGraph.do'/>",
        data:jsonData,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        dataType :"json",
        success : function(data){        
            var graph = "";
            if(data.length > 0){
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

// ==================================
// 투표 여부 확인
<%--
function voteCheck(){

	var jsonData = $("#num").serialize();	// 데이터 넘겨주기
	
    $.ajax({        
        type:'POST',
        url : "<c:url value='/issue/voteCheck.do'/>",
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
            }else{
	            vote += '<h3>투표 완료</h3>';
            }
            $("#voteForm").html(vote);
        },
        error:function(request,status,error){
        	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
        }
    });
}--%>
// !투표 여부 확인


</script>
</body>
</html>