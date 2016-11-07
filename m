Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36057 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933073AbcKGSl0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 13:41:26 -0500
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVcCwbXRCVy50k=tm=PKi3F3nnyq8UMjdq71k7Yd1tBtA@mail.gmail.com>
References: <3539878.XFtRJDB9iq@wasted.cogentembedded.com> <6619847.B5XdH7v7xE@wasted.cogentembedded.com>
 <CAMuHMdVcCwbXRCVy50k=tm=PKi3F3nnyq8UMjdq71k7Yd1tBtA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Nov 2016 19:41:19 +0100
Message-ID: <CAMuHMdWKK0Zb8K_fs2G+CGQeGsb3MkAURHAhXb6QWvDO2PYTCQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: shmobile: r8a7745: add CPG clock index macros
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 7, 2016 at 9:34 AM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sat, Nov 5, 2016 at 11:31 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
>> Add macros usable by  the device tree sources to reference the R8A7745 CPG
>> clocks  by index. The data comes from the  table 7.2c in the revision 0.50
>> of the RZ/G Series User's Manual.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> ---
>> Changes in version 2:
>> - added Geert's tag.
>>
>>  include/dt-bindings/clock/r8a7745-cpg-mssr.h |   44 +++++++++++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>
>> Index: linux/include/dt-bindings/clock/r8a7745-cpg-mssr.h
>> ===================================================================
>> --- /dev/null
>> +++ linux/include/dt-bindings/clock/r8a7745-cpg-mssr.h
>
>> +#define R8A7745_CLK_ACP                26
>
> This clock is called CPEX instead of ACP in rev. 1.00 of the RZ/G Series User's
> Manual: Hardware.

Applied with s/ACP/CPEX/, and included in second clk-renesas-for-v4.10
pull request.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
