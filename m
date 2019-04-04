Return-Path: <SRS0=kNGB=SG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9C7C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 00:48:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56D512133D
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 00:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbfDDAsx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 20:48:53 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:32640 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbfDDAsx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 20:48:53 -0400
Received: from fsav405.sakura.ne.jp (fsav405.sakura.ne.jp [133.242.250.104])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x340mceo071000;
        Thu, 4 Apr 2019 09:48:38 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav405.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav405.sakura.ne.jp);
 Thu, 04 Apr 2019 09:48:38 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav405.sakura.ne.jp)
Received: from [192.168.1.8] (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x340mb4A070997
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
        Thu, 4 Apr 2019 09:48:37 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Subject: Re: [PATCH] spi: sh-msiof: Fix the limit of data length when
 calculating the length of words
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-spi <linux-spi@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?= 
        <cv-dong@jinso.co.jp>
References: <1554283043-9206-1-git-send-email-na-hoan@jinso.co.jp>
 <CAMuHMdX6XJitza1J3TRs_YBHCQp_yvXyZVZErE6v4OtoSwQ1RQ@mail.gmail.com>
From:   Hoan <na-hoan@jinso.co.jp>
Message-ID: <18f28cec-7804-c27a-b461-8f0c694f97a5@jinso.co.jp>
Date:   Thu, 4 Apr 2019 09:48:37 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX6XJitza1J3TRs_YBHCQp_yvXyZVZErE6v4OtoSwQ1RQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Geert-san,

Always thanks for your replies!

On 2019/04/03 18:24, Geert Uytterhoeven wrote:
> Hi Hoan,
>
> On Wed, Apr 3, 2019 at 11:17 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
>> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>>
>> We can use each word (data length) of 32bits (4 bytes),
>> so that if the length is greater than 3bytes, we can
>> align it with 4bytes of words.
>>
>> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> Thanks for your patch!
>
>> ---
>>   drivers/spi/spi-sh-msiof.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
>> index e2eb466..1552c14 100644
>> --- a/drivers/spi/spi-sh-msiof.c
>> +++ b/drivers/spi/spi-sh-msiof.c
>> @@ -930,7 +930,7 @@ static int sh_msiof_transfer_one(struct spi_controller *ctlr,
>>          if (!spi_controller_is_slave(p->ctlr))
>>                  sh_msiof_spi_set_clk_regs(p, clk_get_rate(p->clk), t->speed_hz);
>>
>> -       while (ctlr->dma_tx && len > 15) {
>> +       while (ctlr->dma_tx && len > 3) {
> This check is here to avoid using DMA (which incurs DMA setup overhead)
> for short transfers.
> Have you measured the performance impact of your change?
>
> Perhaps the code should be changed to:
>
>      #define DMA_MIN_LEN     16
>
>      while (ctlr->dma_tx && len >= DMA_MIN_LEN) {
>

Here the DMA feature for this driver has been initialized with the 
probe() function,
which means that DMA will, if possible, use default.
But when you add a patch to support DMA, You said DMA is only effective
with 32 bits, so that DMA here serves data as multiples of 32 bits.
I don't think the data length causes a cost for DMA when it's always 
used by default
if possible (was initialized with the probe () function) and if the data 
is a 32bits
multiple. In the opposite direction, have you measured the performance 
of using DMA
if the data is greater than or equal to 16 bytes instead of 4 bytes?


Thank You!

Hoan.


>>                  /*
>>                   *  DMA supports 32-bit words only, hence pack 8-bit and 16-bit
>>                   *  words, with byte resp. word swapping.
>> @@ -974,7 +974,7 @@ static int sh_msiof_transfer_one(struct spi_controller *ctlr,
>>                          return 0;
>>          }
>>
>> -       if (bits <= 8 && len > 15) {
>> +       if (bits <= 8 && len > 3) {
> Likewise.
>
>>                  bits = 32;
>>                  swab = true;
>>          } else {
> Gr{oetje,eeting}s,
>
>                          Geert
>
