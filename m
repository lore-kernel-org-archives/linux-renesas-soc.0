Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11317C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 12:13:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF385217F5
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 12:13:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="p+brfLF5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbfC2MN6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 08:13:58 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:50672 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728689AbfC2MN6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 08:13:58 -0400
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
        by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 44W0yT2Zz4z1XLG77;
        Fri, 29 Mar 2019 13:13:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=2015-01-21; t=1553861633;
        bh=y2b7Vc4S9Xj0saASRHX0tCniXUHjUyfcXNFDmB3dM3k=; l=10;
        h=From:From:Reply-To:Sender;
        b=p+brfLF5gpZWbNbAr0uuaDQslrQQUKaHKUjO1ekOTNystnYCmLHf3TWQ5SO32VBUe
         TvN7GVZAfLzIKbyb7d7TQ46Mz65NM68qai/iMPU+8rz2f3bYx8KESwzQZC55j6uNOG
         CNwkz/qLe6dQD0EvcFNyKU39d9ER6sYiDEXvlV8o=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
        by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 44W0yT1v1lz4RV;
        Fri, 29 Mar 2019 13:13:53 +0100 (CET)
X-AuditID: 0a3aad10-057ff70000007f88-3e-5c9e0c002c7a
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id 6F.18.32648.00C0E9C5; Fri, 29 Mar 2019 13:13:52 +0100 (CET)
Received: from FE-HUB2000.de.bosch.com (fe-hub2000.de.bosch.com [10.4.103.109])
        by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 44W0yS5jGKz6CjZqf;
        Fri, 29 Mar 2019 13:13:52 +0100 (CET)
Received: from [10.34.221.161] (10.34.221.161) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5; Fri, 29 Mar 2019
 13:13:50 +0100
Subject: Re: [PATCH v2] serial: sh-sci: Support for HSCIF RX sampling point
 adjustment
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        "George G. Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Joshua Frkuska <joshua_frkuska@mentor.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Magnus Damm <magnus.damm@gmail.com>, Greg KH <greg@kroah.com>
References: <1522856931-6225-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20190327183555.GA23991@vmlxhi-102.adit-jv.com>
 <CAMuHMdXzspxfSTQSA980VcTusoXTWXDexJuKoOo5gaFGDypc1A@mail.gmail.com>
 <d3746902-bc33-f5f2-660a-4bda583e77d4@de.bosch.com>
 <a69eb7eb-451c-c32c-4772-798285f0cf9b@de.bosch.com>
 <0f1048cb-ebca-2e66-9b77-70297be96054@de.bosch.com>
 <CAMuHMdUd+0wt=eZ+M8NOYZOTzLX2VH7hpzbMyZC3+fJEnXrUkA@mail.gmail.com>
From:   Dirk Behme <dirk.behme@de.bosch.com>
Organization: Robert Bosch Car Multimedia GmbH
Message-ID: <3dc6a66a-c057-af29-2a2e-c526a4d2a30a@de.bosch.com>
Date:   Fri, 29 Mar 2019 13:13:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUd+0wt=eZ+M8NOYZOTzLX2VH7hpzbMyZC3+fJEnXrUkA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.221.161]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Tb0wbZRzHee6u7fXo4XEM+QlMtMkSQwIDp3gIkZkQrXvhxgsjmY1bGQc0
        9g/pFTIWdexPEIYILwBphYJinBvCAMGBg2HqnNDwVxLXMQZjq5NVWFEEWbaJdyuMvvDdN9/v
        7/N7nud7ORJnL5CRpN5k5S0mnUEtpwjq5dbtcUEqhzah75NkznbzNMGdXT+Jcben+jHOs/6P
        jBttqkPcpW8nFVz3nbsYN9xcoeButCzKuQf9pQpupKmG4Cqqk7gzg3Z8N62xf9Si0PTarys0
        i3P7NM4fS5HmwspxpBlyeQjNcufT+xT7qdRs3qAv5C07XzlI5dVN8PmVSYdv/LwkL0aNsaeQ
        kgTmBZg40UecQhTJMiUYfDd3Ti4FLHMRwcLlOH9wGsHiwiqSgjAmE47ZXCJBktuYOKi/h0kz
        OHOcgDMlHyv88DkcRirfkrSciYXeqtJH/hNMPDRdHJFJmmbSoPXhr480weyAL6a/wiUdzmhh
        sKZL4Z8JhSGbh5C0ksmApXY/izMc2BrHkF9HwJSnEfPrGDi/WI/7X/Ys1FwrJ6pQmD1glT0A
        twfg9gC8CRFnUXgOn1BofCk5kYu3ZPHCkYTE+ENmYyfyf0imB/W6cpyIIZFaRb+93qBlZbpC
        ocjoRC+SmDqcvrkmWiFZ5uyiPJ2Qd8BSYOAFdSQdPb5Hy4Y9toWCLKNeEPRmkxMBiau30dpl
        kaOzdUVHeIvZjzlRFEmoI+hccq+WZXJ1Vv49ns/nLZtpCkmqga6lHFo21MLn8odz9AbrZqze
        TqOgoCD2ycAk8FiMVDrRLlIlnp0iraCFfJ1R0Odu4E/5cXbT3UJd6A3StzLXgJM22+8NOEuY
        zCY+MoI2SFsYaT6vwPT4HpHRtMFn17LhAcHWLi9yI7HJMDpNglXiX7N1A6CjpNJCN8wt6Pkv
        RYbpjoGy+dfA6+tCYKueRuDoWUFg901j0FZ1CwP3bS8GM8P3MOi51Y7DoKuVgOHmDgLWf5oi
        oP38LAGNl6tl8M3Y1zJYvrMqg1++tytgfvwhCfMzY0q4P1lOwd8dtRQs/DEuqoq/KHHpKgWj
        5SeDYa14Nhj6WtaC4ZizTAWOuioaGt1rNLhLOkJg0DMQ4hXbxcR2vUc/k9q16qz/0+6Gu/W4
        yGLU3J3OHFUp3jxxZZf5wwOVnx56v3P9g8WuZ0aX9pZVu3dfi7o+UN2gtb3e5aCS/4zx3ZVP
        Wn9wz1B1ne9+Xr8jjUzV3k/NaWWKx/Z4n8vO6JZBinI00/hvujU687eBpIyr/fxBx35Pm4VM
        j8oPrjWH1I7XXnmnbeLSg6Gd+o6rs6+a1YSQp0uMxS2C7j8lDq+2zgQAAA==
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 29.03.2019 10:46, Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> On Fri, Mar 29, 2019 at 8:05 AM Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> On 28.03.2019 12:30, Dirk Behme wrote:
>>> On 28.03.2019 11:16, Dirk Behme wrote:
>>>> On 28.03.2019 10:24, Geert Uytterhoeven wrote:
>>>>> On Wed, Mar 27, 2019 at 7:36 PM Eugeniu Rosca <erosca@de.adit-jv.com>
>>>>> wrote:
>>>>>> We've recently switched from rcar-3.7.x to rcar-3.9.x [1] kernel and
>>>>>> the
>>>>>> latter contains this patch [2] by virtue of rcar-3.9.0 commit [3],
>>>>>> which
>>>>>> mirrors v4.18-rc1 commit [4] in mainline.
>>>>>>
>>>>>> JFYI, quite far away in the delivery chain, we've received below
>>>>>> report:
>>>>>>
>>>>>>> With this patch [2-4] there are reports about broken data
>>>>>>> communication with 115200 baud with SXM module. Reverting
>>>>>>> this patch results in successful communication, again.
>>>>>>
>>>>>> While this scarce information barely helps anybody, I thought that
>>>>>> sharing it with you might be beneficial in case you collect several
>>>>>> reports linked to this specific commit in future, meaning it
>>>>>> potentially
>>>>>> adds a regression.
>>>>>>
>>>>>> Also, if you are aware of any userland changes that might be
>>>>>> required/assumed by this patch or in case you have any alternative
>>>>>> ideas how to avoid reverting this patch, your feedback would be very
>>>>>> appreciated.
>>>>>
>>>>> Thanks for your report!
>>>>>
>>>>> [TLDR: skip to the suggested fix below; I only noticed the bug after
>>>>>          writing the below paragraphs, which are still useful
>>>>> questions to
>>>>>          let us reproduce the issue]
>>>>>
>>>>> Which SoC are you using?
>>>>> I assume this is on a custom board, as Salvator-X(S) and ULCB have
>>>>> external SCIF clock crystals, which allow to use a perfect 115200 bps,
>>>>> hence the affected code path is not exercised:
>>>>>
>>>>>       sh-sci e6550000.serial: BRG: 115200+0 bps using DL 4 SR 32
>>>>>       sh-sci e6550000.serial: Using clk scif for 115200+0 bps
>>>>>
>>>>> Does your board have an external SCIF clock? Which frequency?
>>>>> Can you check the clock values and deviation for your configuration, by
>>>>> changing the calls to print the above information from dev_dbg() to
>>>>> dev_info()?
>>>>>
>>>>> Does adding the DIV_ROUND_CLOSEST(), as suggested in my review
>>>>> of the posted patch, help?
>>>>> Perhaps the sampling point shift is inverted? Does -shift work better?
>>>>>
>>>>> [possible solution]
>>>>>
>>>>>> +                               int shift = min(-8, max(7, deviation
>>>>>> / 2));
>>>>>
>>>>> Oops, min and max are exchanged!
>>>>>
>>>>> I guess using
>>>>>
>>>>>       int shift = clamp(deviation / 2, -8, 7)
>>>>>
>>>>> instead fixes the issue?
>>>>
>>>>
>>>> Uh, that was fast :) Many thanks!
>>>>
>>>> We will test this as fast as possible! But due to the long delivery
>>>> chain Eugeniu mentioned this will take some time. I'll try my best to
>>>> come back to you as fast as possible.
>>>
>>>
>>> Just for the archives: We are testing the attached patch.
>>
>>
>> * Testing the patch [5]
>>
>> - int shift = min(-8, max(7, deviation / 2));
>> + int shift = clamp(deviation / 2, -8, 7);
>>
>> does *not* fix our issue. Or in other words: Testing was *not* successful.
> 
> I'm sorry to hear that.
> 
>> * However, from review point of view we think that it fixes a serious
>> bug. So maybe it should be applied, anyhow?
> 
> Yes, submitted.
> 
>> * Using strace we managed to get some more information about the usage
>> of the serial port [6]. With this, we are talking about 57600 and not 115200
>>
>> * Switching to dev_info() [7] as requested above we get
>>
>> [    0.553256] e6560000.serial: ttySC3 at MMIO 0xe6560000 (irq = 41,
>> base_baud = 0) is a hscif
>> [  161.418527] sh-sci e6560000.serial: BRG: 9600+0 bps using DL 1462 SR 19
>> [  161.418543] sh-sci e6560000.serial: Using clk s3d1 for 9600+0 bps
>> [  161.418813] sh-sci e6560000.serial: BRG: 57600-5 bps using DL 463 SR 10
>> [  161.418824] sh-sci e6560000.serial: Using clk s3d1 for 57600-5 bps
>>
>> * We are talking about a custom r8a7796 board
> 
> The above values match with what I see on Salvator-X, after disabling
> scif_clk in DTS.
> 
> If your board does have scif_clk populated, you want to describe that in
> DT, as it may improve the situation.
> 
> BTW, have you verified the actual clock rate used? It wouldn't be the
> first time that a crystal description in DTS has a typo in its
> clock-frequency property, breaking UART communication at "high"
> speeds.
> A simple way to do that is outputting a square wave using:
> 
>      yes U | tr -d "\n" > /dev/ttySC3
> 
> This should give an (approximate) square wave of 28797 Hz.
> 
>>   From 9a3c199f02cb66cb67e93e0824b03b622ab3b024 Mon Sep 17 00:00:00 2001
>> From: Dirk Behme <dirk.behme@de.bosch.com>
>> Date: Fri, 29 Mar 2019 06:39:31 +0100
>> Subject: [PATCH] serial: sh-sci: Enable debug output
>>
>> Enable some debug output as requested by Geert in
>>
>> https://patchwork.kernel.org/patch/10322809/#22554727
>>
>> Change-Id: Icd2f97138516a0e40726fa1ccd50a69abb57cb76
>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>> ---
>>    drivers/tty/serial/sh-sci.c | 4 ++--
>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
>> index eba08cd892e5..32210cf2413c 100644
>> --- a/drivers/tty/serial/sh-sci.c
>> +++ b/drivers/tty/serial/sh-sci.c
>> @@ -2161,7 +2161,7 @@ static int sci_brg_calc(struct sci_port *s,
>> unsigned int bps,
>>                          break;
>>          }
>>
>> -       dev_dbg(s->port.dev, "BRG: %u%+d bps using DL %u SR %u\n", bps,
>> +       dev_info(s->port.dev, "BRG: %u%+d bps using DL %u SR %u\n", bps,
>>                  min_err, *dlr, *srr + 1);
>>          return min_err;
>>    }
>> @@ -2376,7 +2376,7 @@ static void sci_set_termios(struct uart_port
>> *port, struct ktermios *termios,
>>
>>    done:
>>          if (best_clk >= 0)
>> -               dev_dbg(port->dev, "Using clk %pC for %u%+d bps\n",
>> +               dev_info(port->dev, "Using clk %pC for %u%+d bps\n",
>>                          s->clks[best_clk], baud, min_err);
>>
>>          sci_port_enable(s);
> 
> You way want to enable printing of the other debug lines that contain
> "+d bps", for comparison with SCK and BRR alternatives.
> But in the absence of a suitable scif_clk, the clock rate achieved using
> the BRG is the best option.


Do you have any idea what might be the difference between reverting 
"serial: sh-sci: Support for HSCIF RX sampling point adjustment" (works) 
and not reverting that (doesn't work for us), then?

Best regards

Dirk

P.S.: I'll check the other topics above, thanks!
