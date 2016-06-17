Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35786 "EHLO
	mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753444AbcFQNYO (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 17 Jun 2016 09:24:14 -0400
Received: by mail-it0-f68.google.com with SMTP id e5so10735755ith.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2016 06:24:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1466165981-65284-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
References: <1466165981-65284-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Jun 2016 15:24:08 +0200
Message-ID: <CAMuHMdXz5mvR=+iWBap=jV7w94phuLXJSNKtOCqjxCEFNy=QDg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add DRIF support
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	"open list:MEDIA DRIVERS FOR RENESAS - FCP"
	<linux-renesas-soc@vger.kernel.org>,
	Chris Paterson <chris.paterson2@renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ramesh,

On Fri, Jun 17, 2016 at 2:19 PM, Ramesh Shanmugasundaram
<ramesh.shanmugasundaram@bp.renesas.com> wrote:
> This patch adds DRIF[0-3] pinmux support for r8a7795 SoC.
>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>

Thanks for your patch!

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 121 +++++++++++++++++++++++++++++++++++
>  1 file changed, 121 insertions(+)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> index 33be5d56..6f246ec 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> @@ -1658,6 +1658,91 @@ static const unsigned int canfd1_data_mux[] = {
>         CANFD1_TX_MARK,         CANFD1_RX_MARK,
>  };
>
> +/* - DRIF --------------------------------------------------------------- */
> +static const unsigned int drif0_data_a_pins[] = {
> +       /* CLK, SYNC, D0, D1 */
> +       RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9), RCAR_GP_PIN(6, 10),
> +       RCAR_GP_PIN(6, 7),
> +};
> +static const unsigned int drif0_data_a_mux[] = {
> +       RIF0_CLK_A_MARK, RIF0_SYNC_A_MARK, RIF0_D0_A_MARK, RIF0_D1_A_MARK,
> +};

According to my information, each DRIF module consists of two sub-modules
(that's why there are 8 module clocks for 4 DRIF modules), each handling a data
pin, but sharing the CLK and SYNC signals.
Hence it's possible to receive using only one data pin. Is that correct?

Shouldn't the pinctrl data reflect that? The second unused data pin could be
used for something else.

One way to handle this is like SDHI and DU do: provide 2 sets of data, one for
single-bit, and one for dual-bit configurations:
  - "drif0_data1_a_pins" for CLK, SYNC, and D0,
  - "drif0_data2_a_pins" for CLK. SYNC, D0, and D1.

Alternative, it could be split in 3 groups:
  - "drif0_ctrl_a_pins" for CLK and SYNC,
  - "drif0_data0_a_pins for D0,
  - "drif0_data1_a_pins for D1.

I think the latter is preferable, as you can probably configure the DRIF to
receive data through D1 only, and leave D0 unused?

> +static const unsigned int drif3_data_a_pins[] = {
> +       /* CLK, SYNC, D0, D1 */
> +       RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 18), RCAR_GP_PIN(6, 19),
> +       RCAR_GP_PIN(6, 10),

According to my datasheet, the above line should be

        RCAR_GP_PIN(6, 20),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
