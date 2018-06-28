Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:37039 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753788AbeF1NeM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Jun 2018 09:34:12 -0400
Received: by mail-vk0-f68.google.com with SMTP id h22-v6so3282767vke.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Jun 2018 06:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20180628124259.12760-1-horms+renesas@verge.net.au>
In-Reply-To: <20180628124259.12760-1-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Jun 2018 15:33:59 +0200
Message-ID: <CAMuHMdVBbQ-rHHcdkw=3_+Dng-sOdnV4uyQ7bGXT_FNWte67Fw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77965: Add second port to
 rcar_sound placeholder
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 28, 2018 at 2:43 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> This node is just a placeholder but fills that function better if it does
> not trigger build warnings. This update satisfies the requirement that
> nodes with #address-cells/#size-cells properties have more than one child
> node.
>
> This is flagged by dtc as follows:
>  # make dtbs W=1
>  arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: Warning (graph_child_address): /soc/sound@ec500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>  arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: Warning (graph_child_address): /soc/sound@ec500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
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
