Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:45490 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751151AbeEPNGr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 09:06:47 -0400
Received: by mail-oi0-f66.google.com with SMTP id b130-v6so603037oif.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 May 2018 06:06:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cd2ca96a-cfc6-bf34-6c4d-299798d9f8ea@cogentembedded.com>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1526386840-15368-3-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20180516075419.lpwb2yusthmm74mx@verge.net.au> <cd2ca96a-cfc6-bf34-6c4d-299798d9f8ea@cogentembedded.com>
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Date: Wed, 16 May 2018 15:06:45 +0200
Message-ID: <CAO3366xBh50=QFBYE-JrWcG092EvQFBoi-KYW8k+dBbWwMJo3w@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm: rcar-du: lvds: Add R8A77995 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 16, 2018 at 10:59 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Hello!
>
> On 5/16/2018 10:54 AM, Simon Horman wrote:
>
>>> Add support for the R-Car D3 (R8A77995) SoC to the LVDS encoder driver.
>>>
>>> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>>> ---
>>>   drivers/gpu/drm/rcar-du/rcar_lvds.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c
>>> b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>>> index 3d2d3bb..58fb9f8 100644
>>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
>>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>>> @@ -511,6 +511,11 @@ static const struct rcar_lvds_device_info
>>> rcar_lvds_r8a77970_info = {
>>>         .quirks = RCAR_LVDS_QUIRK_GEN2_PLLCR | RCAR_LVDS_QUIRK_GEN3_LVEN,
>>>   };
>>>   +static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
>>> +       .gen = 3,
>>> +       .quirks = RCAR_LVDS_QUIRK_GEN3_LVEN,
>>> +};
>>
>>
>> This new structure seems to be identical to rcar_lvds_r8a77970_info.
>
>> Could we consolidate somehow?
>
>    In my book, that one has 2 quirk flags. What tree are you looking at?

IIRC the other one was for the PLL, which is not supported yet.

CU
Uli
