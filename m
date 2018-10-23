Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:58138 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbeJWJWT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Oct 2018 05:22:19 -0400
Subject: Re: [PATCH] drm: rcar-du: Re-update the DSYSR register value for
 start/stop
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
References: <1540189854-14726-1-git-send-email-na-hoan@jinso.co.jp>
 <35008313.pubLakprOv@avalon>
From: Hoan <na-hoan@jinso.co.jp>
Message-ID: <8c596c7e-608b-dc99-cead-f2fb85c6d132@jinso.co.jp>
Date: Tue, 23 Oct 2018 10:01:19 +0900
MIME-Version: 1.0
In-Reply-To: <35008313.pubLakprOv@avalon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear Laurent-san

Thank you for your reply and comments!

On 2018/10/22 20:23, Laurent Pinchart wrote:
> Hello Hoan,
>
> Thank you for the patch.
>
> On Monday, 22 October 2018 09:30:54 EEST Nguyen An Hoan wrote:
>> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>>
>>  From previous commit 0521ccb "drm: rcar-du: Cache DSYSR value to ensure
>> known initial value"
> What exact commit are you referring to ? The mainline commit that has this
> subject is 9144adc5e5a99577bce0d4ee2ca3615f53b9d296.
Seems I have cited the wrong Commit-ID、it is

9144adc5e5a99577bce0d4ee2ca3615f53b9d296
drm: rcar-du: Cache DSYSR value to ensure known initial value

>> We only need to update DSYSR0, DSYSR2 for start/stop.
>> So using rgrp-> mmio_offset is enough, the change back from rcar_du_crtc ->
>> rcar_du_group -> rcar_du_crtc leading to mmio addresses for DSYSR may be
>> different.
> Is this fixing an actual problem ? If you look at the code, the line
>
> 	struct rcar_du_crtc *rcrtc = &rgrp->dev->crtcs[rgrp->index * 2];
>
> makes sure that we select DU0 or DU2 only, so the register write
>
> 	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN,
> 				   start ? DSYSR_DEN : DSYSR_DRES);
>
> should only access DSYSR0 and DSYSR2.

This seems I think to fix the rcar-du problem with M3N-r8a77965,

With M3N-R8a77965 we have DU0, DU1, DU3
So, when Laurent-san divide objetcs into rcar_du_group, rcar_du_crtc.

DU0, DU1 -> du_group[0]  rgrp-> mmio_offset = DU0_REG_OFFSET
DU3->du_group[1] and rgrp-> mmio_offset = DU2_REG_OFFSET, but  
rcrtc->mmio_offset=DU3_REG_OFFSET (with M3N)

M3N-R8a77965 not have DU2, So after the command:

struct rcar_du_crtc *rcrtc = &rgrp->dev->crtcs[rgrp->index * 2];

So in fact, with M3N we are updating DSYSR3 (In this my TC, this 
reference to start/stop DU3-RGB)

This will not affect H3, since the H3 lines always have enough DU0, 
DU1,DU2,DU3.

Thank you very much !

Hoan.
