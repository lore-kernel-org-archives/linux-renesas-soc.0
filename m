Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:57516 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752712AbdIFK7e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 06:59:34 -0400
Subject: Re: [PATCH 3/8] spi: sh-msiof: Fix MSIOF address for DMAC
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ryo Kataoka <ryo.kataoka.wt@renesas.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
References: <20170906070507.26223-1-dirk.behme@de.bosch.com>
 <20170906070507.26223-4-dirk.behme@de.bosch.com>
 <CAMuHMdXu6t5StNB8jy2uGiJ1YLuQEHO7Kz4+PoihkaZnmLe8YA@mail.gmail.com>
 <df19487c-14e3-75e5-521c-0140768b1f9d@de.bosch.com>
 <CAMuHMdXimyHd3Egy0tja2Zst-8Ok_BwdTv7fg1_eYSb1j5XBjA@mail.gmail.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <b408d4a1-2ccf-a1dc-d4f0-d5908d8cf731@de.bosch.com>
Date: Wed, 6 Sep 2017 12:59:31 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXimyHd3Egy0tja2Zst-8Ok_BwdTv7fg1_eYSb1j5XBjA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06.09.2017 12:42, Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> On Wed, Sep 6, 2017 at 12:09 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> On 06.09.2017 11:22, Geert Uytterhoeven wrote:
>>> On Wed, Sep 6, 2017 at 9:05 AM, Dirk Behme <dirk.behme@de.bosch.com>
>>> wrote:
>>>>
>>>> From: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
>>>>
>>>> MSIOF Base Address H'E6xx can be accessed by CPU and DMAC.
>>>> MSIOF Base Address H'E7xx for DMAC was removed from H/W manual.
>>>>
>>>> Signed-off-by: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
>>>> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>>>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>>>
>>>
>>> NAKed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>
>>> The MSIOF Base Address for DMAC was removed only from the R-Car Gen2/Gen3
>>> manuals. It still affects e.g. R-Mobile APE6.
>>
>> Do we have a nice run time detection for that?
> 
> The current driver code just looks at the DTS, cfr. the comment:
> 
>      /* The DMA engine uses the second register set, if present */


Ok, yes, thanks.

So this patch is completely superfluous, even in the BSP, correct?

Will drop it for the next round, hoping that it doesn't result in too 
much rebase hassle ;)

Best regards

Dirk
