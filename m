Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:57471 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbeJWJUz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Oct 2018 05:20:55 -0400
Subject: Re: [PATCH] drm: rcar-du: Re-update the DSYSR register value for
 start/stop
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
References: <1540189854-14726-1-git-send-email-na-hoan@jinso.co.jp>
 <41a8932e-74a3-3225-5243-11df5c3923c8@cogentembedded.com>
From: Hoan <na-hoan@jinso.co.jp>
Message-ID: <d98f256c-5445-f33f-fdd7-da13d923ce2b@jinso.co.jp>
Date: Tue, 23 Oct 2018 09:59:55 +0900
MIME-Version: 1.0
In-Reply-To: <41a8932e-74a3-3225-5243-11df5c3923c8@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear Sergei Shtylyov-san

On 2018/10/22 17:21, Sergei Shtylyov wrote:
> Hello!
>
> On 22.10.2018 9:30, Nguyen An Hoan wrote:
>
>> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>>
>> From previous commit 0521ccb "drm: rcar-du: Cache DSYSR value to 
>> ensure known initial value"
>
>    When you cite an commit, at least 12 digits of SHA1 are needed, and 
> the summary needs to enclosed in (""), no just "".
>
>> We only need to update DSYSR0, DSYSR2 for start/stop. So using rgrp-> 
>> mmio_offset is enough,
>> the change back from rcar_du_crtc -> rcar_du_group -> rcar_du_crtc 
>> leading to
>> mmio addresses for DSYSR may be different.
>>
>> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
>> ---
>>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c 
>> b/drivers/gpu/drm/rcar-du/rcar_du_group.c
>> index d85f0a1..a5f7eed 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
>> @@ -202,10 +202,9 @@ void rcar_du_group_put(struct rcar_du_group *rgrp)
>>
>>  static void __rcar_du_group_start_stop(struct rcar_du_group *rgrp, 
>> bool start)
>>  {
>> -    struct rcar_du_crtc *rcrtc = &rgrp->dev->crtcs[rgrp->index * 2];
>> -
>> -    rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN,
>> -                   start ? DSYSR_DEN : DSYSR_DRES);
>
>    The continuation line indentation style used above is different 
> from yours below.
> would be preferable to keep the existing style...

Thank you for the comments, and the notes to me about code rules.
I note and improve for the next time, thank you!

Hoan.

>
>> +    rcar_du_group_write(rgrp, DSYSR,
>> +            (rcar_du_group_read(rgrp, DSYSR) & ~(DSYSR_DRES | 
>> DSYSR_DEN)) |
>> +            (start ? DSYSR_DEN : DSYSR_DRES));
>>  }
>>
>>  void rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
>
> MBR, Sergei
>
>
