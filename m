Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f177.google.com ([209.85.220.177]:40863 "EHLO
        mail-qk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750789AbeCWIgR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Mar 2018 04:36:17 -0400
Received: by mail-qk0-f177.google.com with SMTP id o64so12092342qkl.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Mar 2018 01:36:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180322102423.18269-2-horms+renesas@verge.net.au>
References: <20180322102423.18269-1-horms+renesas@verge.net.au> <20180322102423.18269-2-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Mar 2018 09:36:16 +0100
Message-ID: <CAMuHMdVng6MvW5meEjx_FYttvyDytOh9d17zZMja8LoefUDZ5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: renesas: r8a7795: sort subnodes of the
 root node
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Mar 22, 2018 at 11:24 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Sort subnodes of the root node alphanumerically.
>
> This is part of an ongoing effort to provide consistent node
> order in the DT of Renesas SoCs to improve maintainability.
>
> This should not have any run-time effect.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v2
> * Also sort clock nodes

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
using "grep '{' | grep -v @", which tells me
  - clusterX_opp should be before cpus,
  - thermal_zones should be before timer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
