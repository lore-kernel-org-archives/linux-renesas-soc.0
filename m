Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:37817 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750793AbeFTNCM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jun 2018 09:02:12 -0400
Received: by mail-ua0-f195.google.com with SMTP id c2-v6so89333uae.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jun 2018 06:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20180613151348.28697-1-horms+renesas@verge.net.au>
In-Reply-To: <20180613151348.28697-1-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Jun 2018 15:02:00 +0200
Message-ID: <CAMuHMdWJ24iCA=YQdoE99+1aVw8LNw3hRAGGbET6qAJNt4=QoQ@mail.gmail.com>
Subject: Re: [PATCH/RFT v2 1/2] arm64: dts: r8a77995: Add SCIF-{0, 1, 3, 4, 5}
 device nodes
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Jun 13, 2018 at 5:14 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds the device nodes for SCIF-{0,1,3,4,5} serial ports,
> incl. clocks and power domain.

While at it, perhaps you want to add DMA properties, too?
The existing SCIF2 device node already has them.

> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> [simon: updated internal clock from S3D1 to S3D1C to match documentation]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
