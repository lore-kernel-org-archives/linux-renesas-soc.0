Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www1246.sakura.ne.jp ([219.94.162.56]:12799 "EHLO
	www1246.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754373AbcHDGyh (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 02:54:37 -0400
Subject: Re: Rcar Gen2: DU: Bootlogs Error and show image error
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1447337532-18258-1-git-send-email-geert+renesas@glider.be>
 <56725823.5080003@jinso.co.jp> <5771D098.5000706@jinso.co.jp>
 <3113779.bJapWnjrrK@avalon>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	Sakato Ryusuke <ryusuke.sakato.bx@renesas.com>,
	kuninori morimoto <kuninori.morimoto.gx@renesas.com>,
	yoshihiro shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?UTF-8?B?56iy5ZCJ77ya5Lq644K9?= <h-inayoshi@jinso.co.jp>,
	Nguyen Viet Dung <nv-dung@jinso.co.jp>
From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
Message-ID: <8abaedaa-04e3-824c-27a3-cafebbf16b4e@jinso.co.jp>
Date: Thu, 4 Aug 2016 15:54:29 +0900
MIME-Version: 1.0
In-Reply-To: <3113779.bJapWnjrrK@avalon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Laurent-san,

Thanks for your reply!

>> Hi Laurent-san
>>
>> Sorry to bother you again!
>> I would like to confirm the fixed patch for this issue on Lager.
>> I have retested it on Lager(Rcar-H2), The issue still happens at the
>> Linux upstream version v4.7-rc2
>> Have you released the fixed patch?
>> Please tell me the version and test method if you have already released it.
>> I resent the damage image when displaying it on the HDMI screen.
> I've finally been able to test the problem you have reported on the Lager
> board.
>
> There is a new issue introduced in the current merging window that completely
> breaks HDMI output on Lager. I have posted a fix to the dri-devel and linux-
> renesas-soc mailing lists under the subject "[PATCH] drm: rcar-du: Link HDMI
> encoder with bridge". I will make sure that it lands in v4.8 (hopefully in
> v4.8-rc1, but it might have to wait for v4.8-rc2).
>
> With the fix applied to Linus' latest master branch (the commid ID I used is
> f7b32e4c021fd788f13f6785e17efbc3eb05b351) HDMI output works properly on Lager
> for me. Running your test application displays the image correctly on my
> screen.
>
> Could you check whether you can reproduce the problem with the latest kernel ?
Thanks for your patch!,
Currently, I could not confirm your patch on latest kernel v4.7 because 
of source code is unsupported
So I might to wait for  a newer version of Linux mainline.
I also have tried to put it on renesas-drivers latest version, but It is 
the same Linux mainline version.

Could you please tell me the other kernel version that the patch 
comfirmation is possible?.

Thank you!.
Jinso/Hiep.
