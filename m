Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1502281187-24068-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1502281187-24068-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1502281187-24068-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Aug 2017 13:06:22 +0200
Message-ID: <CAMuHMdWQD9Gnt0hCHf8nwdq0etWQW=zSuXqFe7qrxmQ7SAEVjw@mail.gmail.com>
Subject: Re: [PATCH 5/8] pinctrl: sh-pfc: r8a77995: Add EthernetAVB pins,
 groups and functions
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san, Kihara-san,

On Wed, Aug 9, 2017 at 2:19 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

But before I apply this, please see my question below...

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c

> +static const char * const avb0_groups[] = {
> +       "avb0_td",
> +       "avb0_rd",
> +       "avb0_tx_ctl",
> +       "avb0_rx_ctl",
> +       "avb0_txc",
> +       "avb0_rxc",
> +       "avb0_txcrefclk",
> +       "avb0_link",
> +       "avb0_magic",
> +       "avb0_phy_int",
> +       "avb0_mdc",
> +       "avb0_mdio",
> +       "avb0_avtp_pps_a",
> +       "avb0_avtp_match_a",
> +       "avb0_avtp_capture_a",
> +       "avb0_avtp_pps_b",
> +       "avb0_avtp_match_b",
> +       "avb0_avtp_capture_b",
> +};

Is there any specific reason this uses a different split than the
EtherAVB groups
in pinctrl drivers for other SoCs?

Note that I do understand that the different prefix ("avb0" vs. "avb")
was used to
match the R-Car D3 datasheet, which is thus OK.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
