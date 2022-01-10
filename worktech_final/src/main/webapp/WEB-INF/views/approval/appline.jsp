<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal fade" id="appLine" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">결재선 지정</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          		</div>
				<div class="modal-body">
					<div class="container">
						<div class="row">
				            <div id="appline-tree" class="well col-sm-3"></div>
			 	            <div id="appline-result" class="col-sm-6">결재자</div> 
		          		</div>
		          	</div>
		        </div>
		        <div class="modal-footer">
		          	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		        </div>
			</div>
		</div>
	</div>
	
		<script>
	
//  결재자 지정
	var jsonData = [
		{
			id  : 1,
			text : "경영지원부",
			state : {
			selected  : false
		},
		children    : [
			{
				id  : 2,
				text : "OOO 팀장",
				icon : "resources/dist/themes/default/member.png",
				state : {
				selected  : false
				},  
			},
			{
				id  : 3,
				text : "XXX 대리",
				icon : "resources/dist/themes/default/member.png",
				state : {
				selected  : false
	        	},  
	      	}
	    ]
		
		}, 
		{
			id: 4,
		    text : "전략기획부",
	    	state : {
	     	selected : false
		},
	    	children : []
		},
		
		{
		    id  : 5,
		    text : "인사부",
		    state : {
			selected  : false
		},
			children    : [
			{
				id  : 6,
		        text : "",
		        state : {
				selected  : false
		        },  
			},
			{
		        id  : 7,
		        text : "Sub Folder 2",
		        state : {
		        selected  : false
		        },  
			}
			]
		}, 
		
		{
			id: 8,
		    text : "기술영업부",
		    state : {
		    selected : false
		},
		    children : []
		},
		
		{
			id: 9,
			text : "개발부",
			state : {
			selected : false
		},
			children : []
		},
		{
			id  : 10,
			text : "디자인부",
			state : {
			selected  : false
			},
				children    : [
				{
					id  : 11,
					text : "Sub Folder 1",
					state : {
					selected  : false
					},  
				},
				{
					id  : 12,
					text : "Sub Folder 2",
					state : {
					selected  : false
					},  
				}
				]
		}, 
		
		{
			id: 13,
		    text : "고객관리부",
		    state : {
		    selected : false
		},
		    children : []
		},
		
		{
			id: 14,
			text : "품질관리부",
			state : {
			selected : false
		},
			children : []
		},
		{
			id  : 15,
			text : "미주영업부",
			state : {
			selected  : false
			},
				children    : [
				{
					id  : 16,
					text : "Sub Folder 1",
					state : {
					selected  : false
					},  
				},
				{
					id  : 17,
					text : "Sub Folder 2",
					state : {
					selected  : false
					},  
				}
				]
		}, 
		
	];

	$('#appline-tree')
	  .on('changed.jstree', function (e, data) {
	    var objNode = data.instance.get_node(data.selected);
	    $('#appline-result').html('Selected: <br/><strong>' + objNode.id+'-'+objNode.text+'</strong>');
	  })
	  .jstree({
	  core: {
	    data: jsonData
	  }
	});
	
	
	
  </script>
</body>
</html>