Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:45538 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751943AbcFJVHi (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 10 Jun 2016 17:07:38 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	koji.matsuoka.xm@renesas.com, yoshihiro.shimoda.uh@renesas.com,
	naoya.shiiba.nx@renesas.com, ryo.kodama.vz@renesas.com,
	hiroyuki.yokoyama.vx@renesas.com, yoshifumi.hosoya.wj@renesas.com,
	takeshi.kihara.df@renesas.com, toshiaki.komatsu.ud@renesas.com,
	harunobu.kurokawa.dn@renesas.com, ryusuke.sakato.bx@renesas.com,
	tomoharu.fukawa.eb@renesas.com, kouei.abe.cp@renesas.com,
	khiem.nguyen.xt@rvc.renesas.com, hien.dang.eb@rvc.renesas.com
Subject: Re: [PATCH 0/2 v2] drm: rcar-du: EPROBE_DEFER case doesn't need error message
Date: Sat, 11 Jun 2016 00:07:39 +0300
Message-ID: <5002707.qZXOcdY7RP@avalon>
In-Reply-To: <87r3crkme9.wl%kuninori.morimoto.gx@renesas.com>
References: <redmine.issue-77851.20151006064038@dm.renesas.com> <redmine.journal-710718.20160523104049.392ea8e63d81580c@dm.renesas.com> <87r3crkme9.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Wednesday 25 May 2016 00:38:48 Kuninori Morimoto wrote:
> Hi David, Laurent
> 
> These removes unneeded error message from Renesas DU driver.
> Current this unneeded error message makes user confuse.

Thank you for the patches. For both of them,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I've applied them to my tree and include them in my next pull request.

> Kuninori Morimoto (2):
>       drm: rcar-du: error message is not needed for drm_vblank_init()
>       drm: rcar-du: error message is not needed for EPROBE_DEFER
> 
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

-- 
Regards,

Laurent Pinchart
