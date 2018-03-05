Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:45714 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934323AbeCEKhm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Mar 2018 05:37:42 -0500
MIME-Version: 1.0
In-Reply-To: <1519697995-6061-2-git-send-email-gaku.inami.xh@renesas.com>
References: <1519697995-6061-1-git-send-email-gaku.inami.xh@renesas.com> <1519697995-6061-2-git-send-email-gaku.inami.xh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Mar 2018 11:37:41 +0100
Message-ID: <CAMuHMdUHbYCD-9yF4=_xe1_Fk_oMS6Shxjqkw-D+Pwfzb5q93A@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r8a7795: Add multi-cluster definition
To: Gaku Inami <gaku.inami.xh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 27, 2018 at 3:19 AM, Gaku Inami <gaku.inami.xh@renesas.com> wrote:
> This patch adds the "cpu-map" for multi-cluster into r8a7795
> device-tree. This definition is used to parse the cpu topology.
>
> Signed-off-by: Gaku Inami <gaku.inami.xh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
