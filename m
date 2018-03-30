Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:34676 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750927AbeC3J2H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Mar 2018 05:28:07 -0400
Received: by mail-qt0-f196.google.com with SMTP id l18so8925282qtj.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Mar 2018 02:28:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522320146-41110-1-git-send-email-biju.das@bp.renesas.com>
References: <1522320146-41110-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Mar 2018 11:28:06 +0200
Message-ID: <CAMuHMdWJLrkLndVazM5QSE938sJ0kDphzodPcMc2t8T4_=9oUA@mail.gmail.com>
Subject: Re: [PATCH] ARM: debug-ll: Add support for r8a77470
To: Biju Das <biju.das@bp.renesas.com>
Cc: Russell King <linux@armlinux.org.uk>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 29, 2018 at 12:42 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> Enable low-level debugging support for RZ/G1C (r8a77470). RZ/G1C uses
> SCIF1 for the debug console.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
