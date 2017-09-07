Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:37260 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754068AbdIGIlP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Sep 2017 04:41:15 -0400
Subject: Re: [PATCH 4/8] spi: sh-msiof: Fix DMA completion
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ryo Kataoka <ryo.kataoka.wt@renesas.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
References: <20170906070507.26223-1-dirk.behme@de.bosch.com>
 <20170906070507.26223-5-dirk.behme@de.bosch.com>
 <CAMuHMdW=AA03BLMXO8EpBBx3gdd13VPrjhL1gsEgZR2msYBkcQ@mail.gmail.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <40ef3c01-983d-b80d-59d4-085a7b7d8f13@de.bosch.com>
Date: Thu, 7 Sep 2017 10:41:13 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW=AA03BLMXO8EpBBx3gdd13VPrjhL1gsEgZR2msYBkcQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07.09.2017 10:33, Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> On Wed, Sep 6, 2017 at 9:05 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> From: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
>>
>> When reception DMA completes before transmission DMA, next transmission
>> DMA may not be able to start. This patch adds wait_for_completion_timeout()
>> to both of reception DMA and transmission DMA.
>>
>> If the driver waits only for the Rx DMA completion, the Tx DMA completion
>> thread of DMA Engine may be still processing.
>>
>> Signed-off-by: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
>> [reword commit message]
>> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>> [adjust context]
>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> 
> Is this still needed after "[PATCH 5/8] spi: sh-msiof: Wait for Tx
> FIFO empty after DMA"?


Do you have a proposal for nice test cases you like to see covered?


Best regards

Dirk
