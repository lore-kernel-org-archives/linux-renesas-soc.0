Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0045EC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 09:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE1DB2084C
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 09:27:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728201AbfAKJ10 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 04:27:26 -0500
Received: from www3345.sakura.ne.jp ([49.212.235.55]:27354 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfAKJ10 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 04:27:26 -0500
Received: from fsav101.sakura.ne.jp (fsav101.sakura.ne.jp [27.133.134.228])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x0B9RA1l094014;
        Fri, 11 Jan 2019 18:27:10 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav101.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav101.sakura.ne.jp);
 Fri, 11 Jan 2019 18:27:10 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav101.sakura.ne.jp)
Received: from [192.168.1.8] (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x0B9R9cF093991
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
        Fri, 11 Jan 2019 18:27:10 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Subject: Re: [PATCH 2/2] spi: sh-msiof: Use DMA if possible
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6ug==?= =?UTF-8?B?44K9?= 
        <nv-dung@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz?= =?UTF-8?B?44O744OJ44Oz?= 
        <cv-dong@jinso.co.jp>
References: <1547197109-637-1-git-send-email-na-hoan@jinso.co.jp>
 <1547197109-637-2-git-send-email-na-hoan@jinso.co.jp>
 <CAMuHMdUAk004J-06o43yHei10tWCkyztsWUXUyCj36cPwT9D0w@mail.gmail.com>
From:   Hoan <na-hoan@jinso.co.jp>
Message-ID: <b8844c87-5642-aea6-c90e-670e8c544884@jinso.co.jp>
Date:   Fri, 11 Jan 2019 18:27:09 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUAk004J-06o43yHei10tWCkyztsWUXUyCj36cPwT9D0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Geert-san

Thank you very much for your comments!

On 2019/01/11 18:09, Geert Uytterhoeven wrote:
> Hi Hoan-san,
>
> On Fri, Jan 11, 2019 at 9:59 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
>> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>>
>> Currently, this driver only supports feature for DMA 32-bits.
>> In this case, only if the data length is divisible by 4 to use
>> DMA, otherwise PIO will be used. This patch will suggest use
>> the DMA 32-bits with 4bytes of words, then the remaining data
>> will be transmitted by PIO mode.
>>
>> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> Thanks for your patch, that's a great idea!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> with a small suggestion below.
Currently, I only test the transmit-receive spi with AT25C eeprom,
because the maximum length of data I test with eeprom is only 18 bytes,
so with this patch, there will be times when clock timing time and pulse
of data transmission (I Observed by  sigrock logic analyzer) will not be
beautiful compared to PIO mode.
I worry if other devices using this driver also limit the maximum length
of transmission/reception to 18bytes.

But I still want to patch up to ask for your opinion.


>> --- a/drivers/spi/spi-sh-msiof.c
>> +++ b/drivers/spi/spi-sh-msiof.c
>> @@ -937,17 +937,13 @@ static int sh_msiof_transfer_one(struct spi_master *master,
>>                  unsigned int l = 0;
>>
>>                  if (tx_buf)
>> -                       l = min(len, p->tx_fifo_size * 4);
>> +                       l = min(len - len % 4, p->tx_fifo_size * 4);
> I think this would be easier to read when written as:
>
>      l = min(round_down(len, 4), p->tx_fifo_size * 4);
>
If you do not have any problems with the above,
I will update as you want here.


Thank you for your helps!

Hoan.

>>                  if (rx_buf)
>> -                       l = min(len, p->rx_fifo_size * 4);
>> +                       l = min(len - len % 4, p->rx_fifo_size * 4);
> Likewise,
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
