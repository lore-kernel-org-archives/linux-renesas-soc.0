Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:40644 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727245AbeH1Lhd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 07:37:33 -0400
Received: by mail-ua1-f65.google.com with SMTP id 101-v6so405171uav.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Aug 2018 00:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <1534760202-20114-1-git-send-email-jacopo+renesas@jmondi.org> <1534760202-20114-6-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1534760202-20114-6-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Aug 2018 09:46:57 +0200
Message-ID: <CAMuHMdXrdgryGaKRvg39snrDrWEDzgAyDS27Sz1pd-yHk=yJ6g@mail.gmail.com>
Subject: Re: [RFT 5/8] pinctrl: sh-pfc: r8a77990: Add VIN pins, groups and functions
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <damm+renesas@opensource.se>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Mon, Aug 20, 2018 at 12:17 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds VIN{4,5} pins, groups and functions to the R8A77990 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for your patch!

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> @@ -1982,6 +1982,446 @@ static const unsigned int usb30_id_mux[] = {
>         USB3HS0_ID_MARK,
>  };
>
> +/* - VIN4 ------------------------------------------------------------------- */
> +static const unsigned int vin4_data8_a_pins[] = {
> +       RCAR_GP_PIN(2, 6),  RCAR_GP_PIN(2, 7),
> +       RCAR_GP_PIN(2, 8),  RCAR_GP_PIN(2, 9),
> +       RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
> +       RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
> +};
> +
> +static const unsigned int vin4_data8_a_mux[] = {
> +       VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
> +       VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
> +       VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
> +       VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
> +};
> +
> +static const unsigned int vin4_data10_a_pins[] = {
> +       RCAR_GP_PIN(2, 6),  RCAR_GP_PIN(2, 7),
> +       RCAR_GP_PIN(2, 8),  RCAR_GP_PIN(2, 9),
> +       RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
> +       RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
> +       RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> +};
> +
> +static const unsigned int vin4_data10_a_mux[] = {
> +       VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
> +       VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
> +       VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
> +       VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
> +       VI4_DATA8_MARK,   VI4_DATA9_MARK,
> +};

Can you please use union vin_data and VIN_DATA_PIN_GROUP(), to reduce
redundancies, cfr. commit 9942a5b52990b8d5 ("pinctrl: sh-pfc: r8a7795:
Deduplicate VIN4 pin definitions")?
Or do you want to do that in a follow-up patch (which means more
review work)?

> +static const unsigned int vin4_data8_sft8_pins[] = {
> +       RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> +       RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> +       RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
> +       RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
> +};

R-Car H3 and M3-W don't have the data8_sft8 groups yet (the BSP has).
IIRC, that's due to rcar-vin not yet supporting that mode. Niklas?

> +static const unsigned int vin5_sync_a_pins[] = {
> +       /* HSYNC_N, VSYNC_N */
> +       RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 9),
> +};
> +
> +static const unsigned int vin5_sync_a_mux[] = {
> +       VI5_HSYNC_N_A_MARK, VI5_VSYNC_N_A_MARK,
> +};
> +
> +static const unsigned int vin5_field_a_pins[] = {
> +       RCAR_GP_PIN(1, 10),
> +};
> +
> +static const unsigned int vin5_field_a_mux[] = {
> +       VI5_FIELD_A_MARK,
> +};
> +
> +static const unsigned int vin5_clkenb_a_pins[] = {
> +       RCAR_GP_PIN(0, 1),
> +};
> +
> +static const unsigned int vin5_clkenb_a_mux[] = {
> +       VI5_CLKENB_A_MARK,
> +};

"A" groups without "B" groups? Usually we drop the "_A" suffix in that case.

They're actually named like that in hardware user manual rev. 1.00 (and no
update in the errata)?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
