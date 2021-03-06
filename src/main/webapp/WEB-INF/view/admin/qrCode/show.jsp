<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../../include/taglibs.jspf" %>
<m:h>
    <%@include file="../../include/elibs.jspf" %>
</m:h>
<%@include file="../../include/admin/adminHead.jspf" %>
<div class="main">
    <%@include file="../../include/admin/adminSidebar.jspf" %>
    <!-- Begin 主内容区 -->
    <div class="content">
        <!-- Begin 当前位置 -->
        <div class="position">
            <span>当前位置：</span>
            <a href="${ctx}/admin" title="首页">首页</a> &gt;
            <a href="${ctx}/admin/couponTempl/index" ; title="运营管理">运营管理</a> &gt;
            <a href="${ctx}/admin/qrCode/index" ; title="二维码管理">二维码管理</a> &gt;
            查看
        </div>
        <!-- //End 当前位置 -->
        <div class="editPage" style="height:800px;">
            <form id="form" action="${ctx}/admin/qrCode/update" method="post">
                <input type="hidden" name="TOKEN" value="${TOKEN}">
                <input type="hidden" name="id" value="${qRcode.id}">
                <table class="table-module01" cellpadding="0" cellspacing="0" id="tbl">
                    <tbody>
                    <tr>
                        <th width="130" align="right">二维码名称：<b class="color-red">*</b></th>
                        <td>
                            <input type="text" name="name" value="${qRcode.name}" maxlength="30" disabled/>
                        </td>
                    </tr>
                    <tr>
                        <th width="130" align="right">链接地址：<b class="color-red">*</b></th>
                        <td>
                            <input type="text" name="link"  value="${qRcode.link}" maxlength="30" disabled/>
                        </td>
                    </tr>
                    <%--<tr>
                        <th width="130" align="right"></th>
                        <td>
                            <button type="button" onclick="showCode()">生成二维码</button>
                        </td>
                    </tr>--%>

                    <tr>
                        <th width="130" align="right"></th>
                        <td style="height: 200px">
                            <img src="" id="code"  alt="二维码" >
                        </td>
                    </tr>


                    <tr>
                        <td></td>
                        <td align="left">
	                            <%--<span class="btn-sure-wrap">
	                                <input class="btn-sure btn-edit" type="submit" value="保存"/>
	                            </span>--%>
	                            <span class="btn-cancel-wrap" style="margin-left: 70px">
	                                <input class="btn-cancel" type="button" value="返回" onclick=""/>
	                            </span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <!-- //End 主内容区 -->
    </div>
    <m:f/>
    <script>
        $(function () {
            $(".btn-cancel-wrap input").click(function () {
                window.location.href = contextPath + "/admin/qrCode/index";
            });


        });
        showCode();
        function showCode(){
            var host = location.host;
            $("#code").attr("src","${ctx}/payment/createImage?qrcode=" + host + "${ctx}/route%3FqrCodeId=${qRcode.id}");
        }
    </script>


