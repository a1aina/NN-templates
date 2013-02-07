

<style type="text/css">
/* This is the default styling for all Tooltipsters: */
.tooltip-message {
	background-color: #FFFFEC;
	border: 1px solid #666666;
	box-shadow: inset 0px 1px 0px #fff;
	color: #595959;
	font-family: Calibri;
	font-size: 12px;
	line-height: 12px;
	position: absolute;
	padding: 6px;
	border-radius: 4px;
	text-align: left;
	z-index: 9999999;
	pointer-events: none;
	width: auto;
	overflow: visible;
	-webkit-box-shadow: 1px 1px 12px 1px rgba(0, 0, 0, .9);
	box-shadow: 1px 1px 12px 1px rgba(0, 0, 0, .9);
}

/* When you want to create a second class for your Tooltipster messages, copy (or modify) this template and add your style to it. Don't forget to refer to it in your Tooltipster settings (tooltipClass: '.my-custom-theme') */
.my-custom-theme {
	position: absolute;
	text-align: center; 
	z-index: 9999999; 
	pointer-events: none;
	width: auto;
	/* Start styling here... */
}

/* Add a slight border radius to all images inside the Tooltipsters */
.tooltip-message img {
	border-radius: 2px;
}

/* These next classes handle the styles for the little arrow attached to the tooltip. If you need to change the color of the arrow to match a custom Tooltipster theme, set it in your Tooltipster settings (arrowColor: '#yourcolor') */
.tooltip-arrow {
	display: block;
	text-align: center;
	font-size: 12px;
	line-height: 12px;
	width: 100%;
	height: 5px;
	position: absolute;
	left: 0px;
	z-index: -1;
	text-shadow: 0px 2px 0px #dadada, 0px 1px 0px #dadada;

}
.tooltip-arrow-top {
	bottom: -3px;
	margin: 0 auto;
	text-align: center;
}
.tooltip-arrow-top-right {
	bottom: -3px;
	margin-left: -10px;
	text-align: right;
}
.tooltip-arrow-top-left {
	bottom: -3px;
	margin-left: 10px;
	text-align: left;
}
.tooltip-arrow-bottom {
	top: -10px;
	margin: 0 auto;
	text-align: center;
}
.tooltip-arrow-bottom-right {
	top: -10px;
	margin-left: -10px;
	text-align: right;
}
.tooltip-arrow-bottom-left {
	top: -10px;
	margin-left: 10px;
	text-align: left;
}
.tooltip-arrow-left {
	top: 0px;
	right: -18px;
	margin: 0 auto;
	text-align: right;
}
.tooltip-arrow-right {
	top: 0px;
	left: -8px;
	margin: 0 auto;
	text-align: left;
}

/* Some styling to enable the slide animation */
.tooltip-slide {
	height: 0px;
	position: absolute;
	width: auto;
	z-index: 9999999;
	overflow: hidden;
}


</style>

	{assign var=foo value="http://192.168.0.11:8001/rss?t=2040&dl=0&i=1&r=ae240f2dea2c36042b3726965452a4c8&num=90?v=1"}<p>


	{$rss=simplexml_load_file({$foo})}

	<div id="imagerow"  style="float:left;"><div id=rheader >Latest HD Movies </div><center><ul>

	 <div style="margin-left: 20px;">

	{foreach $rss->channel->item as $a} 

		{assign var=mytitle value={$a->mymovietitle}}
			


		<li style="float:left;">
		<div style="float:left;"> 

			<table  border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						 <a href="{$a->link}"><img class="tooltip" src="{$a->imagepath}" title="<b><h4>{$mytitle|replace:'.':' '|substr:0:35}</h4></b>Year: <b>{$a->movieyear}</b><br>Rating: {$a->imdbrating}<br>Size: {$a->moviesize}<br><BR>{$a->movieplot}"></a>
					</td>
				</tr>

				<tr id="{$a->movieguid}">
					<td>
				                <div class="icon icon_nzb"><a title="Download Nzb" href="{$smarty.const.WWW_TOP}/getnzb/{$release.guid}/{$release.searchname|escape:"url"}">&nbsp;</a></div>
				                <div class="icon icon_cart" title="Add to Cart"></div>
				                {if $sabintegrated}<div style="padding-bottom: 14px;" class="icon icon_sab" title="Send to my Sabnzbd"></div>{/if}
        				</td>
				</tr>

					</table>
				</div>
		</li>



	{/foreach}</div>
	<p>
	</ul></center></div>

