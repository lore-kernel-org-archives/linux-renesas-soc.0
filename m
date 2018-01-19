Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:36776 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754070AbeASIqa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 03:46:30 -0500
Received: by mail-qt0-f194.google.com with SMTP id z11so2109280qtm.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2018 00:46:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180117161717.14589-7-horms+renesas@verge.net.au>
References: <20180117161717.14589-1-horms+renesas@verge.net.au> <20180117161717.14589-7-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jan 2018 09:46:29 +0100
Message-ID: <CAMuHMdV_wYCbGreShikfi4LQaNxDUAW+aX=3L8Gd_b=9wHSgZw@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] ARM: dts: r8a7791: add soc node
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 17, 2018 at 5:17 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Add soc node to represent the bus and move all nodes with a base address
> into this node. This is consistent with handling of R-Car Gen3, RZ/G1, and
> R-Car V2H (R8A77920) SoCs upstream. It is intended to migrate other R-Car
> Gen2 SoCs to this scheme.
>
> The ordering is derived from simply moving each node with an address up to
> before any nodes without a base address that occur before the soc node.  To
> improve maintainability follow-up patches will sort subnodes of both the
> new soc node and the root node.
>
> This patch should not introduce any functional change.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
