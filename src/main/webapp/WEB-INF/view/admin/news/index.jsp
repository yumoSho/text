<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/view/include/taglibs.jspf" %>
<m:h>
    <%@ include file="/WEB-INF/view/include/elibs.jspf" %>
</m:h>
<%@include file="/WEB-INF/view/include/admin/adminHead.jspf" %>
<div class="main">
    <%@include file="/WEB-INF/view/include/admin/adminSidebar.jspf" %>

    <!-- Begin 主内容区 -->
    <div class="content">
        <!-- Begin 当前位置 -->
        <div class="position">
            <span>您当前的位置：</span>
            <a href="${ctx}/admin" title="首页">首页</a> &gt;
            <a href="${ctx}/admin/supportCategory/index"; title="">内容管理</a> &gt;
            <a href="${ctx}/admin/news/index"; title="">资讯管理</a> &gt;
            列表
        </div>
        <!-- //End 当前位置 -->
        <div class="listPage">
            <!-- Begin 操作条 -->
            <div class="operateBar">
                <ul>
                    <li>
                        <a class="operate-delete" href="javascript:void(0);" class="">
                            <s class="icon-delete"></s>删除
                        </a>
                    </li>
                    <li>
                        <a class="operate-add" href="add">
                            <s class="icon-add-green"></s>新增
                        </a>
                    </li>
                </ul>
            </div>
            <!-- //End 操作条 -->
            <div class="table-module03">
                <table id="datagrid"></table>
                <div id="pagination" style="height: 50px"></div>
            </div>
        </div>
    </div>
    <!-- //End 主内容区 -->
</div>

<m:message message="${message}" error="${error}"/>
<%--批量删除js--%>
<script type="text/javascript" src="${ctx}/js/admin/adminIndex.js"></script>
<script type="text/javascript">

	//var adTypes = toObject("${advertisementTypes}");
    var $g = $('#datagrid').jqGrid({
        url: 'list',
        datatype: 'json',
        colNames: ['操作', 'id','图片','名称','是否显示','首页推荐','类别','排序','添加时间'],
        colModel: [
            {
            	template: 'actions2', width: 100
            
            
            },
    		{name: 'id', index: 'id', hidden: true, key: true},
    		{name: 'image', index: 'image', template: 'img', align: 'center',width:230},
            {name: 'title', index: 'tu.title', template: 'text', sortable:false,searchoptions: {sopt: ["cn"]}},
            {
                name: 'isShow', index: 'tu.isShow', template: 'select', stype: 'select',
                width: 150,

                searchoptions: {sopt: ["eq", "ne"], value: ":全部;1:是;0:否"},
                formatter: function (val) {
                    if(val || val == true){
                        return "是";
                    }else{
                        return "否";
                    }

                }
            },
            {
                name: 'isHot', index: 'tu.isHot', template: 'select', stype: 'select',
                width: 150,

                searchoptions: {sopt: ["eq", "ne"], value: ":全部;1:是;0:否"},
                formatter: function (val) {
                    if(val || val == true){
                        return "是";
                    }else{
                        return "否";
                    }

                }
            },
            {name: 'nType', index: 'tu.nType', template: 'text', sortable:false,searchoptions: {sopt: ["cn"]}},
            {name: 'sortNum', index: 'sortNum', template: 'text', sortable:true,search:false},
	        {name: 'createdDate', template: 'date',search:false, formatter:"date", formatoptions: {newformat:'Y-m-d H:m:s'}}
	        		        
	          ],
        multiselect: true,
        autowidth: true,
        shrinkToFit:true,
        height: 'auto',
        pager: '#pagination',
        sortname: 'createdDate',
        sortorder: 'desc'
    });
</script>
<m:f/>

