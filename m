Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f194.google.com ([209.85.221.194]:36561 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbeLCIZr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 03:25:47 -0500
Received: by mail-vk1-f194.google.com with SMTP id t132so2688348vkc.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Dec 2018 00:25:43 -0800 (PST)
MIME-Version: 1.0
References: <1543675408-11382-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1543675408-11382-1-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Dec 2018 09:25:30 +0100
Message-ID: <CAMuHMdXvGEZpuDr6oWH0QGxVtfx-EUiQJ+_Jt33dZhn_Lw4EYQ@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77990-ebisu: Add BD9571 PMIC
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kaneko-san,

On Sat, Dec 1, 2018 at 3:43 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds the regulator definition required for operation of
> S2RAM.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -425,6 +425,26 @@
>         };
>  };
>
> +&i2c_dvfs {
> +       status = "okay";
> +
> +       clock-frequency = <400000>;
> +
> +       pmic: pmic@30 {
> +               pinctrl-0 = <&irq0_pins>;
> +               pinctrl-names = "default";
> +
> +               compatible = "rohm,bd9571mwv";
> +               reg = <0x30>;
> +               interrupt-parent = <&intc_ex>;
> +               interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               gpio-controller;
> +               #gpio-cells = <2>;

Just adding this node is not sufficient to make S2RAM work.
As per Documentation/devicetree/bindings/mfd/bd9571mwv.txt, you also have
to describe the DDR-Backup Power configuration.

On the Ebisu-4D development board, only the DDR0 power rail is used, and
needs to be kept powered when backup mode is enabled.

        rohm,ddr-backup-power = <0x1>;
        rohm,rstbmode-level;

Unfortunately resume from s2ram doesn't work with this, probably due to an
issue in ATF.  This may have been fixed in IPL and Secure Monitor Rev1.0.22,
which claims to add support for the Ebisu-4D board.

I don't know if plain Ebisu needs a different configuration.

> +       };
> +};
> +
>  &lvds0 {
>         status = "okay";
>

The rest is fine, hence with the above fixed and tested:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
