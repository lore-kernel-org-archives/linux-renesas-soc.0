Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:44904 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933953AbeAXPw0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jan 2018 10:52:26 -0500
Received: by mail-qt0-f194.google.com with SMTP id l20so11400790qtj.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2018 07:52:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1516808522-17348-2-git-send-email-biju.das@bp.renesas.com>
References: <1516808522-17348-1-git-send-email-biju.das@bp.renesas.com> <1516808522-17348-2-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Jan 2018 16:52:25 +0100
Message-ID: <CAMuHMdVH2o1hFU1wLvMu54XjvZv4deE=69G3QBmiVQC_Y-uTDA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: iommu: ipmmu-vmsa: Add device tree
 support for r8a774[35]
To: Biju Das <biju.das@bp.renesas.com>
Cc: Joerg Roedel <joro@8bytes.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        iommu@lists.linux-foundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 24, 2018 at 4:42 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> Document r8a774[35] specific compatible strings. The Renesas RZ/G1[ME]
> (r8a774[35]) IPMMU are identical to the R-Car Gen2 family.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
