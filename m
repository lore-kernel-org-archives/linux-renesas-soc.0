Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:33818 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751325AbcHVIKY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 04:10:24 -0400
MIME-Version: 1.0
In-Reply-To: <20160822074111.GE28034@verge.net.au>
References: <5383928.8UnDsUpmkz@wasted.cogentembedded.com> <1783132.r9t2y3QUUq@wasted.cogentembedded.com>
 <20160822074111.GE28034@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Aug 2016 10:10:23 +0200
Message-ID: <CAMuHMdXVw9SuagmZTD0nZOv-AC3ruWazfBbG5=cRrdHKQYcqgw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: blanche: add DU support
To: Simon Horman <horms@verge.net.au>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Mon, Aug 22, 2016 at 9:41 AM, Simon Horman <horms@verge.net.au> wrote:
> On Fri, Aug 19, 2016 at 11:42:54PM +0300, Sergei Shtylyov wrote:
>> Index: renesas/arch/arm/boot/dts/r8a7792-blanche.dts
>> ===================================================================
>> --- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
>> +++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
>
> ...
>
>> @@ -186,3 +251,63 @@
>>       cd-gpios = <&gpio11 11 GPIO_ACTIVE_LOW>;
>>       status = "okay";
>>  };
>> +
>> +&i2c1 {
>> +     status = "okay";
>> +     clock-frequency = <400000>;
>
> Is it intentional that there are no pinctrl properties here?

$ git grep -w I2C arch/arm/boot/dts/r8a7792.dtsi
arch/arm/boot/dts/r8a7792.dtsi:         /* I2C doesn't need pinmux */
$

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
