Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:33091 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753073AbeFTNEc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jun 2018 09:04:32 -0400
Received: by mail-ua0-f196.google.com with SMTP id m21-v6so2090524uan.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jun 2018 06:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20180613150951.32322-1-horms+renesas@verge.net.au>
In-Reply-To: <20180613150951.32322-1-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Jun 2018 15:04:20 +0200
Message-ID: <CAMuHMdVZKqCriwJcXNL0koq1iZJOUrD_623yXLz1LEwCwbQZPA@mail.gmail.com>
Subject: Re: [PATCH/RFT v2 2/2] arm64: dts: r8a77995: Add all HSCIF nodes
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 13, 2018 at 5:10 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds the device nodes all HSCIF serial ports
> incl. clocks and power domain to the R8A77995 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> [simon: updated internal clock from S3D1 to S3D1C to match documentation]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
