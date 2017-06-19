Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33157 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753643AbdFSIm0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 04:42:26 -0400
MIME-Version: 1.0
In-Reply-To: <1497625049-46802-1-git-send-email-biju.das@bp.renesas.com>
References: <1497625049-46802-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jun 2017 10:42:18 +0200
Message-ID: <CAMuHMdVe7sRcGohSPvSUrryNMetddomoMbN7ffOtq9Y3DBt=zQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: iwg20d-q7: Add pinctl support for scif0
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Fri, Jun 16, 2017 at 4:57 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> Adding pinctrl support for scif0 interface.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

The patch looks good to me, but without schematics, we cannot verify the
actual pins used.

Are the schematics somewhere available? Having access to them would allow us
doing a better job reviewing your DTS patches.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
