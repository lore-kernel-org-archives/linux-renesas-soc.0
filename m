Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33945 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbeLEM5v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 07:57:51 -0500
Subject: Re: [PATCH v2 1/2] spi: Add Renesas R-Car Gen3 RPC SPI controller
 driver
To: Geert Uytterhoeven <geert@linux-m68k.org>, masonccyang@mxic.com.tw
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>, zhengxunli@mxic.com.tw
References: <1543828720-18345-1-git-send-email-masonccyang@mxic.com.tw>
 <1543828720-18345-2-git-send-email-masonccyang@mxic.com.tw>
 <cebe44a3-80be-9091-e70b-acba6f3fff4f@gmail.com>
 <OF0ED3C578.141B72CA-ON4825835A.0025CA62-4825835A.002A7BDF@mxic.com.tw>
 <CAMuHMdXS_039E6F3=+UgfE_KgJcwmVvA-zPraOiQPUXMEwck2A@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <4b06ed22-8711-6700-056b-c66799d0e616@gmail.com>
Date: Wed, 5 Dec 2018 13:35:34 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXS_039E6F3=+UgfE_KgJcwmVvA-zPraOiQPUXMEwck2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/05/2018 10:11 AM, Geert Uytterhoeven wrote:
> Hi Mason,
> 
> On Wed, Dec 5, 2018 at 8:44 AM <masonccyang@mxic.com.tw> wrote:
>>> "Marek Vasut" <marek.vasut@gmail.com>
>>> 2018/12/05 上午 10:04
>>> On 12/03/2018 10:18 AM, Mason Yang wrote:
>>>> Add a driver for Renesas R-Car Gen3 RPC SPI controller.
>>>>
>>>> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> 
>>>> +static u8 rpc_bits_xfer(u32 nbytes)
>>>> +{
>>>> +   if (nbytes > 4)
>>>> +      nbytes = 4;
>>>
>>> Use clamp() ?
>>>
>>
>> nbytes = clamp(nbytes, 1, 4);
>>
>> got many warnings, something like,
>> ./include/linux/kernel.h:845:29: warning: comparison of distinct pointer types lacks a cast
> 
> You can either make the constants unsigned (1U and 4U), or
> use clamp_t(u32, ...).
> 
>>>> +         rpc->smenr |= RPC_SMENR_SPIDE(rpc_bits_xfer
>>>> +               (op->data.nbytes)) | RPC_SMENR_SPIDB
>>>> +               (fls(op->data.buswidth >> 1));
>>>
>>> Drop parenthesis around fls()
>>
>> ?
>> no way.
> 
> Please split the line before RPC_SMENR_SPIDB, and join the next line
> with the parameters, so it becomes obvious the parentheses are needed
> because RPC_SMENR_SPIDB() is a macro taking parameters.

Oh, I didn't notice that, right.

-- 
Best regards,
Marek Vasut
