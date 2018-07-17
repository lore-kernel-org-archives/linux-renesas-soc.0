Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:34788 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730444AbeGQMRx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 08:17:53 -0400
Received: by mail-ua0-f194.google.com with SMTP id r10-v6so473248uao.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jul 2018 04:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20180717113832.26413-1-horms+renesas@verge.net.au>
In-Reply-To: <20180717113832.26413-1-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jul 2018 13:45:26 +0200
Message-ID: <CAMuHMdXZ_pQaF7BZs_F6MdYsacRDHmNLnUS14n5yhy9+r6Z5Mw@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: r8a77995: Add SCIF {0,1,3,4,5} and all
 HSCIF device nodes
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 17, 2018 at 1:38 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds the device nodes for SCIF {0,1,3,4,5} and all HSCIF serial
> ports, incl. clocks, power domain and DMAs.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> --
> v3 [Simon Horman]
> * Add DMAs

For the newly added SCIF dmas:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
