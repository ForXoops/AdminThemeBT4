<{includeq file="db:system_header.tpl"}>

<{if $users_display == true}>
    <!--Display form sort-->
<div class="card">
    <div class="card-header">
        <{$form_sort}>
        <div class="card-tools">
            <a class="btn btn-sm btn-secondary" href="admin.php?fct=users&amp;op=users_synchronize&amp;status=2"
                title="<{$smarty.const._AM_SYSTEM_USERS_SYNCHRONIZE}>">
                <i class="fas fa-sync ic-w mr-1"></i><{$smarty.const._AM_SYSTEM_USERS_SYNCHRONIZE}>
            </a>
            <a class="btn btn-sm btn-secondary" href="admin.php?fct=users&amp;op=users_add" 
                title="<{$smarty.const._AM_SYSTEM_USERS_ADDUSER}>">
                <i class="fa fa-plus-circle ic-w mr-1" ></i><{$smarty.const._AM_SYSTEM_USERS_ADDUSER}>
            </a>
        </div>
    </div>
    <div class="card-body table-responsive p-0">
    <table id="xo-users-sorter" class="table table-bordered table-striped">
        <thead class="table-head">
        <tr>
            <th class="txtcenter width3"><input name='allbox' id='allbox' onclick='xoopsCheckAll("memberslist", "allbox");' type='checkbox'
                                                value='Check All'/></th>
            <th class="txtcenter width5"><{$smarty.const._AM_SYSTEM_USERS_STATUS}></th>
            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERS_UNAME}></th>
            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERS_EMAIL}></th>
            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERS_REG_DATE}></th>
            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERS_LAST_LOGIN}></th>
            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERS_POSTS}></th>
            <th class="txtcenter" width='11%'><{$smarty.const._AM_SYSTEM_USERS_ACTION}></th>
        </tr>
        </thead>
        <!--Display data-->
        <{if $users_count == true}>
            <form class="form-inline" name='memberslist' id='memberslist' action='<{xoAppUrl modules/system/admin.php?fct=users}>' method='POST'>
                <tbody>
                <{foreach item=users from=$users}>
                    <tr class="<{cycle values='even,odd'}> alignmiddle">
                        <td class="txtcenter"><{if $users.checkbox_user}><input type='checkbox' name='memberslist_id[]' id='memberslist_id[]'
                                                                                value='<{$users.uid}>'/><{/if}>
                        </td>
                        <td class="txtcenter"><img class="xo-imgmini" src="<{$users.group}>" alt=""/></td>
                        <td class="txtcenter"><a title="<{$users.uname}>" href="<{$xoops_url}>/userinfo.php?uid=<{$users.uid}>"><{$users.uname}></a></td>
                        <td class="txtcenter"><{$users.email}></td>
                        <td class="txtcenter"><{$users.reg_date}></td>
                        <td class="txtcenter"><{$users.last_login}></td>
                        <td class="txtcenter">
                            <div id="display_post_<{$users.uid}>"><{$users.posts}></div>
                            <div id='loading_<{$users.uid}>' class="txtcenter" style="display:none;"><img src="./images/mimetypes/spinner.gif" title="Loading"
                                                                                                          alt="Loading" width="12px"/></div>
                        </td>
                        <td class="xo-actions txtcenter">
                            <{if $users.user_level > 0}>
                                <img data-toggle="tooltip" onclick="display_post('<{$users.uid}>');" src="<{xoAdminIcons reload.png}>"
                                     alt="<{$smarty.const._AM_SYSTEM_USERS_SYNCHRONIZE}>" title="<{$smarty.const._AM_SYSTEM_USERS_SYNCHRONIZE}>"/>
                                <img data-toggle="tooltip" onclick="display_dialog('<{$users.uid}>', true, true, 'slide', 'slide', 300, 400);"
                                     src="<{xoAdminIcons display.png}>" alt="<{$smarty.const._AM_SYSTEM_USERS_VIEW}>"
                                     title="<{$smarty.const._AM_SYSTEM_USERS_VIEW}>"/>
                                <a data-toggle="tooltip" href="admin.php?fct=users&amp;op=users_edit&amp;uid=<{$users.uid}>"
                                   title="<{$smarty.const._AM_SYSTEM_USERS_EDIT}>">
                                    <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._AM_SYSTEM_USERS_EDIT}>"/>
                                </a>
                                <a data-toggle="tooltip" href="admin.php?fct=users&amp;op=users_delete&amp;uid=<{$users.uid}>"
                                   title="<{$smarty.const._AM_SYSTEM_USERS_DEL}>">
                                    <img src="<{xoAdminIcons delete.png}>" alt="<{$smarty.const._AM_SYSTEM_USERS_DEL}>"/>
                                </a>
                            <{else}>
                                <a data-toggle="tooltip" href="admin.php?fct=users&amp;op=users_active&amp;uid=<{$users.uid}>"
                                   title="<{$smarty.const._AM_SYSTEM_USERS_ACTIVE}>">
                                    <img src="<{xoAdminIcons xoops/active_user.png}>" alt="<{$smarty.const._AM_SYSTEM_USERS_ACTIVE}>"/>
                                </a>
                                <img data-toggle="tooltip" onclick="display_dialog('<{$users.uid}>', true, true, 'slide', 'slide', 300, 400);"
                                     src="<{xoAdminIcons display.png}>" alt="<{$smarty.const._AM_SYSTEM_USERS_VIEW}>"
                                     title="<{$smarty.const._AM_SYSTEM_USERS_VIEW}>"/>
                                <a data-toggle="tooltip" href="admin.php?fct=users&amp;op=users_edit&amp;uid=<{$users.uid}>"
                                   title="<{$smarty.const._AM_SYSTEM_USERS_EDIT}>">
                                    <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._AM_SYSTEM_USERS_EDIT}>"/>
                                </a>
                                <a data-toggle="tooltip" href="admin.php?fct=users&amp;op=users_delete&amp;uid=<{$users.uid}>"
                                   title="<{$smarty.const._AM_SYSTEM_USERS_DEL}>">
                                    <img src="<{xoAdminIcons delete.png}>" alt="<{$smarty.const._AM_SYSTEM_USERS_DEL}>"/>
                                </a>
                            <{/if}>
                        </td>
                    </tr>
                <{/foreach}>
                </tbody>
                <tr>
                    <td class='txtleft' colspan='8'>
                        <select class="browser-default custom-select col-2" name='fct' onChange='changeDisplay (this.value, "groups", "edit_group")'>
                            <option value=''>---------</option>
                            <option value='mailusers'><{$smarty.const._AM_SYSTEM_USERS_SENDMAIL}></option>
                            <option value='groups'><{$smarty.const._AM_SYSTEM_USERS_EDIT_GROUPS}></option>
                            <option value='users'><{$smarty.const._AM_SYSTEM_USERS_DELETE}></option>
                        </select>&nbsp;
                        <select class="browser-default custom-select col-2" name='edit_group' id='edit_group' onChange='changeDisplay (this.value, this.value, "selgroups")' style="display:none;">
                            <option value=''>---------</option>
                            <option value='add_group'><{$smarty.const._AM_SYSTEM_USERS_ADD_GROUPS}></option>
                            <option value='delete_group'><{$smarty.const._AM_SYSTEM_USERS_DELETE_GROUPS}></option>
                        </select>
                        <{$form_select_groups}>
                        <{$form_token}>
                        <input type="hidden" name="op" value="action_group">
                        <input class="btn btn-sm btn-primary" type='submit' name='Submit'/>
                    </td>
                </tr>
            </form>
        <{/if}>
        <!--No found-->
        <{if $users_no_found == true}>
            <tr class="<{cycle values='even,odd'}> alignmiddle">
                <td colspan='8' class="txtcenter"><{$smarty.const._AM_SYSTEM_USERS_NO_FOUND}></td>
            </tr>
        <{/if}>
    </table>
    </div>
</div>
    <!--Pop-pup-->
    <{if $users_count == true}>
        <{foreach item=users from=$users_popup}>
            <div id="dialog<{$users.uid}>" title="<{$users.uname}>" style='display:none;'>
                <table>
                    <tr>
                        <td class="txtcenter">
                            <img src="<{$users.user_avatar}>" alt="<{$users.uname}>" title="<{$users.uname}>"/>
                        </td>
                        <td class="txtcenter">
                            <a href='mailto:<{$users.email}>'><img src="<{xoAdminIcons mail_send.png}>" alt="" title=<{$smarty.const._AM_SYSTEM_USERS_EMAIL}>
                                /></a>
                            <a href='javascript:openWithSelfMain("<{$xoops_url}>/pmlite.php?send2=1&amp;to_userid=<{$users.uid}>","pmlite",565,500);'><img
                                        src="<{xoAdminIcons pm.png}>" alt="" title=<{$smarty.const._AM_SYSTEM_USERS_PM}>/></a>
                            <a href='<{$users.url}>' rel='external'><img src="<{xoAdminIcons url.png}>" alt="" title=<{$smarty.const._AM_SYSTEM_USERS_URL}>></a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <ul style="border: 1px solid #666; padding: 8px;">
                                <{if $users.user_name}>
                                    <li><span class="bold"><{$smarty.const._AM_SYSTEM_USERS_NAME}></span>&nbsp;:&nbsp;<{$users.name}></li>
                                <{/if}>
                                <li><span class="bold"><{$smarty.const._AM_SYSTEM_USERS_UNAME}></span>&nbsp;:&nbsp;<{$users.uname}></li>
                                <li><span class="bold"><{$smarty.const._AM_SYSTEM_USERS_EMAIL}></span>&nbsp;:&nbsp;<{$users.email}></li>
                                <{if $users.user_url}>
                                    <li><span class="bold"><{$smarty.const._AM_SYSTEM_USERS_URL}></span>&nbsp;:&nbsp;<{$users.url}></li>
                                <{/if}>
                                <{if $users.user_icq}>
                                    <li><span class="bold"><{$smarty.const._AM_SYSTEM_USERS_ICQ}></span>&nbsp;:&nbsp;<{$users.user_icq}></li>
                                <{/if}>
                                <{if $users.user_aim}>
                                    <li><span class="bold"><{$smarty.const._AM_SYSTEM_USERS_AIM}></span>&nbsp;:&nbsp;<{$users.user_aim}></li>
                                <{/if}>
                                <{if $users.user_yim}>
                                    <li><span class="bold"><{$smarty.const._AM_SYSTEM_USERS_YIM}></span>&nbsp;:&nbsp;<{$users.user_yim}></li>
                                <{/if}>
                                <{if $users.user_msnm}>
                                    <li><span class="bold"><{$smarty.const._AM_SYSTEM_USERS_MSNM}></span>&nbsp;:&nbsp;<{$users.user_msnm}></li>
                                <{/if}>
                            </ul>
                        </td>
                    </tr>
                </table>
            </div>
        <{/foreach}>
    <{/if}>
    <!--Pop-pup-->
    <div class='txtright'><{$nav}></div>
<{/if}>
<br>
<!-- Display Avatar form (add,edit) -->
<{if $form}>
    <div class="spacer"><{$form}></div>
<{/if}>
