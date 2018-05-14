Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:46222 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751498AbeENU1W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 May 2018 16:27:22 -0400
Received: by mail-vk0-f68.google.com with SMTP id i190-v6so8347202vkd.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 May 2018 13:27:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180513081424.tuqsc3wesnsd6n4m@verge.net.au>
References: <1526013081-28005-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526013081-28005-2-git-send-email-yoshihiro.shimoda.uh@renesas.com> <20180513081424.tuqsc3wesnsd6n4m@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 May 2018 22:27:21 +0200
Message-ID: <CAMuHMdUh-Hnjzg8ZNMwBBKDKrcFLgH-n8GXkUeieoaPmFPFaBw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r8a77990: Add PFC device node
To: Simon Horman <horms@verge.net.au>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Sun, May 13, 2018 at 10:14 AM, Simon Horman <horms@verge.net.au> wrote:
> On Fri, May 11, 2018 at 01:31:18PM +0900, Yoshihiro Shimoda wrote:
>> This patch adds PFC device node for r8a77990 (R-Car E3).
>>
>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> ---
>>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
>> index 4658029..efc3c0b 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
>> @@ -60,6 +60,11 @@
>>               #size-cells = <2>;
>>               ranges;
>>
>> +             pfc: pin-controller@e6060000 {
>> +                     compatible = "renesas,pfc-r8a77990";
>> +                     reg = <0 0xe6060000 0 0x508>;
>> +             };
>
> Here the register size is 0x508 which matches r8a77995.dtsi in mainline.
> Other variants there are:
> * 0x50c: r8a7795.dtsi, r8a77965.dtsi, r8a7796.dtsi
> * 0x504: r8a77970.dtsi

The number of registers is SoC-specific.
R-Car H3, M3-W, and M3-N share PFC documentation.

> My reading of the documentation is that the size of the register range is
> 0x50c. So I suggest we either use that value consistently or move to a
> larger value after some rounding-up. Geert?

According to Section 6D ("Pin Function Controller (PFC)" for R-Car E3)
of the datasheet, the last register is at offset 0x504, so length 0x508 is
correct.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
