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
	<title>AJAX 실시간 댓글 등록, 보여주는 화면</title>
</head>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- ajax 글 등록 :  https://gangnam-americano.tistory.com/32 -->
<body style="background: #F2F2F2;">
<div class="container-fluid">
    <form id="commentForm" name="commentForm" method="post">  
    <input type="hidden" id= "num" name="num" value="<%=request.getParameter("num")%>">
    <h3>${num}</h3>
<!-- graph 부분 -->    
	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<div id="ajax_graph" class="container-fluid">
	</div>
<!-- /graph 부분 -->        
    <br><br>
        <div>
            <div>
            <blockquote class='blockquote-reverse'>
			<p>
				<a class="btn btn-primary " data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
				투표하기 / 글쓰기
				</a>
			</p>
			</blockquote>
				<div class="collapse" id="collapseExample">
					<div class="card card-body" style="background: #F2F2F2;">
					<br><br>
						<div>
							<div style="background: #F2F2F2;">
	            
	            
				                <table class="table">                    
				                    <tr>
				                        <td>
				                        	<div class="form-group green-border-focus">
												<textarea class="form-control" style="width: 100% " rows="5" id="content" name="content" placeholder="글을 입력해주세요."></textarea>
											</div>
				                            <br>
				                            <div class="row text-center" style="width: 100%">
		                            			<div style="width: 30%; float:none; margin:0 auto" >
				                         		   <h3>기사의 정치성향 선택</h3>
				<!-- radio button 추가 -->     
													<div id="voteForm" class="container-fluid">
													</div>
												</div>
											</div>
				<!-- /radio button 추가 -->                            
				                            <div><!--  -->
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


function deleteReple(num){			// 댓글 지워주기
	
	var jsonData = "&num="+num;
	
    $.ajax({
        type:'POST',
        url : "<c:url value='/issue/issueRepleDelete.do'/>",
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
    	
	getGraphData();

	console.log($("#commentForm").serialize());

    $.ajax({
        type:'POST',
        url : "<c:url value='/issue/issueBoardMainReplePro.do'/>",
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
}

//시작구문  '$(document)ready.function(){}' 와도 같음

$(function(){		
	getCommentList();
	getGraphData();
	voteCheck();
});


function donutgraph(tda, tdb, tdc) {
	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		title:{
			horizontalAlign: "left"
		},
		data: [{
			type: "doughnut",
			startAngle: 60,
			//innerRadius: 60,
			indexLabelFontSize: 17,
			indexLabel: "{label} - #percent%",
			toolTipContent: "<b>{label}:</b> {y} (#percent%)",
			dataPoints: [
				{ y: tda, label: "찬성" },
				{ y: tdb, label: "중립" },
				{ y: tdc, label: "반대" },
			]
		}]
	});
	chart.render();

	}


// https://www.youtube.com/watch?v=CE-6QdHI3Ug 변수 넘기는거 참고
function getCommentList(pageNum){
	if (pageNum == null){
		pageNum = 1;
	}
	var jsonData = $("#num").serialize()+"&pageNum="+pageNum;	// 데이터 넘겨주기
	
	var reple = "";
	
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
            if((data.length > 0) && (${sessionScope.sId != "admin"}) && (${sessionScope.sId != null})){
                for(i=0; i<data.length; i++){               	
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;time =  "+ data[i].reg + "</strong></h6>";
                    html += "<tr><td class='listth'>" + data[i].content + "</td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                }
            }else if((data.length > 0) && (${sessionScope.sId == 'admin'})){
            	for(i=0; i<data.length; i++){               	
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;time =  "+ data[i].reg + "" + "<a href='#' onClick='deleteReple(" + data[i].num + ")'>&nbsp;&nbsp;&nbsp;<span class='glyphicon glyphicon-remove' aria-hidden='true'></span></a></strong></h6>";
                    html += "<tr><td class='listth'>" + data[i].content;
                    html += "</table></div>";
                    html += "</div>";
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
        url : "<c:url value='/issue/issueBoardMainGraph.do'/>",
        data:jsonData,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        dataType :"json",
        success : function(data){    
        	
        	var tda = data[0].tda;
        	var tdb = data[0].tdb;
        	var tdc = data[0].tdc;
        	
        	donutgraph(tda, tdb, tdc);
/*         	
            var graph = "";
            if(data.length > 0){
	            graph += '<div class="row">';
	            graph += '<div class="col-md-12" id="graph">';
	            graph += '<div class="widget widget-black shadow">';
	            graph += '<div class="widget-title">여당 / 중립 / 야당</div>';
	            graph += '<div style="clear: both;"></div>';
	            graph += '<div class="" style="max-height: 5px;">';
	            graph += '<div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" style="width:' + data[0].tda + '%">';
	            graph += '<strong style="color: black;">여당' + data[0].tda + '%</strong>';
	            graph += '</div>';
	            graph += '<div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" style="width:' + data[0].tdb + '%">';
	            graph += '<strong style="color: black;">중립' + data[0].tdb + ' %</strong>';
	            graph += '</div>';
	            graph += '<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" style="width:' + data[0].tdc + '%">';
	            graph += '<strong style="color: black;">야당' + data[0].tdc + ' %</strong>';
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
  	*/
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
        url : "<c:url value='/issue/voteCheck.do'/>",
        data:jsonData,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        dataType :"json",
        success : function(data){        
            var vote = "";
            if(data[0].check == 0){               	
	            vote += '<p><strong>기사의 정치성향 투표</strong></p>';
	            vote += '<label class="radio-inline">';
	            vote += '<input type="radio" name="inlineRadioOptions" id="inlineRadio4" value="1"> 여당';
	            vote += '</label>';
	            vote += '<label class="radio-inline">';
	            vote += '<input type="radio" name="inlineRadioOptions" id="inlineRadio4" value="0"> 중립';
	            vote += '</label>';
	            vote += '<label class="radio-inline">';
	            vote += '<input type="radio" name="inlineRadioOptions" id="inlineRadio5" value="-1"> 야당';
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