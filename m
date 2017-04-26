Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:34093 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1952030AbdDZHqY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Apr 2017 03:46:24 -0400
Received: by mail-it0-f65.google.com with SMTP id c26so16607854itd.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Apr 2017 00:46:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8737cvsyah.wl%kuninori.morimoto.gx@renesas.com>
References: <8760hrsyca.wl%kuninori.morimoto.gx@renesas.com> <8737cvsyah.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Apr 2017 09:46:21 +0200
Message-ID: <CAMuHMdXkSXMFj5qv2iSpSupUTTEeqjfwRQuy=n3KNx862hsz3w@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: rsnd: add missing clocks/clock-names on Document
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Simon <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Wed, Apr 26, 2017 at 4:26 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for doing this!

> ---
>  Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> index 3332910..13cb21d5 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> @@ -368,6 +368,10 @@ Required properties:
>                                   see below for detail.
>  - #sound-dai-cells             : it must be 0 if your system is using single DAI
>                                   it must be 1 if your system is using multi  DAI
> +- clocks                       : References to SSI/SRC/MIX/CTU/DVC/AUDIO_CLK clocks.
> +- clock-names                  : List of necessary clock names.
> +                                 "ssi-all", "ssi.X", "src.X", "mix.X", "ctu.X",
> +                                 "dvc.X", "clk_a", "clk_b", "clk_c", "clk_i"

Are all clock mandatory?
r8a7778.dtsi doesn't have "ssi-all" and the mix, ctu, and dvc clocks.
r8a7793.dtsi doesn't have the mix and ctu clocks.

Thanks again!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
