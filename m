Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:46237 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756229AbcHCWTJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 3 Aug 2016 18:19:09 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hiep Cao Minh <cm-hiep@jinso.co.jp>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	Sakato Ryusuke <ryusuke.sakato.bx@renesas.com>,
	kuninori morimoto <kuninori.morimoto.gx@renesas.com>,
	yoshihiro shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?utf-8?B?56iy5ZCJ77ya5Lq644K9?= <h-inayoshi@jinso.co.jp>,
	Nguyen Viet Dung <nv-dung@jinso.co.jp>
Subject: Re: Rcar Gen2: DU: Bootlogs Error and show image error
Date: Thu, 04 Aug 2016 01:19:11 +0300
Message-ID: <3113779.bJapWnjrrK@avalon>
In-Reply-To: <5771D098.5000706@jinso.co.jp>
References: <1447337532-18258-1-git-send-email-geert+renesas@glider.be> <56725823.5080003@jinso.co.jp> <5771D098.5000706@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Hiep-san,

(Dropping the linux-sh mailing list and adding linux-renesas-soc)

On Tuesday 28 Jun 2016 10:19:20 Hiep Cao Minh wrote:
> Hi Laurent-san
> 
> Sorry to bother you again!
> I would like to confirm the fixed patch for this issue on Lager.
> I have retested it on Lager(Rcar-H2), The issue still happens at the
> Linux upstream version v4.7-rc2
> Have you released the fixed patch?
> Please tell me the version and test method if you have already released it.
> I resent the damage image when displaying it on the HDMI screen.

I've finally been able to test the problem you have reported on the Lager 
board.

There is a new issue introduced in the current merging window that completely 
breaks HDMI output on Lager. I have posted a fix to the dri-devel and linux-
renesas-soc mailing lists under the subject "[PATCH] drm: rcar-du: Link HDMI 
encoder with bridge". I will make sure that it lands in v4.8 (hopefully in 
v4.8-rc1, but it might have to wait for v4.8-rc2).

With the fix applied to Linus' latest master branch (the commid ID I used is 
f7b32e4c021fd788f13f6785e17efbc3eb05b351) HDMI output works properly on Lager 
for me. Running your test application displays the image correctly on my 
screen.

Could you check whether you can reproduce the problem with the latest kernel ?

-- 
Regards,

Laurent Pinchart
