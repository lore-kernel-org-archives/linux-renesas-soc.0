Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:33209 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755026AbcLBM4p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2016 07:56:45 -0500
Received: by mail-io0-f170.google.com with SMTP id j65so479291257iof.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Dec 2016 04:56:45 -0800 (PST)
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Dec 2016 13:56:44 +0100
Message-ID: <CAMuHMdWEjGeSEpY-hX00e7x5yBsNiC9zW1Wqj8jo2QN4pZoUvg@mail.gmail.com>
Subject: Re: R-Car gen3 PLL0/2/4 frequencies incorrect?
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Sun, Oct 30, 2016 at 7:36 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> drivers/clk/renesas/rcar-gen3-cpg.c seems to forget that the PLL0/2/4 all
> have a fixed divisor (2) while it multiplies PLLxCR.STC with 2 for the
> 'mult' variable (see the manual). All the dependent frequencies this should
> be reported greater x2 than the actual ones...

The actual frequencies in /sys/kernel/debug/clk/clk_summary are correct, though,
considering MD14=MD13=MD19=M17=1 (for a 33.3333 MHz EXTAL), while
Salvator-X has a 16.6666 MHz EXTAL.

Perhaps you missed the extal divider?

Note that I have measured MSIOF clock signal frequencies before, and they
matched Linux' point of view.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
