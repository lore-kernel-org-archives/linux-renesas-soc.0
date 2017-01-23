Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36166 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750705AbdAWJ0g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 04:26:36 -0500
Received: by mail-io0-f194.google.com with SMTP id q20so14368982ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2017 01:26:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170123092330.GF31651@verge.net.au>
References: <1484657360-13101-1-git-send-email-geert+renesas@glider.be> <20170123092330.GF31651@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Jan 2017 10:26:34 +0100
Message-ID: <CAMuHMdVbr3gCMJpvcJbD0C4p8FikMM3s5zmjkVXNskhk7-P7Tw@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM/arm64: dts: renesas: Link ARM GIC to clock and
 clock domain
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Mon, Jan 23, 2017 at 10:23 AM, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Jan 17, 2017 at 01:49:16PM +0100, Geert Uytterhoeven wrote:
>> This patch series improves the topology description in DT of the ARM GIC
>> on Renesas SoCs using the CPG/MSSR bindings (R-Car Gen3 and RZ/G).
>> It links the GIC to its module clock, and adds it to the SYSC "always
>> on" PM Domain.
>>
>> Note that currently the GIC-400 driver doesn't support module clocks nor
>> Runtime PM, so this must be handled as a critical clock.
>> As the CPG/MSSR driver, unlike the legacy MSTP driver, is already aware
>> of critical clocks, this series can be applied right now.
>
> does the note above imply that "[PATCH 0/2] clk: renesas: Use
> CLK_IS_CRITICAL to handle critical clocks" is a dependency of this series?

No, the note says (using different wording) that there is no such dependency.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
