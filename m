Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:43734 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbeK3UMo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 15:12:44 -0500
MIME-Version: 1.0
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com> <1543319795-48325-23-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543319795-48325-23-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Nov 2018 10:03:54 +0100
Message-ID: <CAMuHMdVVLCgh3JC1rSdW+cK4fwrqKLOSZnY9gFe-=y=VepGriA@mail.gmail.com>
Subject: Re: [PATCH 22/22] ARM: dts: r8a7744: Add PCIe Controller device node
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 27, 2018 at 1:06 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Add a device node for the PCIe controller on the Renesas
> RZ/G1N (r8a7744) SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
