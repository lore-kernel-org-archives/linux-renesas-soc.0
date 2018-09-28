Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:33334 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbeI1NLO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 09:11:14 -0400
Received: by mail-ua1-f67.google.com with SMTP id i4-v6so1923522uak.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Sep 2018 23:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <87bm8itkta.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bm8itkta.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Sep 2018 08:48:47 +0200
Message-ID: <CAMuHMdWtgzx=FMnxHj4CiL2MwkLUrnpApSv=gPFC2BqaBfMzzg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795: add missing dma-names on hscif2
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 28, 2018 at 4:38 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> hscif2 has 4 dmas, but has only 2 dma-names.
> This patch add missing dma-names.

Nice catch!

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Fixes: e0f0bda79337701a ("arm64: dts: renesas: r8a7795: sort subnodes
of the soc node")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
