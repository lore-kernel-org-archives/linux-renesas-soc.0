Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f195.google.com ([209.85.221.195]:38126 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727832AbeLFJCV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 04:02:21 -0500
MIME-Version: 1.0
References: <20181205153945.13767-1-geert+renesas@glider.be>
In-Reply-To: <20181205153945.13767-1-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Dec 2018 10:02:07 +0100
Message-ID: <CAMuHMdU89s997JhFpWOaDTFohcy4+Ym5deUUuv1EO7EybdJrkg@mail.gmail.com>
Subject: Re: [PATCH 0/4] soc: renesas: rcar-sysc: Miscellaneous fixes and cleanups
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Dec 5, 2018 at 4:39 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This series (against renesas-devel-20181204-v4.20-rc5) contains
> miscellaneous fixes and cleanups for the R-Car SYSC driver.
>
> This has been tested on R-Car Gen2 (H2 and M2-W) and R-Car Gen3 (H3
> ES1.0, H3 ES2.0, M3-W, M3-N, D3, E3, and V3M) (without 3DG).
>
> This not been tested on R-Car H1 and R-Car V3H.

Now tested on R-Car H1 (Marzen), with no ill effects on secondary CPU
boot and CPU hotplug.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
