Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:45134 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754772AbdLOIxM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 03:53:12 -0500
Received: by mail-qk0-f193.google.com with SMTP id d141so9497299qkc.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 00:53:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1513248976-26700-2-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1513248976-26700-1-git-send-email-fabrizio.castro@bp.renesas.com> <1513248976-26700-2-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Dec 2017 09:53:10 +0100
Message-ID: <CAMuHMdWUaQMgT4J0N+hrByAD12K-oO0+iNyDeVczS3nxr5ia9A@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: shmobile: defconfig: Enable PWM
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Russell King <linux@armlinux.org.uk>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

On Thu, Dec 14, 2017 at 11:56 AM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> RZ/G1 and R-Car platforms have PWM timers. This patch enables PWM support
> by default.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Thanks for your patch!

If I'm not mistaken, there are no current users of this PWM block in the
current R-Car Gen2 and RZ/G1 DTS files?
If that's correct, I don't think it makes much sense to enable it already.

Simon: what do you think?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
