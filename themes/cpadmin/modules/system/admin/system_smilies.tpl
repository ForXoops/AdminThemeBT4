<!--smilies-->
<{includeq file="db:system_header.tpl"}>
<script type="text/javascript">
    IMG_ON = '<{xoAdminIcons success.png}>';
    IMG_OFF = '<{xoAdminIcons cancel.png}>';
</script>
<{if $smilies_count == true}>
<div class="card">
    <div class="card-header">
    <div class="card-tools">
        <a class="btn btn-sm btn-secondary" href="admin.php?fct=smilies&amp;op=new_smilie" data-toggle="tooltip" title="<{$smarty.const._AM_SYSTEM_SMILIES_ADD}>">
        <i class="fa fa-plus-circle ic-w mr-1"></i>
            <{$smarty.const._AM_SYSTEM_SMILIES_ADD}>
        </a>
    </div>
    </div>
    <div class="table-responsive">
    <table id="xo-smilies-sorter" class="table table-bordered table-striped tablesorter">
        <thead class="stylish-color white-text">
        <tr>
            <th class="text-center"><{$smarty.const._AM_SYSTEM_SMILIES_CODE}></th>
            <th class="text-center"><{$smarty.const._AM_SYSTEM_SMILIES_SMILIE}></th>
            <th class="text-center"><{$smarty.const._AM_SYSTEM_SMILIES_DESCRIPTION}></th>
            <th class="text-center"><{$smarty.const._AM_SYSTEM_SMILIES_DISPLAY}></th>
            <th class="text-center width10"><{$smarty.const._AM_SYSTEM_SMILIES_ACTION}></th>
        </tr>
        </thead>
        <tbody>
        <{foreach item=smilies from=$smilies}>
            <tr class="<{cycle values='even,odd'}> alignmiddle">
                <td class="txtcenter width5"><{$smilies.code}></td>
                <td class="txtcenter width5"><{$smilies.image}></td>
                <td class="txtcenter width50"><{$smilies.emotion}></td>
                <td class="xo-actions text-center width10">
                    <img id="loading_sml<{$smilies.smilies_id}>" src="images/spinner.gif" style="display:none;" title="<{$smarty.const._AM_SYSTEM_LOADING}>"
                         alt="<{$smarty.const._AM_SYSTEM_LOADING}>"/><img class="cursorpointer" id="sml<{$smilies.smilies_id}>" data-toggle="tooltip"
                                                                          onclick="system_setStatus( { fct: 'smilies', op: 'smilies_update_display', smilies_id: <{$smilies.smilies_id}> }, 'sml<{$smilies.smilies_id}>', 'admin.php' )"
                                                                          src="<{if $smilies.display}><{xoAdminIcons success.png}><{else}><{xoAdminIcons cancel.png}><{/if}>"
                                                                          alt="<{if $smilies.display}><{$smarty.const._AM_SYSTEM_SMILIES_OFF}><{else}><{$smarty.const._AM_SYSTEM_SMILIES_ON}><{/if}>"
                                                                          title="<{if $smilies.display}><{$smarty.const._AM_SYSTEM_SMILIES_OFF}><{else}><{$smarty.const._AM_SYSTEM_SMILIES_ON}><{/if}>"/>
                </td>
                <td class="xo-actions txtcenter width10">
                    <a class="" href="admin.php?fct=smilies&amp;op=edit_smilie&amp;smilies_id=<{$smilies.smilies_id}>" data-toggle="tooltip"
                       title="<{$smarty.const._AM_SYSTEM_SMILIES_EDIT}>">
                        <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._AM_SYSTEM_SMILIES_EDIT}>"/>
                    </a>
                    <a class="" href="admin.php?fct=smilies&amp;op=smilies_delete&amp;smilies_id=<{$smilies.smilies_id}>" data-toggle="tooltip"
                       title="<{$smarty.const._AM_SYSTEM_SMILIES_DELETE}>">
                        <img src="<{xoAdminIcons delete.png}>" alt="<{$smarty.const._AM_SYSTEM_SMILIES_DELETE}>"/>
                    </a>
                </td>
            </tr>
        <{/foreach}>
        </tbody>
    </table>
    </div>
    <{if $nav_menu}>
        <!-- Display smilies navigation -->
        <div class="card-footer">
        <div class="xo-avatar-pagenav float-right"><{$nav_menu}></div>
        </div>
    <{/if}>
</div>
<{/if}>
<!-- Display smilies form (add,edit) -->
<{if $form}>
    <div class="spacer"><{$form}></div>
<{/if}>
