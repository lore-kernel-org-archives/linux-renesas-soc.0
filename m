Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:46851 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757377AbdJKM5B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 08:57:01 -0400
MIME-Version: 1.0
In-Reply-To: <1507555281-57845-5-git-send-email-biju.das@bp.renesas.com>
References: <1507555281-57845-1-git-send-email-biju.das@bp.renesas.com> <1507555281-57845-5-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Oct 2017 14:56:59 +0200
Message-ID: <CAMuHMdWQeH7tBJ22=+BdWdbuL8w1ZjqtFzvksCxaHhY9woHQbA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: r8a7743: Enable DMA for HSUSB
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 9, 2017 at 3:21 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds DMA properties to the HSUSB node.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
