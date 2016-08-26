Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www1246.sakura.ne.jp ([219.94.162.56]:64960 "EHLO
        www1246.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750712AbcHZIbN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2016 04:31:13 -0400
Message-ID: <57BFF3A3.8070809@jinso.co.jp>
Date: Fri, 26 Aug 2016 16:45:39 +0900
From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sakato Ryusuke <ryusuke.sakato.bx@renesas.com>,
        kuninori morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Nguyen Viet Dung <nv-dung@jinso.co.jp>
Subject: Re: R-Car Gen2 QSPI driver performance
References: <57BF944F.8000501@jinso.co.jp> <CAMuHMdVUcEF31sWOxLU-=JDjjTM4S+0jkw_aSZWq6Yfco4TWbA@mail.gmail.com>
In-Reply-To: <CAMuHMdVUcEF31sWOxLU-=JDjjTM4S+0jkw_aSZWq6Yfco4TWbA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thanks for your quick reply!


> On Fri, Aug 26, 2016 at 2:58 AM, Hiep Cao Minh <cm-hiep@jinso.co.jp> wrote:
>> I'd like to ask you about R-Car Gen2 QSPI driver performance test of single,
>> dual and quad.
>>
>> ------
>> commit 4f12b5e529e4ff274eb478ec1c2ef41358ed9577
>> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>> Date:   Mon Jun 2 15:38:17 2014 +0200
>>
>>       spi: rspi: Add DMA support for QSPI on R-Car Gen2
>>
>>       Enable DMA support for QSPI on R-Car Gen2, for Single, Dual, and Quad
>> SPI
>>       Transfers.
>>
>>       Performance figures for reading from a QSPI FLASH driven at 24.375 MHz
>>       on r8a7791/koelsch:
>>         - Single:  1.1 Mbps PIO, 23 Mbps DMA
>>         - Dual  : 12.7 Mbps PIO, 48 Mbps DMA
>>         - Quad  : 13   Mbps PIO, 70 Mbps DMA
>> ------
>> Could you show me how to test these performances?
> As I wanted to measure raw SPI performance, and not overhead (block
> device, file system, ...) or other impact (buffer cache!), I used a patch like
> the (whitespace-damaged) one at the end of this email, and:
>
>      dd if=/dev/mtd2 bs=4M count=1 of=/dev/null
>
> Using a sufficiently large buffer size is recommended for good performance.
> All of this was done in r8a7791/koelsch.
>
Thanks, I'll try to reproduce them as you showed me.

>> I have tried to reproduce them but I only got the results like this:
>>
>> Enabled DMA:
>> Linux stable v4.7
>>       Quad-spi： Read 3.2 MB/s Write 601 kB/s
>>       Dual-spi： Read 3.1 MB/s Write 847 kB/s
>>       Single-spi： Read 2.5 MB/s Write 850 kB/s
>>
>> PIO:
>> RcarGen2_BSP linux_v3.10.101-ltsi
>>       Quad-spi： Read 2.2 MB/s Write 1.1 MB/s
>>       Dual-spi： Read 2.1 MB/s Write 158 kB/s
>>       Single-spi： Read 173 kB/s Write 159 kB/s
> Note that some of these are even faster than mine, probably due to
> caching...
Oh!, thank you pointed it out.
And we also wonder why the reading speed in quad and dual mode are most 
the same?.
(I mean they are not different very much.)
v4.7: Read 3.2 MB/s(Quad) and 3.1 MB/s(Dual),
And in your test results: 12.7 Mbps, 13 Mbps in PIO mode.

Regards,
Jinso/Hiep.
