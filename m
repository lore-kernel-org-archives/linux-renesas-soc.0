Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36874 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731021AbeHWOpy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 10:45:54 -0400
Received: by mail-lf1-f66.google.com with SMTP id j8-v6so3782562lfb.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Aug 2018 04:16:40 -0700 (PDT)
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: fix #define
 RST_RESERVED_BITS
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <d5574b7b-9bb6-1f24-f2b4-2036c66a2924@cogentembedded.com>
 <20180822193844.tefn3ky2vlskfcwd@katana>
 <0309adb6-c261-f9cf-528b-208950db208f@cogentembedded.com>
 <20180822194505.xqji57ef4oy3ciit@katana>
 <0021705d-a647-20ce-7314-d9830f02ea0a@cogentembedded.com>
 <CAPDyKFrGyNi1HeLSUWfr8-8Rsgr=wWHYvLa7YeaGp=0hXZQv9Q@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5914aa75-f0e0-6f2c-0912-94d39e318ca1@cogentembedded.com>
Date: Thu, 23 Aug 2018 14:16:37 +0300
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrGyNi1HeLSUWfr8-8Rsgr=wWHYvLa7YeaGp=0hXZQv9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/23/2018 01:43 PM, Ulf Hansson wrote:

>>>>>> The DM_CM_RST register actually has bits 0-31 defaulting to 1s and bits
>>>>>> 32-63 defaulting to 0s -- fix off-by-one in #define RST_RESERVED_BITS.
>>>>>>
>>>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>>>
>>>>> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>>>
>>>>> Suggesting stable.
>>>>
>>>>    Stable looks at the Fixes: tags now. Should I add that?
>>>
>>> Yes, that would be great IMHO.
>>
>> Fixes: 2a68ea7896e3 ("mmc: renesas-sdhi: add support for R-Car Gen3 SDHI DMAC")
>>
>>    Hopefully, Ulf uses patchwork. :-)
> 
> I do. However, fixes tags doesn't seem to get picked up. Anyway, it's

   I figured after writing... only patchwork.ozlabs.org seems to pick those up.

> easy for me to add them.
> 
> Applied for fixes, thanks!

   Thank you!

> Kind regards
> Uffe

MBR, Sergei
