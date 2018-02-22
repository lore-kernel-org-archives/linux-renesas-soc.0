Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:35327 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752643AbeBVJKL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Feb 2018 04:10:11 -0500
MIME-Version: 1.0
In-Reply-To: <20180221233250.14529-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180221233250.14529-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Feb 2018 10:10:09 +0100
Message-ID: <CAMuHMdUys2DQ9vOGdmXEuyueS40Fn2yHnmwasO0=v8xAdRAnKQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: remove duplicate of CLKOUT pin
 in pinmux_pins[]
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas, Linus,

CC pinctrl

On Thu, Feb 22, 2018 at 12:32 AM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When adding GP-1-28 port pin support it was forgotten to remove the
> CLKOUT pin from the list of pins that are not associated with a GPIO
> port in pinmux_pins[]. This results in a warning when reading the
> pinctrl files in sysfs as the CLKOUT pin is still added as a none GPIO
> pin. Fix this by removing the duplicated entry which is no longer
> needed.
>
> ~ # cat /sys/kernel/debug/pinctrl/e6060000.pin-controller/pinconf-pins
> [   89.432081] ------------[ cut here ]------------
> [   89.436904] Pin 496 is not in bias info list
> [   89.441252] WARNING: CPU: 1 PID: 456 at drivers/pinctrl/sh-pfc/core.c:=
408 sh_pfc_pin_to_bias_reg+0xb0/0xb8
> [   89.451002] CPU: 1 PID: 456 Comm: cat Not tainted 4.16.0-rc1-arm64-ren=
esas-00048-gdfafc344a4f24dde #12
> [   89.460394] Hardware name: Renesas Salvator-X 2nd version board based =
on r8a7795 ES2.0+ (DT)
> [   89.468910] pstate: 80000085 (Nzcv daIf -PAN -UAO)
> [   89.473747] pc : sh_pfc_pin_to_bias_reg+0xb0/0xb8
> [   89.478495] lr : sh_pfc_pin_to_bias_reg+0xb0/0xb8
> [   89.483241] sp : ffff00000aff3ab0
> [   89.486587] x29: ffff00000aff3ab0 x28: ffff00000893c698
> [   89.491955] x27: ffff000008ad7d98 x26: 0000000000000000
> [   89.497323] x25: ffff8006fb3f5028 x24: ffff8006fb3f5018
> [   89.502690] x23: 0000000000000001 x22: 00000000000001f0
> [   89.508057] x21: ffff8006fb3f5018 x20: ffff000008bef000
> [   89.513423] x19: 0000000000000000 x18: ffffffffffffffff
> [   89.518790] x17: 0000000000006c4a x16: ffff000008d67c98
> [   89.524157] x15: 0000000000000001 x14: ffff00000896ca98
> [   89.529524] x13: 00000000cce5f611 x12: ffff8006f8d3b5a8
> [   89.534891] x11: ffff00000981e000 x10: ffff000008befa08
> [   89.540258] x9 : ffff8006f9b987a0 x8 : ffff000008befa08
> [   89.545625] x7 : ffff000008137094 x6 : 0000000000000000
> [   89.550991] x5 : 0000000000000000 x4 : 0000000000000001
> [   89.556357] x3 : 0000000000000007 x2 : 0000000000000007
> [   89.561723] x1 : 1ff24f80f1818600 x0 : 0000000000000000
> [   89.567091] Call trace:
> [   89.569561]  sh_pfc_pin_to_bias_reg+0xb0/0xb8
> [   89.573960]  r8a7795_pinmux_get_bias+0x30/0xc0
> [   89.578445]  sh_pfc_pinconf_get+0x1e0/0x2d8
> [   89.582669]  pin_config_get_for_pin+0x20/0x30
> [   89.587067]  pinconf_generic_dump_one+0x180/0x1c8
> [   89.591815]  pinconf_generic_dump_pins+0x84/0xd8
> [   89.596476]  pinconf_pins_show+0xc8/0x130
> [   89.600528]  seq_read+0xe4/0x510
> [   89.603789]  full_proxy_read+0x60/0x90
> [   89.607576]  __vfs_read+0x30/0x140
> [   89.611010]  vfs_read+0x90/0x170
> [   89.614269]  SyS_read+0x60/0xd8
> [   89.617443]  __sys_trace_return+0x0/0x4
> [   89.621314] ---[ end trace 99c8d0d39c13e794 ]---
>
> Fixes: 82d2de5a4f646f72 ("pinctrl: sh-pfc: r8a7795: Add GP-1-28 port pin =
support")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-and-tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Linus: As the offending patch is only in v4.16-rc1 and later, can you pleas=
e
take it directly as a fix for v4.16?

https://patchwork.kernel.org/patch/10234351/

Thanks!

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pf=
c/pfc-r8a7795.c
> index 18aeee592fdcf246..35951e7b89d2fae3 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> @@ -1538,7 +1538,6 @@ static const struct sh_pfc_pin pinmux_pins[] =3D {
>         SH_PFC_PIN_NAMED_CFG('B', 18, AVB_TD1, CFG_FLAGS),
>         SH_PFC_PIN_NAMED_CFG('B', 19, AVB_RXC, CFG_FLAGS),
>         SH_PFC_PIN_NAMED_CFG('C',  1, PRESETOUT#, CFG_FLAGS),
> -       SH_PFC_PIN_NAMED_CFG('F',  1, CLKOUT, CFG_FLAGS),
>         SH_PFC_PIN_NAMED_CFG('H', 37, MLB_REF, CFG_FLAGS),
>         SH_PFC_PIN_NAMED_CFG('V',  3, QSPI1_SPCLK, CFG_FLAGS),
>         SH_PFC_PIN_NAMED_CFG('V',  5, QSPI1_SSL, CFG_FLAGS),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
