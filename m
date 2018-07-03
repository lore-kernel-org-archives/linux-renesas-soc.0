Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:36986 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753231AbeGCPXF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jul 2018 11:23:05 -0400
MIME-Version: 1.0
References: <20180703151842.28750-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180703151842.28750-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Jul 2018 17:22:53 +0200
Message-ID: <CAMuHMdW7BLpQG2LBcPuENGBzpfZ7du7mis4r0ez=vNG2qeQqMw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a77970: remove SH_PFC_PIN_CFG_DRIVE_STRENGTH
 flag
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas, Linus,

On Tue, Jul 3, 2018 at 5:20 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The datasheet does not document any registers to control drive strength,
> and no drive strength registers are for this reason described for this
> SoC. The flags indicating that drive strength can be controlled are
> however set for some pins in the driver.
>
> This leads to a NULL pointer dereference when the sh-pfc core tries to
> access the struct describing the drive strength registers, for example
> when reading the sysfs file pinconf-pins.
>
> Fix this by removing the SH_PFC_PIN_CFG_DRIVE_STRENGTH from all pins.
>
> Fixes: b92ac66a1819602b ("pinctrl: sh-pfc: Add R8A77970 PFC support")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> ---
>
> * Changes since v1
> - Fix spelling in commit message.
> - Add fixes tag.
> - Collect review tags.

Linus: As this fixes a bug (crash), can you please take this directly,
and queue it
for v4.18?

Thanks!

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a77970.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
> index b02caf31671186d9..eeb58b3bbc9a0cef 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
> @@ -21,15 +21,13 @@
>  #include "core.h"
>  #include "sh_pfc.h"
>
> -#define CFG_FLAGS SH_PFC_PIN_CFG_DRIVE_STRENGTH
> -
>  #define CPU_ALL_PORT(fn, sfx)                                          \
> -       PORT_GP_CFG_22(0, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
> -       PORT_GP_CFG_28(1, fn, sfx, CFG_FLAGS),                          \
> -       PORT_GP_CFG_17(2, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
> -       PORT_GP_CFG_17(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
> -       PORT_GP_CFG_6(4,  fn, sfx, CFG_FLAGS),                          \
> -       PORT_GP_CFG_15(5, fn, sfx, CFG_FLAGS)
> +       PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),          \
> +       PORT_GP_28(1, fn, sfx),                                         \
> +       PORT_GP_CFG_17(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),          \
> +       PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),          \
> +       PORT_GP_6(4,  fn, sfx),                                         \
> +       PORT_GP_15(5, fn, sfx)
>  /*
>   * F_() : just information
>   * FM() : macro for FN_xxx / xxx_MARK

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
