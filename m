Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:39719 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935246AbeFMLgw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 07:36:52 -0400
MIME-Version: 1.0
References: <8736xrkrci.wl%kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8736xrkrci.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Jun 2018 13:36:39 +0200
Message-ID: <CAMuHMdV-MoVnfJarHc9xZX_ZN7sHmKjGKxnhHyYUBof_P6R9ew@mail.gmail.com>
Subject: Re: [PATCH v2] dmaengine: rcar-dmac: don't use DMAC error interrupt
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: vkoul@kernel.org, Dan Williams <dan.j.williams@intel.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        dmaengine@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

Thanks for your patch!

On Wed, Jun 13, 2018 at 10:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current rcar-dmac is using DMAC error interrupt which will handle all
> channel's error. But in this design, error handling itself will be
> issue if user want to use virtualization, multi OS, etc.
> This patch removes current DMAC error interrupt handling, and handle it
> on each channel interrupt handler.

Just wondering, what's the usage pattern where this causes a problem?
Do you plan to export part of a SYS-DMAC instance to a guest?
How to maintain host/guest isolation?

> --- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> +++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> @@ -38,6 +38,7 @@ Required Properties:
>  - interrupt-names: one entry for the error interrupt, named "error", plus one
>    entry per channel, named "ch%u", where %u is the channel number ranging from
>    zero to the number of channels minus one.
> +  # "error" interrupt will be ignored, so far

Again, DT describes hardware, not software policy.
So please drop all changes to the bindings.

With that fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
