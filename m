Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:36862 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752167AbeBLPMD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 10:12:03 -0500
Received: by mail-qk0-f179.google.com with SMTP id 15so18719354qkl.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2018 07:12:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180212143930.4763-1-horms+renesas@verge.net.au>
References: <20180212143930.4763-1-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Feb 2018 16:12:02 +0100
Message-ID: <CAMuHMdXbpRGmUCcfND2h4=g0v5Cj9L=VYZGVLntjbBgsN4Q4HA@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: dts: r7s72100: add soc node
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Mon, Feb 12, 2018 at 3:39 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> this patchset adds an soc node, moves all nodes for IP blocks with an
> address on the bus to be sub nodes of the soc node, removes the clock node
> and sorts subnodes of the root and soc nodes.
>
> This brings the DTS of the r7s72100 in line with that of R-Car Gen 2 SoCs.
>
> Simon Horman (4):
>   ARM: dts: r7s72100: add soc node
>   ARM: dts: r7s72100: sort subnodes of soc node
>   ARM: dts: r7s72100: stop grouping clocks under a "clocks" subnode
>   ARM: dts: r7s72100: sort subnodes of root node

Thanks!

>  arch/arm/boot/dts/r7s72100.dtsi | 1038 ++++++++++++++++++++-------------------
>  1 file changed, 521 insertions(+), 517 deletions(-)

For the whole series, with a bit of help from dtx_diff:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
