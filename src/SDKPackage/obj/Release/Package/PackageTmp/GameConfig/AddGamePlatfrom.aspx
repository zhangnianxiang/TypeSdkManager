﻿<%@ Page Title="游戏渠道列表" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddGamePlatfrom.aspx.cs" Inherits="SDKPackage.GameConfig.AddGamePlatfrom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(function () {
            //android 渠道列表展开
            $("#addAndroidPlatform").click(function () {
                var hiddenlist = $("#ListViewAndroid_itemGamesContainer input[name='hfPlatformID']");
                var platformIdList = "";
                for (var i = 0; i < hiddenlist.length; i++) {
                    platformIdList = platformIdList + hiddenlist[i].value + ",";
                }
                platformIdList = platformIdList.substring(0, platformIdList.length - 1);
                alert(platformIdList);
                if (platformIdList.length > 0)
                    checkPlatform(platformIdList);
                else {
                    $("#ListViewAndroidPlatformList_itemGamesContainer input[name='hfPlatformID']").each(function () {
                        $(this).attr("checked", false);
                    });
                }
            });

            $("#addIOSPlatform").click(function () {
                var hiddenlist = $("#ListViewIOS_itemGamesContainer input[name='hfPlatformID']");
                var platformIdList = "";
                for (var i = 0; i < hiddenlist.length; i++) {
                    platformIdList = platformIdList + hiddenlist[i].value + ",";
                }
                platformIdList = platformIdList.substring(0, platformIdList.length - 1);
                if (platformIdList.length > 0)
                    checkPlatformIOS(platformIdList);
                else {
                    $("#ListViewIOSPlatformList_itemGamesContainer input[name='hfPlatformID']").each(function () {
                        $(this).attr("checked", false);
                    });
                }
            });

            $("#MainContent_ButtonAddAndroidPlatform").click(function () {
                var checkboxList = $("#ListViewAndroidPlatformList_itemGamesContainer input[type='checkbox']:checked");
                var strhidden = "";
                var strsign = "";
                var strVersion = "";
                for (var i = 0; i < checkboxList.length; i++) {
                    if (checkboxList[i].checked) {
                        strhidden = strhidden + checkboxList[i].value + ",";
                        strsign = strsign + $(checkboxList[i]).parent("div").parent("td").parent("tr").children("td").eq(3).children("select").val() + ",";
                        if ($(checkboxList[i]).parent("div").parent("td").parent("tr").children("td").eq(1).children("select").val() == null || $(checkboxList[i]).parent("div").parent("td").parent("tr").children("td").eq(1).children("select").val() == undefined) {
        //                    alert("渠道版本未配置！");
                            return false;
                        }
                        strVersion = strVersion + $(checkboxList[i]).parent("div").parent("td").parent("tr").children("td").eq(1).children("select").val() + ",";
                    }
                }
                if (strhidden.length > 0) {
                    strhidden = strhidden.substring(0, strhidden.length - 1);
                    strsign = strsign.substring(0, strsign.length - 1);
                    strVersion = strVersion.substring(0, strVersion.length - 1);
                }
                $("#MainContent_hfAndroidPlatformList").val(strhidden);
                $("#MainContent_hfAndroidSignList").val(strsign);
                $("#MainContent_hfAndroidVersionList").val(strVersion);
            });


            $("#MainContent_ButtonIOSPlatform").click(function () {
                var checkboxList = $("#ListViewIOSPlatformList_itemGamesContainer input[type='checkbox']:checked");
                var strhidden = "";
                for (var i = 0; i < checkboxList.length; i++) {
                    strhidden = strhidden + checkboxList[i].value + ",";
                }
                if (strhidden.length > 0)
                    strhidden = strhidden.substring(0, strhidden.length - 1);
                $("#MainContent_hfIOSPlatformList").val(strhidden);
            });
        })

        function checkPlatform(platformlist) {
                    var arrList = platformlist.split(',');
                    var checkboxList = $("#ListViewAndroidPlatformList_itemGamesContainer input[name='hfPlatformID']");
        //            var pvidlist = $("#ListViewAndroid_itemGamesContainer input[name='hfpvid']");
                    var pfidlist = $("#ListViewAndroid_itemGamesContainer input[name='hfPlatformID']");
                    var signlist = $("#ListViewAndroid_itemGamesContainer input[name='hfKeyID']");
                    var tempName;
                    for (var j = 0; j < checkboxList.length; j++) {
                        for (var i = 0; i < arrList.length; i++) {
                            if (arrList[i] == checkboxList[j].value) {
                                $(checkboxList[j]).parent("div").addClass("checked");
                                $(checkboxList[j]).attr("checked", true);
                                    for (var k = 0; k < pfidlist.length; k++) {
                                        if (pfidlist[k].value == checkboxList[j].value) {
                                            $(checkboxList[j]).closest("tr").children("td:nth-child(1) > select").val($(pfidlist[k]).closest("tr").children("td:nth-child(2) > input").val());//version list 选中
                                            $(checkboxList[j]).closest("tr").children("td:nth-child(3) > select").val($(pfidlist[k]).closest("tr").children("td:nth-child(2) > input").val());//sign list 选中
                                        }
                                    }
                                break;
                            }
                            $(checkboxList[j]).next("input:checkbox").attr("checked", false);
                        }
                    }
                }

        function checkPlatformIOS(platformlist) {
            var arrList = platformlist.split(',');
            var checkboxList = $("#ListViewIOSPlatformList_itemGamesContainer input[name='hfPlatformID']");
            for (var j = 0; j < checkboxList.length; j++) {
                for (var i = 0; i < arrList.length; i++) {
                    if (arrList[i] == checkboxList[j].value) {
                        //alert(arrList[i]);
						$(checkboxList[j]).parent("div").addClass("checked");
                        $(checkboxList[j]).attr("checked", true);
                        break;
                    }
                    $(checkboxList[j]).next("input:checkbox").attr("checked", false);
                }
            }
        }
    </script>

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2><%= gamedisplayname %> Android渠道设定</h2>
					<ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
				<div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div>
                        <a class="btn btn-primary " data-toggle="modal" data-target="#divandroidplatform" id="addAndroidPlatform"><i class="fa fa-check-square-o"></i> 选择游戏接入渠道</a>

                        <a class="btn btn-primary " data-toggle="modal" data-target="#divGameSDKRedisList" id="syncRedis"><i class="fa fa-check-square-o"></i> 同步SDK服务器</a>
                    
                        <asp:Label ID="lblSyncRedis" runat="server" Text=""></asp:Label>
                    </div>
                    <asp:ListView ID="ListViewAndroid" runat="server" DataSourceID="SqlDataSourceAndroid">
                        <LayoutTemplate>
                            <table id="ListViewAndroid_itemGamesContainer" class="table table-striped jambo_table">
                                <thead>
                                    <tr>
                                        <th>渠道名</th>
                                        <th>渠道简称</th>
                                        <th>渠道 SDK 版本</th>
                                        <th>选择签名</th>
                                        <th>渠道参数</th>
                                        <th>渠道图标</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("PlatformDisplayName") %>
                                    <input type="hidden" value='<%#Eval("platformid") %>' name="hfPlatformID" />
                                </td>
                                <td><%#Eval("PlatformName") %></td>
                                <td><%#Eval("Version") %><input type="hidden" value='<%#Eval("pvid") %>' name="hfpvid" /></td>
                                <td><%#Eval("KeyName") %><input type="hidden" value='<%#Eval("SignatureKeyID") %>' name="hfKeyID" /></td>
                                <td><a class="btn btn-primary btn-sm" href='GamePlatformConfig.aspx?gameid=<%#Eval("GameID") %>&platformid=<%#Eval("platformid") %>&SignatureKeyID=<%#Eval("SignatureKeyID") %>&systemid=1&gamedisplayname=<%#Eval("GameDisplayName") %>&gamename=<%#Eval("GameName") %>&platformname=<%#Eval("PlatformName") %>&androidversionid=<%=androidversionid %>&iosversionid=<%=iosversionid %>&pluginid=<%#Eval("pluginid") %>'><i class='fa fa-edit'></i> 参数配置</a></td>
                                <td><a class="btn btn-primary btn-sm" href='GamePlatformIcon.aspx?gameid=<%#Eval("GameID") %>&platformid=<%#Eval("platformid") %>&SignatureKeyID=<%#Eval("SignatureKeyID") %>&systemid=1&gamedisplayname=<%#Eval("GameDisplayName") %>&gamename=<%#Eval("GameName") %>&platformname=<%#Eval("PlatformName") %>&androidversionid=<%=androidversionid %>&iosversionid=<%=iosversionid %>&pluginid=<%#Eval("pluginid") %>'><i class='fa fa-edit'></i> 图标配置</a></td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2><%= gamedisplayname %> IOS渠道设定</h2>
					<ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
				<div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div>
                        <a class="btn btn-primary " data-toggle="modal" data-target="#diviosplatform" id="addIOSPlatform"><i class="fa fa-check-square-o"></i> 选择接入渠道</a>
                    </div>
                    <asp:ListView ID="ListViewIOS" runat="server" DataSourceID="SqlDataSourceIOS">
                        <LayoutTemplate>
                            <table id="ListViewIOS_itemGamesContainer" class="table table-striped jambo_table">
                                <thead>
                                    <tr runat="server">
                                        <th runat="server">渠道名</th>
                                        <th runat="server">渠道简称</th>
                                        <th runat="server">SDK 版本</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("PlatformDisplayName") %>
                                    <input type="hidden" value='<%#Eval("platformid") %>' name="hfPlatformID" /></td>
                                <td><%#Eval("PlatformName") %></td>
                                <td><%#Eval("SdkVersion") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
            <div class="text-center">
                <a class="btn btn-default" href="GameList.aspx"><i class="fa fa-reply"></i> 返回</a>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceAndroid" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="sdk_getGamePlatformList_Android" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="gameid" Name="GameID" Type="Int32" />
            <asp:Parameter Name="SystemID" Type="Int32" DefaultValue="1" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceIOS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="sdk_getGamePlatformList_IOS" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="gameid" Name="GameID" Type="Int32" />
            <asp:Parameter Name="SystemID" Type="Int32" DefaultValue="2" />
        </SelectParameters>
    </asp:SqlDataSource>
    <!--android渠道列表-->
    <div class="modal fade" id="divandroidplatform" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h2 class="modal-title">Android 渠道设定</h2>
                </div>
                <!--内容-->
                <div class="modal-body">
                    <asp:ListView ID="ListViewAndroidPlatformList" runat="server" DataSourceID="SqlDataSourceAndroidPlatformList">
                        <LayoutTemplate>
                            <table id="ListViewAndroidPlatformList_itemGamesContainer" class="table table-striped jambo_table">
                                <thead>
                                    <tr style="left: 30px; position: relative;">
                                        <th runat="server">渠道名</th>
                                        <th runat="server">渠道 SDK 版本</th>
                                        <th runat="server">支持最高版本</th>
                                        <th runat="server">Android签名选择</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr style="left: 5px; position: relative;">
                                <td>
                                    <input type="checkbox" class="flat" value='<%#Eval("dpfid") %>' name="hfPlatformID" />
                                    <%#Eval("PlatformDisplayName") %>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSource='<%#GetAndroidPlatformVersion(Eval("dpfid").ToString()) %>' DataTextField="Version" DataValueField="id">
                                    </asp:DropDownList>

                                </td>
                                <td><%#Eval("SdkVersion") %></td>
                                <td>
                                    <asp:DropDownList ID="ddlSignatureKey" runat="server" DataSourceID="SqlDataSourceSignatureKey" DataTextField="KeyName" DataValueField="ID" name="SignatureKey">
                                    </asp:DropDownList></td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <!--内容-->
                <div class="modal-footer" id="modalfooter">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>
                    <asp:Button ID="ButtonAddAndroidPlatform" runat="server" class="btn btn-primary" Text="保存" OnClick="ButtonAddAndroidPlatform_Click" />
                </div>
            </div>
        </div>
    </div>
    <!--android渠道列表end-->

    <!--SDK Redis服务器列表-->
    <div class="modal fade" id="divGameSDKRedisList" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h2 class="modal-title">同步服务器配置</h2>
                </div>
                <!--内容-->
                <div class="modal-body">
                    <table id="ListViewAndroidPlatformList_itemGamesContainer" class="table table-striped jambo_table">
                        <thead>
                            <tr style="left: 30px; position: relative;">
                                <th runat="server">Redis HOST</th>
                                <th runat="server">PORT</th>
                                <th runat="server">PASSWORD</th>
                                <th runat="server">DB</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr style="left: 5px; position: relative;">
                                <td>
                                    <asp:TextBox ID="txtRedisHost" style="width:100px;" runat="server" Text="localhost"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtRedisPort" style="width:100px;" runat="server"  Text="6379"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtRedisPassword" style="width:100px;" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtRedisDB" style="width:100px;" runat="server" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!--内容-->
                <div class="modal-footer" id="modalfooterSDKRedisList">
                    
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>
                    <asp:Button ID="ButtonSyncRedis" runat="server" class="btn btn-primary" Text="同步" OnClick="ButtonSyncRedis_Click" />
                </div>
            </div>
        </div>
    </div>
    <!--SDK Redis服务器列表end-->

    

    <asp:SqlDataSource ID="SqlDataSourceSignatureKey" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select [Id],[KeyName] from [sdk_SignatureKey]" SelectCommandType="Text"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAndroidPlatformList" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
        SelectCommand="sdk_getPlatformListInfo"
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="androidversionid" Name="SdkVersion" Type="String" />
            <asp:Parameter Name="SystemID" DefaultValue="1" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceIOSPlatformList" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
        SelectCommand="sdk_getPlatformListInfo"
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="iosversionid" Name="SdkVersion" Type="String" />
            <asp:Parameter Name="SystemID" DefaultValue="2" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="hfAndroidPlatformList" runat="server" />
    <asp:HiddenField ID="hfAndroidSignList" runat="server" />
    <asp:HiddenField ID="hfAndroidVersionList" runat="server" />
    <asp:HiddenField ID="hfLeBianAndroidPlatformList" runat="server" />
    <asp:HiddenField ID="hfLeBianAndroidSignList" runat="server" />
    <asp:HiddenField ID="hfLeBianAndroidVersionList" runat="server" />
    <asp:HiddenField ID="hfInitSignList" runat="server" />
    <asp:HiddenField ID="hfIOSPlatformList" runat="server" />
    <asp:HiddenField ID="hfIOSVersionList" runat="server" />
</asp:Content>
