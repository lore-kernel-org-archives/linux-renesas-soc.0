Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:33739 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752581AbcJGHux (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2016 03:50:53 -0400
MIME-Version: 1.0
In-Reply-To: <20161007030932.GH13721@verge.net.au>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com> <2883940.Oo8sg10L7m@wasted.cogentembedded.com>
 <20161007030932.GH13721@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Oct 2016 09:50:51 +0200
Message-ID: <CAMuHMdXvja__VsjccDBuvBQqoKzqg_YrckQORZvMgVsJSd=KgA@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] ARM: dts: r8a7743: initial SoC device tree
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

On Fri, Oct 7, 2016 at 5:09 AM, Simon Horman <horms@verge.net.au> wrote:
> On Thu, Oct 06, 2016 at 12:38:18AM +0300, Sergei Shtylyov wrote:
>> The  initial R8A7743 SoC device tree including CPU cores, GIC, timer, SYSC,
>> CPG, and the required clock descriptions.
>>
>> Based on the original (and large) patch by Dmitry Shifrin
>> <dmitry.shifrin@cogentembedded.com>.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> I notice that this patch enables two CPUs. Have you tested SMP and:
> - CPU hotplug
> - Suspend to RAM

The APMU node and the CPU enable-method "renesas,apmu" are missing
to have working SMP.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
