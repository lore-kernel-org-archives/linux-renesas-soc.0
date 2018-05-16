Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:44524 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750806AbeEPRHt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 13:07:49 -0400
Received: by mail-wr0-f193.google.com with SMTP id y15-v6so2238383wrg.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 May 2018 10:07:49 -0700 (PDT)
Subject: Re: [PATCH 2/5] drm: rcar-du: lvds: Add R8A77995 support
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1526386840-15368-3-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20180516075419.lpwb2yusthmm74mx@verge.net.au>
 <cd2ca96a-cfc6-bf34-6c4d-299798d9f8ea@cogentembedded.com>
 <CAO3366xBh50=QFBYE-JrWcG092EvQFBoi-KYW8k+dBbWwMJo3w@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <121c4b43-5dfe-3970-3c9b-d1cb6af1d0eb@cogentembedded.com>
Date: Wed, 16 May 2018 20:07:46 +0300
MIME-Version: 1.0
In-Reply-To: <CAO3366xBh50=QFBYE-JrWcG092EvQFBoi-KYW8k+dBbWwMJo3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/16/2018 04:06 PM, Ulrich Hecht wrote:

>>>> Add support for the R-Car D3 (R8A77995) SoC to the LVDS encoder driver.
>>>>
>>>> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>>>> ---
>>>>   drivers/gpu/drm/rcar-du/rcar_lvds.c | 6 ++++++
>>>>   1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c
>>>> b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>>>> index 3d2d3bb..58fb9f8 100644
>>>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>>>> @@ -511,6 +511,11 @@ static const struct rcar_lvds_device_info
>>>> rcar_lvds_r8a77970_info = {
>>>>         .quirks = RCAR_LVDS_QUIRK_GEN2_PLLCR | RCAR_LVDS_QUIRK_GEN3_LVEN,
>>>>   };
>>>>   +static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
>>>> +       .gen = 3,
>>>> +       .quirks = RCAR_LVDS_QUIRK_GEN3_LVEN,
>>>> +};
>>>
>>>
>>> This new structure seems to be identical to rcar_lvds_r8a77970_info.
>>
>>> Could we consolidate somehow?
>>
>>    In my book, that one has 2 quirk flags. What tree are you looking at?
> 
> IIRC the other one was for the PLL, which is not supported yet.

   V3M PLL is surely supported and it's surely different from D3 one. My point 
was that r8a77970 data can't be reused...

> CU
> Uli

MBR, Sergei
