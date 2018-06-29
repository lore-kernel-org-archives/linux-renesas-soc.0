Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:40861 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752957AbeF2HSp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jun 2018 03:18:45 -0400
MIME-Version: 1.0
References: <20180628204538.866-1-wsa+renesas@sang-engineering.com> <20180628204538.866-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180628204538.866-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Jun 2018 09:18:32 +0200
Message-ID: <CAMuHMdWEce9+Se0b0pH2Uvma68ozSXxiPGUu__XFFX=yBtmKjw@mail.gmail.com>
Subject: Re: [PATCH 1/1] i2c: rcar: handle RXDMA HW behaviour on Gen3
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Thu, Jun 28, 2018 at 10:45 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Gen3, we can only do RXDMA once per transfer reliably. For that, we
> must reset the device, then we can have RXDMA once. This patch
> implements this. When there is no reset controller or the reset fails,
> RXDMA will be blocked completely. Otherwise, it will be disabled after
> the first RXDMA transfer. Based on a commit from the BSP by Hiromitsu
> Yamasaki, yet completely refactored to handle multiple read messages
> within one transfer.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c

> @@ -751,6 +780,16 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
>
>         pm_runtime_get_sync(dev);
>
> +       /* Gen3 needs a reset before allowing RXDMA once */
> +       if (priv->devtype == I2C_RCAR_GEN3) {

So on R-Car Gen3 the device is always reset, even if no reads will be done?
Or is that something you cannot check for at this point?

> +               priv->flags |= ID_P_NO_RXDMA;
> +               if (!IS_ERR(priv->rstc)) {
> +                       ret = rcar_i2c_do_reset(priv);
> +                       if (ret == 0)
> +                               priv->flags &= ~ID_P_NO_RXDMA;
> +               }
> +       }
> +
>         rcar_i2c_init(priv);
>
>         ret = rcar_i2c_bus_barrier(priv);
> @@ -921,6 +960,15 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>         if (ret < 0)
>                 goto out_pm_put;
>
> +       if (priv->devtype == I2C_RCAR_GEN3) {
> +               priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +               if (!IS_ERR(priv->rstc)) {
> +                       ret = reset_control_status(priv->rstc);

Why this call and check? To check if .status() is implemented (it always is
on R-Car Gen3, if CONFIG_RESET_CONTROLLER is enabled), and to avoid the
timeout in rcar_i2c_do_reset() on every transfer?

> +                       if (ret < 0)
> +                               priv->rstc = ERR_PTR(-ENOTSUPP);
> +               }
> +       }

Anyway:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
