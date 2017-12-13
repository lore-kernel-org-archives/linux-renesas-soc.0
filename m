Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:37897 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752175AbdLMNeD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 08:34:03 -0500
MIME-Version: 1.0
In-Reply-To: <1513162673-31531-2-git-send-email-biju.das@bp.renesas.com>
References: <1513162673-31531-1-git-send-email-biju.das@bp.renesas.com> <1513162673-31531-2-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2017 14:34:00 +0100
Message-ID: <CAMuHMdVWvWsTdTga8uqv5qt3EUMJUk+Mm-YTqZsX8kFaWN9G2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: rcar: Add device tree support
 for r8a7743
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Dec 13, 2017 at 11:57 AM, Biju Das <biju.das@bp.renesas.com> wrote:
> Add thermal sensor support for r8a7743 SoC. The Renesas RZ/G1M
> (r8a7743) thermal sensor module is identical to the R-Car Gen2 family.
>
> No driver change is needed due to the fallback compatible value
> "renesas,rcar-gen2-thermal".
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
