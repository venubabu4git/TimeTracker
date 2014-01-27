﻿<%@ Page Language="C#" MasterPageFile="~/TimeTracker/MasterPage.master" CodeFile="Report_Resources_Daywise_Result.aspx.cs"
    Inherits="Report_Resources_Daywise_Result_aspx" Title="Quadone - Time Tracker - Resource Reports" Culture="auto" UICulture="auto" EnableEventValidation="false"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">

    <script type="text/javascript" >
    function HideExcel() { 
    
    }

</script>
    <div id="projectreport">
        <a name="content_start" id="content_start"></a>
        <fieldset>
            <h2 class="none">
                Resources Report</h2>
            <legend>Resources Report</legend>
            
            <asp:ObjectDataSource ID="UserReportData" runat="server" TypeName="ASPNET.StarterKit.BusinessLogicLayer.UserTotalDurationReport"
                SelectMethod="GetUserReportsByUserNamesAndDates">
                <SelectParameters>
                    <asp:SessionParameter Name="userNames" SessionField="SelectedUserNames" 
                        Type="String" />
                    <asp:SessionParameter Name="startDate" SessionField="SelectedStartingDate" Type="DateTime" />
                    <asp:SessionParameter Name="endDate" SessionField="SelectedEndDate" Type="DateTime" />
                    <asp:SessionParameter Name="ProjectId" SessionField="SelectedProjectId" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
             <%--<div id="ExportResources"  align="right">
             <asp:Label ID="lblexportres" runat="server" ForeColor="Blue" Text="Export To -" Visible="false" ></asp:Label>
             <asp:ImageButton ID="lnkexportResources" CssClass="lnkexport" runat="server"  ImageUrl="images/btn_Excel.gif"  ToolTip="Export To ExcelSheet"  onclick="lnkexportResources_Click" />
             </div>--%>
            <table class="tan-border" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr valign="top">
                    <td style="padding:0">
                        <asp:Label ID="NoData" runat="server" Visible="False" CssClass="header-gray">
                        No Data Retrieved.
                        </asp:Label>
                        <asp:DataList ID="UserList" runat="server" Width="100%" DataSourceID="UserReportData"
                            OnItemCreated="OnListUserTimeEntriesItemCreated">
                            <HeaderTemplate>
                                <table cellspacing="0" cellpadding="0" width="100%" border="0" class="project_main_list">
                                    <tr>
                                        <th class="report-header" style="width:20%;">
                                            Beginning Date</th>
                                        <th style="width:80%;" class="report-header">
                                            Ending Date</th>
                                    </tr>
                                    <tr>
                                        <td class="report-text">
                                            <asp:Label ID="StartingDate" runat="server" Text='<%# Session["SelectedStartingDate"] %>' />
                                        </td>
                                        <td class="report-text">
                                            <asp:Label ID="EndingDate" runat="server" Text='<%# Session["SelectedEndDate"]  %>' />
                                        </td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="report_list_main">
                                
                                    <div class="user-details">
                                <span class="consultant_name">UserName :
                                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' /></span><br />
                                <span class="consultant_name">Total Duration Worked :
                                <asp:Label ID="TotalDurationLabel" runat="server" 
                                    Text='<%# Eval("TotalDuration") %>' /></span>
                                  
                              </div>
                               <br />
                              <asp:ObjectDataSource ID="UserReportWithDate" runat="server" TypeName="ASPNET.StarterKit.BusinessLogicLayer.UserTotalDurationReport" 
                              SelectMethod="GetUserReportsDateWiseByUserNameAndDates">
                              <SelectParameters>
                                  <asp:Parameter Name="userName" 
                                      Type="String" />
                                <asp:SessionParameter Name="startDate" SessionField="SelectedStartingDate" Type="DateTime" />
                                <asp:SessionParameter Name="endDate" SessionField="SelectedEndDate" Type="DateTime" />
                                 </SelectParameters>
                              </asp:ObjectDataSource>
                              <asp:GridView ID="UserReportDataByDate" runat="server" CssClass="project_main_list" 
                                         AutoGenerateColumns="False" 
                                        onpageindexchanging="UserReportDataByDate_PageIndexChanging" >
                              <HeaderStyle CssClass="grid-header" HorizontalAlign="Left" />
                                <AlternatingRowStyle CssClass="dark" />
                                <RowStyle HorizontalAlign="Left" ForeColor="Gray" />
                                  <Columns>
                                   
                                    <asp:BoundField DataField="timeEntryDate" HeaderText="TimeEntry Date" 
                                          ReadOnly="True" SortExpression="timeEntryDate" DataFormatString="{0:d-MMM-yyyy}"  />
                                          <asp:BoundField DataField="TotalDuration" HeaderText="Time Duration" 
                                          ReadOnly="True" SortExpression="TotalDuration" />
                                      
                                    </Columns>
                              </asp:GridView>
                              </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                   
                </tr>
            </table>
        </fieldset>
    </div>
</asp:Content>
                          
                              