Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:36984 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751416AbdLFMMD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 07:12:03 -0500
MIME-Version: 1.0
In-Reply-To: <1512561929-16540-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1512561929-16540-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Dec 2017 13:12:02 +0100
Message-ID: <CAMuHMdWTepYLpySfo6hq10-9TrGh+o=P9k5RnTYxBTe-eh-pQw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: r8a7745: Add APMU node and second CPU core
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <chris.paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Dec 6, 2017 at 1:05 PM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
>
> Add DT node for the Advanced Power Management Unit (APMU), add the
> second CPU core, and use "renesas,apmu" as "enable-method".
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

> v2:
> - rebased against renesas-devel-20171205-v4.15-rc2

Seems my
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
was not added.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
