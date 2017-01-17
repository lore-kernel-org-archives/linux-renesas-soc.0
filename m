Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:33550 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750917AbdAQORC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2017 09:17:02 -0500
Received: by mail-io0-f193.google.com with SMTP id 101so15863868iom.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jan 2017 06:16:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <HK2PR06MB05451777E7151CA9C7EF8990C37C0@HK2PR06MB0545.apcprd06.prod.outlook.com>
References: <1484657360-13101-1-git-send-email-geert+renesas@glider.be>
 <1484657360-13101-4-git-send-email-geert+renesas@glider.be> <HK2PR06MB05451777E7151CA9C7EF8990C37C0@HK2PR06MB0545.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jan 2017 15:08:21 +0100
Message-ID: <CAMuHMdUjtwv=iVcfNsA4uB_OdUZQgp8XyonWVgbqsPjqwAtwtQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: r8a7795: Link ARM GIC to clock and clock domain
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ramesh,

On Tue, Jan 17, 2017 at 3:00 PM, Ramesh Shanmugasundaram
<ramesh.shanmugasundaram@bp.renesas.com> wrote:
>> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> @@ -166,6 +166,9 @@
>>                             <0x0 0xf1060000 0 0x20000>;
>>                       interrupts = <GIC_PPI 9
>>                                       (GIC_CPU_MASK_SIMPLE(4) |
>> IRQ_TYPE_LEVEL_HIGH)>;
>> +                     clocks = <&cpg CPG_MOD 408>;
>> +                     clock-names = "clk";
>
> Should the module clock be named "fck"?

Not according to
Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt.

P.S. If you use "git blame", you may think I'm cheating, but naming was
     ased on the actual Technical Reference Manuals ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
