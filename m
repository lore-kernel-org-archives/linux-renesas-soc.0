Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E58C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 08:19:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 905152087E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 08:19:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727428AbfARIT4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 03:19:56 -0500
Received: from www3345.sakura.ne.jp ([49.212.235.55]:59625 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727300AbfARIT4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 03:19:56 -0500
Received: from fsav101.sakura.ne.jp (fsav101.sakura.ne.jp [27.133.134.228])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x0I8Jfxv076203;
        Fri, 18 Jan 2019 17:19:41 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav101.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav101.sakura.ne.jp);
 Fri, 18 Jan 2019 17:19:41 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav101.sakura.ne.jp)
Received: from [192.168.1.8] (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x0I8JdL4076196
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
        Fri, 18 Jan 2019 17:19:40 +0900 (JST)
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
 <b8844c87-5642-aea6-c90e-670e8c544884@jinso.co.jp>
 <CAMuHMdWFmfXVOkq0vVQ=yJx_9KyEXvkTvkEjMTfkaFa7s8uH3A@mail.gmail.com>
From:   Hoan <na-hoan@jinso.co.jp>
Message-ID: <f2336373-691c-2c77-16e8-952e6dea52a2@jinso.co.jp>
Date:   Fri, 18 Jan 2019 17:19:39 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWFmfXVOkq0vVQ=yJx_9KyEXvkTvkEjMTfkaFa7s8uH3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Geert-san

Thanks you for your comments!

On 2019/01/11 19:05, Geert Uytterhoeven wrote:
> Hi Hoan,
>
> On Fri, Jan 11, 2019 at 10:27 AM Hoan <na-hoan@jinso.co.jp> wrote:
>> ....
>> Currently, I only test the transmit-receive spi with AT25C eeprom,
>> because the maximum length of data I test with eeprom is only 18 bytes,
>> so with this patch, there will be times when clock timing time and pulse
>> of data transmission (I Observed by  sigrock logic analyzer) will not be
>> beautiful compared to PIO mode.
>> I worry if other devices using this driver also limit the maximum length
>> of transmission/reception to 18bytes.
> One other issue is that MSIOF drops the hardware chip select in between
> transfers.  Before, transfers that fully fit in the FIFO were sent in a
> single transfer, keeping the hardware chip select asserted during the
> full transfer.
> If transfers are split, and you need the chip select to be asserted
> during the full transfer, you have to use a GPIO chip select instead.
> I believe the split can already happen since your commit 916d9802e4b0723c
> ("spi: sh-msiof: Reduce the number of times write to and perform the
> transmission from FIFO")?

That's right, aligning the maximum message length of 18-bytes current 
with AT25 eeprom.

> However, for most SPI slave devices (e.g. AT25), that issue is moot, as
> they need a GPIO chip select anyway, to avoid dropping the chip select
> in between transfers belonging to the same message.
But I worry here is whether other devices using spi also align data? I 
think not.
So with SPI-MSIOF as SPI driver, we serve all devices using SPI, not 
only EEPROM,
and we don't care what Slave is. As far as code and theory is concerned,
I think there is no problem.
So I will update this patch.


Thanks you very much!

Hoan.


> Gr{oetje,eeting}s,
>
>                          Geert
>
