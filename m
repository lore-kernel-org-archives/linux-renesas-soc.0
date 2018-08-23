Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:37787 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbeHWOMV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 10:12:21 -0400
Received: by mail-io0-f194.google.com with SMTP id v14-v6so3908956iob.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Aug 2018 03:43:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0021705d-a647-20ce-7314-d9830f02ea0a@cogentembedded.com>
References: <d5574b7b-9bb6-1f24-f2b4-2036c66a2924@cogentembedded.com>
 <20180822193844.tefn3ky2vlskfcwd@katana> <0309adb6-c261-f9cf-528b-208950db208f@cogentembedded.com>
 <20180822194505.xqji57ef4oy3ciit@katana> <0021705d-a647-20ce-7314-d9830f02ea0a@cogentembedded.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Aug 2018 12:43:14 +0200
Message-ID: <CAPDyKFrGyNi1HeLSUWfr8-8Rsgr=wWHYvLa7YeaGp=0hXZQv9Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: fix #define RST_RESERVED_BITS
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 22 August 2018 at 22:03, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 08/22/2018 10:45 PM, Wolfram Sang wrote:
>
>>>>> The DM_CM_RST register actually has bits 0-31 defaulting to 1s and bits
>>>>> 32-63 defaulting to 0s -- fix off-by-one in #define RST_RESERVED_BITS.
>>>>>
>>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>>
>>>> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>>
>>>> Suggesting stable.
>>>
>>>    Stable looks at the Fixes: tags now. Should I add that?
>>
>> Yes, that would be great IMHO.
>
> Fixes: 2a68ea7896e3 ("mmc: renesas-sdhi: add support for R-Car Gen3 SDHI DMAC")
>
>    Hopefully, Ulf uses patchwork. :-)

I do. However, fixes tags doesn't seem to get picked up. Anyway, it's
easy for me to add them.

Applied for fixes, thanks!

Kind regards
Uffe
