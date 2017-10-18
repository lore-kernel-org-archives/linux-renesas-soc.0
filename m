Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:57146 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935629AbdJRHfe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2017 03:35:34 -0400
Received: by mail-wm0-f67.google.com with SMTP id l68so8222935wmd.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Oct 2017 00:35:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171018072728.14681-2-horms+renesas@verge.net.au>
References: <20171018072728.14681-1-horms+renesas@verge.net.au> <20171018072728.14681-2-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Oct 2017 09:35:33 +0200
Message-ID: <CAMuHMdWFORA=LL_e8RGYL3hzhZsCaVLfROKTNE57m3oJUD=tbw@mail.gmail.com>
Subject: Re: [PATCH 1/7] ARM: dts: r8a7743: Use R-Car Gen2 Ether fallback
 compat string
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 18, 2017 at 9:27 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Use newly added R-Car Gen2 Ether fallback compat string
> in the DT of the r8a7743 SoC.
>
> This should have no run-time effect as the driver matches against
> the per-SoC compat string before considering the fallback compat string.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
