Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:37420 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755620AbeFOGUa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jun 2018 02:20:30 -0400
MIME-Version: 1.0
References: <87lgbgswl5.wl%kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lgbgswl5.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Jun 2018 08:20:17 +0200
Message-ID: <CAMuHMdU_csJSYQ==Z+MOMGMi1LJ07_ZOojYADyUwaDcFLTT9dA@mail.gmail.com>
Subject: Re: [PATCH v3] dmaengine: rcar-dmac: don't use DMAC error interrupt
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

On Fri, Jun 15, 2018 at 2:53 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> rcar-dmac has 2 types of interrupt, 1) error IRQ (for all),
> 2) IRQ for each channels.
> If error happens on some channels, the error IRQ will be handled
> by 1), and "all" channels will be restarted.
> But in this design, error handling itself will be problem for
> non error channel users.
> This patch removes 1) handler, and handles error IRQ on 2)

Thank you, that explains the rationale!

BTW, how can you trigger an error, for testing?

Thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
