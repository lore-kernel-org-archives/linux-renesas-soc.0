Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:35190 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752081AbeF0I2F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jun 2018 04:28:05 -0400
MIME-Version: 1.0
References: <20180627055959.21001-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180627055959.21001-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Jun 2018 10:27:54 +0200
Message-ID: <CAMuHMdVj3K=8XfAgVB5-HKC_nPRAtRcLuCnBkjErHiw3-b8U5w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: fix a null pointer dereference of drive
 strength information
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Wed, Jun 27, 2018 at 8:01 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Not all SoCs describes the drive strength registers. When reading the
> sysfs pinconf-pins file on such a SoC this results in a null pointer
> dereference. Protect against this dereference and allow reading of the
> pinconf-pins by adding a check if the drive strength registers are
> described or not.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> This was found on the Eagle board and is based on the latest
> renesas/devel branch.

I think the real issue is pfc-r8a77990.c setting SH_PFC_PIN_CFG_DRIVE_STRENGTH
without providing sh_pfc.drive_regs[].
Without that flag set, sh_pfc_pinconf_validate(..., PIN_CONFIG_DRIVE_STRENGTH)
would cause an earlier failure.

> --- a/drivers/pinctrl/sh-pfc/pinctrl.c
> +++ b/drivers/pinctrl/sh-pfc/pinctrl.c
> @@ -483,6 +483,9 @@ static u32 sh_pfc_pinconf_find_drive_strength_reg(struct sh_pfc *pfc,
>         const struct pinmux_drive_reg *reg;
>         unsigned int i;
>
> +       if (!pfc->info->drive_regs)
> +               return 0;
> +
>         for (reg = pfc->info->drive_regs; reg->reg; ++reg) {
>                 for (i = 0; i < ARRAY_SIZE(reg->fields); ++i) {
>                         field = &reg->fields[i];

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
