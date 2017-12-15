Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:38291 "EHLO
        mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753626AbdLOIBw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 03:01:52 -0500
MIME-Version: 1.0
In-Reply-To: <871sjweqr4.wl%kuninori.morimoto.gx@renesas.com>
References: <874loseqvp.wl%kuninori.morimoto.gx@renesas.com> <871sjweqr4.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Dec 2017 09:01:50 +0100
Message-ID: <CAMuHMdVwuQoSCBGCAeXbDgfiP2zREMK70r2kvA_1sRm3aFgq1Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm: rcar-du: calculate DPLLCR to be more small jitter
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Fri, Dec 15, 2017 at 2:24 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> In general, PLL has VCO (= Voltage controlled oscillator),
> one of the very important electronic feature called as "jitter"
> is related to this VCO.
> In academic generalism, VCO should be maximum to be more small jitter.
> In high frequency clock, jitter will be large impact.
> Thus, selecting Hi VCO is general theory.

Thanks for your patch!

> One note here is that it should be 2000 < fvco < 4096MHz

2000 Hz? (else it could be misinterpreted that MHz applies to both values).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
