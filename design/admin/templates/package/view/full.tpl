{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{let package=fetch( package,item,
                    hash( package_name, $package_name,
                          repository_id, $repository_id ) )}

<div id="package" class="viewfull">
    <div id="pn-{$package.name|wash}" class="pt-{$package.type|wash}">


{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">
<h1 class="context-title">
        {$package.name|wash}-{$package.version-number}-{$package.release-number}{section show=$package.release-timestamp}({$package.release-timestamp|l10n( shortdatetime )}){/section}{section show=$package.type|wash} [{$package.type}]{/section}
        - {section show=$package.install_type|eq( 'install' )}
            {section show=$package.is_installed}
                {'Installed'|i18n('design/admin/package')}
            {section-else}
                {'Not installed'|i18n('design/admin/package')}
            {/section}
        {section-else}
            {'Imported'|i18n('design/admin/package')}
        {/section}
</h1>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">

<div class="context-attributes">

    <form method="post" action={concat( 'package/view/full/', $package.name )|ezurl}>

    <div class="object">

        <table>
        <tr>
        <td>

        <div class="summary">
            <label>{'Summary'|i18n('design/admin/package')}</label>
            <p>{$package.summary|wash}</p>
        </div>

        <div class="state">
            <label>{'State'|i18n('design/admin/package')}</label>
            <p>{$package.state|wash}</p>
        </div>

        <div class="licence">
            <label>{'Licence'|i18n('design/admin/package')}</label>
            <p>{$package.licence|wash}</p>
        </div>

        <div class="maintainers">
            <label>{'Maintainers'|i18n('design/admin/package')}</label>
            <p>
                {section var=maintainer loop=$package.maintainers}
                    <a href="mailto:{$maintainer.item.email}" subject="{"Regarding eZ publish package '%packagename'"|i18n('design/admin/package',,hash( '%packagename', $package.name ) )}" title="{'Send e-mail to the maintainer'|i18n('design/admin/package')}">{$maintainer.item.name|wash}</a> ({$maintainer.item.role|wash})
                {delimiter}, {/delimiter}
                {/section}
            </p>
        </div>

        <div class="description">
            <label>{'Description'|i18n('design/admin/package')}</label>
            <p>{$package.description}</p>
        </div>

        <div class="documents">
            <label>{'Documents'|i18n('design/admin/package')}</label>
            <p>
                {section var=document loop=$package.documents}
                {let document_path=$package|ezpackage( documentpath, $document.name )}
                    {section show=$document_path}<a href={$document_path|ezroot}>{/section}{$document.name|wash}{section show=$document_path}</a>{/section}
                {/let}
                {delimiter}, {/delimiter}
                {/section}
            </p>
        </div>

        <div class="changelog">
            <label>{'Changelog'|i18n('design/admin/package')}</label>
            <p>
                {section var=log loop=$package.changelog}
                    <h3><p class="byline"><em class="date">({$log.item.timestamp|l10n( shortdatetime )})</em> <a href="mailto:{$log.item.email}" subject="{"Regarding eZ publish package '%packagename'"|i18n('design/admin/package',,hash( '%packagename', $package.name ) )}" title="{'Send e-mail to the maintainer'|i18n('design/admin/package')}">{$log.item.person|wash}</a></p></h3>
                    <ul>
                    {section var=change loop=$log.item.changes}
                    <li>
                        {$change.item|wash}
                    </li>
                    {/section}
                    </ul>
                {delimiter}<hr/> {/delimiter}
                {/section}
            </p>
        </div>

        </td>

        <td valign="top">
            {let thumbnail_list=$package.thumbnail-list}
            {section show=$thumbnail_list}
            <div class="thumbnail">
                <img src={concat( $package|ezpackage( fileitempath, $thumbnail_list[0] ) )|ezroot} alt="{$thumbnail_list[0].name|wash}" />
            </div>
            {/section}
            {/let}
        </td>

        </tr>
        </table>

    </div>

    <div class="links">
        {section show=$package.file-count|gt( 0 )}
        <p>[ <a href={concat( "package/view/files/", $package.name )|ezurl}>{'File list'|i18n('design/admin/package')}</a> ]</p>
        {/section}
    </div>

    </div>
    {* DESIGN: Content END *}</div></div></div>

    <div class="controlbar">
    {* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-tc"><div class="box-bl"><div class="box-br">


    {section show=$package.can_export}
    <div class="block">
        {section show=$package.install_type|eq( 'install' )}
            {section show=$package.is_installed}
                <input class="button" type="submit" name="UninstallButton" value="{'Uninstall'|i18n( 'design/admin/package')}" />
            {section-else}
                <input class="button" type="submit" name="InstallButton" value="{'Install'|i18n( 'design/admin/package')}" />
            {/section}
        {/section}
        <input class="button" type="submit" name="ExportButton" value="{'Export to file'|i18n( 'design/admin/package')}" />
    </div>
    {/section}

    </form>

    </div>
    {* DESIGN: Control bar END *}</div></div></div></div></div></div>


    </div>
</div>

{/let}
