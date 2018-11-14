Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:46666 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727558AbeKNTwq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Nov 2018 14:52:46 -0500
MIME-Version: 1.0
References: <1541661895-7064-1-git-send-email-gaku.inami.xh@renesas.com> <1541661895-7064-2-git-send-email-gaku.inami.xh@renesas.com>
In-Reply-To: <1541661895-7064-2-git-send-email-gaku.inami.xh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Nov 2018 10:50:03 +0100
Message-ID: <CAMuHMdV5zFmVR7r5Lxky5uT77T7e=om0DpnW=YLz=YfD6F=hyg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: Add CPU topology on R-Car
 Gen3 SoCs
To: Gaku Inami <gaku.inami.xh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Inami-san,

On Thu, Nov 8, 2018 at 8:25 AM Gaku Inami <gaku.inami.xh@renesas.com> wrote:
> This patch adds the "cpu-map" into r8a7795/r8a7796 composed of
> multi-cluster. This definition is used to parse the cpu topology.
>
> Signed-off-by: Gaku Inami <gaku.inami.xh@renesas.com>

Thanks for your patch!

Next time, please collect tags provided by reviewers on the previous
version.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
