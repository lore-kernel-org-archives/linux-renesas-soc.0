Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34955 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935154AbdIYLVg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2017 07:21:36 -0400
MIME-Version: 1.0
In-Reply-To: <1506329660-4064-2-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1506329660-4064-1-git-send-email-fabrizio.castro@bp.renesas.com> <1506329660-4064-2-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Sep 2017 13:21:34 +0200
Message-ID: <CAMuHMdUA-ukN=Vv68Zbe2N2Z=fkKrq=w9QPm4uKyb5k68v+qcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] spi: sh-msiof: Add compatible strings for r8a774[35]
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

On Mon, Sep 25, 2017 at 10:54 AM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

This patch is not needed...

> ---
>  drivers/spi/spi-sh-msiof.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
> index 0eb1e95..0080844 100644
> --- a/drivers/spi/spi-sh-msiof.c
> +++ b/drivers/spi/spi-sh-msiof.c
> @@ -1021,6 +1021,8 @@ static const struct sh_msiof_chipdata rcar_gen3_data = {
>
>  static const struct of_device_id sh_msiof_match[] = {
>         { .compatible = "renesas,sh-mobile-msiof", .data = &sh_data },
> +       { .compatible = "renesas,msiof-r8a7743",   .data = &rcar_gen2_data },
> +       { .compatible = "renesas,msiof-r8a7745",   .data = &rcar_gen2_data },
>         { .compatible = "renesas,msiof-r8a7790",   .data = &rcar_gen2_data },
>         { .compatible = "renesas,msiof-r8a7791",   .data = &rcar_gen2_data },
>         { .compatible = "renesas,msiof-r8a7792",   .data = &rcar_gen2_data },

... as the driver already matches against the family-specific compatible value
below:

        { .compatible = "renesas,rcar-gen2-msiof", .data = &rcar_gen2_data },

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
