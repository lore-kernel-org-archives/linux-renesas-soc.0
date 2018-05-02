Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:34652 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751076AbeEBNKT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 09:10:19 -0400
Received: by mail-vk0-f68.google.com with SMTP id t63-v6so8922924vkb.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 May 2018 06:10:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180426102951.8683-1-horms+renesas@verge.net.au>
References: <20180426102951.8683-1-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 May 2018 15:10:18 +0200
Message-ID: <CAMuHMdUBtNrny+DPqamKSL6nmiyuF38BQdD0eqc7kzDhuMSQqg@mail.gmail.com>
Subject: Re: [PATCH 00/10] ARM, arm64: dts: renesas: update register properties
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Apr 26, 2018 at 12:29 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> this series:
>
> 1. Drops unnecessary address properties from VIN port nodes
>    on Renesas R-Car Gen2 SoC board DTSes. These are unnecessary
>    as the nodes to not have bus addresses.

I guess the example in Documentation/devicetree/bindings/media/rcar_vin.txt
should be updated, too?

> 2. And adds address properties to R-Car Sound port nodes on
>    Renesas R-Car Gen2 SoC DTSes. These are necessary as the nodes
>    have unit names.

Documentation/devicetree/bindings/sound/renesas,rsnd.txt doesn't say
anything about the presence of ports?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
