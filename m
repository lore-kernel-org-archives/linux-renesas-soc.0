Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34638 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751559AbcH2Pns (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2016 11:43:48 -0400
MIME-Version: 1.0
In-Reply-To: <1470404163-27427-1-git-send-email-chris.brandt@renesas.com>
References: <1470404163-27427-1-git-send-email-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Aug 2016 17:43:46 +0200
Message-ID: <CAMuHMdWVvZLWvVVzHMr+5--PAJkGx0r-Z1=eCiGJddcY6aDNLA@mail.gmail.com>
Subject: Re: [PATCH] spi: rspi: Increase accuracy of bit rate for RZ
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Palmer <danieruru@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Fri, Aug 5, 2016 at 3:36 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> When you leave the clock divider at 0, 130kHz is the lowest you can go.
> Also, by adjusting the clock divider you can get more accurate resolutions
> for clock speeds lower than 16MHz. This patch uses the clock divider as
> part of the bit rate setup.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/spi/spi-rspi.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
> index 8188433..a816f07 100644
> --- a/drivers/spi/spi-rspi.c
> +++ b/drivers/spi/spi-rspi.c
> @@ -295,14 +295,24 @@ static int rspi_set_config_register(struct rspi_data *rspi, int access_size)
>  static int rspi_rz_set_config_register(struct rspi_data *rspi, int access_size)
>  {
>         int spbr;
> +       int div = 0;
> +       unsigned long clksrc;
>
>         /* Sets output mode, MOSI signal, and (optionally) loopback */
>         rspi_write8(rspi, rspi->sppcr, RSPI_SPPCR);
>
> +       clksrc = clk_get_rate(rspi->clk);
> +       while (div < 3) {
> +               if (rspi->max_speed_hz >= clksrc/4) /* 4=(CLK/2)/2 */
> +                       break;
> +               div++;
> +               clksrc /= 2;
> +       }
> +
>         /* Sets transfer bit rate */
> -       spbr = DIV_ROUND_UP(clk_get_rate(rspi->clk),
> -                           2 * rspi->max_speed_hz) - 1;
> +       spbr = DIV_ROUND_UP(clksrc, 2 * rspi->max_speed_hz) - 1;
>         rspi_write8(rspi, clamp(spbr, 0, 255), RSPI_SPBR);
> +       rspi->spcmd |= div << 2;
>
>         /* Disable dummy transmission, set byte access */
>         rspi_write8(rspi, SPDCR_SPLBYTE, RSPI_SPDCR);

I believe this applies not only to RZ, but to all other supported RSPI variants?
Hence I think it should be made common.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
