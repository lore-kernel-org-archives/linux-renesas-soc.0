Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www1246.sakura.ne.jp ([219.94.162.56]:24915 "EHLO
        www1246.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757202AbcILJZO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2016 05:25:14 -0400
Message-ID: <57D67476.3030908@jinso.co.jp>
Date: Mon, 12 Sep 2016 18:25:10 +0900
From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Xuan Truong Nguyen <nx-truong@jinso.co.jp>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@sang-engineering.com>
Subject: Re: GEN2: Initialization of VSP1 failed at upstream v4.8-rc2
References: <57A46D20.7040106@jinso.co.jp> <57C9764F.2070802@jinso.co.jp> <f2bb791e-8973-10a9-a2ac-1a944b38d4ad@jinso.co.jp> <57D66DEC.4090607@jinso.co.jp> <CAMuHMdWouXw1Cen8wyoHFHEYQpOvwOg3gLGpA2VtDUerk1iqbg@mail.gmail.com>
In-Reply-To: <CAMuHMdWouXw1Cen8wyoHFHEYQpOvwOg3gLGpA2VtDUerk1iqbg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thanks for your quick reply!

>> As you know the information about Initialization of VSP1 failed at upstream
>> v4.8-rc2
>>   from the report of "The failure summary report of GEN2 for Linux v4.8-rc2".
>> "[    5.237049] vsp1: probe of fe920000.vsp1 failed with error -38
>> [    5.254664] vsp1: probe of fe928000.vsp1 failed with error -38
>> [    5.272277] vsp1: probe of fe930000.vsp1 failed with error -38
>> [    5.289891] vsp1: probe of fe938000.vsp1 failed with error -38"
>>
>> I have found the patch that causing of this issue:
>> "94fcdf8 [media] v4l: vsp1: Add FCP support"
>>
>> In this patch,
>>
>> "@@ -528,7 +533,7 @@ static int vsp1_pm_runtime_resume(struct device *dev)
>>                          return ret;
>>          }
>>
>> -       return 0;
>> +       return rcar_fcp_enable(vsp1->fcp);
>>   }"
>>
>> vsp1_pm_runtime_resume() function should be returned "0" if it success.
>> I tried to debug this place, and I realize that the rcar_fcp_enable()
>> function returned "-38" during Initialization.
>> That's why the error message occurs.
>> We know that the rcar_fcp_enable() function also returns 0 on success or a
>> negative error code if an error occurs.
>> So, I am thinking of something just before it happens.
> Please see commits d0cd1e773fee06ed "[media] rcar-fcp: Make sure
> rcar_fcp_enable() returns 0 on success" in renesas-drivers and ba75faf43dc60744
> in media-next.
>
> But we indeed need this fix in v4.8, not v4.9.
Thanks for your fixed patch.
I'll re-confirm it on my environment.
Sorry for the late investigation.


Best regards,
Hiep.


> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
>
