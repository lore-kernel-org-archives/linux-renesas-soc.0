Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:38731 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751528AbeCMTXl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Mar 2018 15:23:41 -0400
Received: by mail-qt0-f194.google.com with SMTP id n12so883983qtl.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Mar 2018 12:23:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180313184330.67oh6gyjwxv44q2i@verge.net.au>
References: <1520518205-23351-1-git-send-email-geert+renesas@glider.be> <20180313184330.67oh6gyjwxv44q2i@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Mar 2018 20:23:40 +0100
Message-ID: <CAMuHMdU3DPfq6TJdzbRskiQKGJZM-8MBPUn9cF+SAtyxGCNvrA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795: Add missing SYS-DMAC2 dmas
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, Mar 13, 2018 at 7:43 PM, Simon Horman <horms@verge.net.au> wrote:
> On Thu, Mar 08, 2018 at 03:10:05PM +0100, Geert Uytterhoeven wrote:
>> On R-Car H3, on-chip peripheral modules that can make use of DMA are
>> wired to either SYS-DMAC0 only, or to both SYS-DMAC1 and SYS-DMAC2.
>>
>> Add the missing DMA properties pointing to SYS-DMAC2 for HSCIF[0-2],
>> SCIF[015], and I2C[0-2].  These were initially left out because early
>> firmware versions prohibited using SYS-DMAC2.  This restriction has been
>> lifted in IPL and Secure Monitor Rev1.0.6 (released on Feb 25, 2016).
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thanks, applied.

This one, or v2?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
