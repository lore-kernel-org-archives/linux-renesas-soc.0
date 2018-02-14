Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:43517 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754556AbeBNIQv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 03:16:51 -0500
MIME-Version: 1.0
In-Reply-To: <20180213232916.31470-1-marek.vasut+renesas@gmail.com>
References: <20180213232916.31470-1-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2018 09:16:50 +0100
Message-ID: <CAMuHMdUtVkBPwYKzhEh0WObyMdJs4nk2a2UJ+hHT7cztM62_tw@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: Document Renesas H2-based Stout DT bindings
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Wed, Feb 14, 2018 at 12:29 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
> Document the Renesas H2 Stout (ADAS Starter Kit) device tree bindings,

Thanks for your patch!

According to https://elinux.org/images/1/10/StoutTopWithLabels.png,
it's called "ADAS Starterkit".

> listing it as a supported board.
>
> This allows to use checkpatch.pl to validate .dts files referring to
> the Stout board.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>


> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
> index 41d3920aaa5e..bf9bb6eda4a6 100644
> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -94,6 +94,8 @@ Boards:
>      compatible = "renesas,kzm9g", "renesas,sh73a0"
>    - Lager (RTP0RC7790SEB00010S)
>      compatible = "renesas,lager", "renesas,r8a7790"
> +  - Stout (Y-R-CAR-ADAS-SKH2-BOARD)

Please keep the list alphabetically sorted.

I'd add "ADAS Starterkit" here, too, cfr. M3ULCB below.

> +    compatible = "renesas,stout", "renesas,r8a7790"
>    - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
>      compatible = "renesas,m3ulcb", "renesas,r8a7796"
>    - Marzen (R0P7779A00010S)

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
