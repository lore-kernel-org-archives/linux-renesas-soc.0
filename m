Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ty1jpn01on0135.outbound.protection.outlook.com ([104.47.93.135]:40664
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726435AbeKHWOZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 17:14:25 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>
CC: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/3][can-next] can: rcar_can: Fix erroneous
 registration
Date: Thu, 8 Nov 2018 12:39:00 +0000
Message-ID: <TY1PR01MB17709CF3F3391728480C26B2C0C50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1536576195-11520-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1536576195-11520-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1536576195-11520-2-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear All,

Is this patch ok?

Thanks,
Fab

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 10 September 2018 11:43
> Subject: [PATCH v2 1/3][can-next] can: rcar_can: Fix erroneous registrati=
on
>
> Assigning 2 to "renesas,can-clock-select" tricks the driver into
> registering the CAN interface, even though we don't want that.
> This patch improves one of the checks to prevent that from happening.
>
> Fixes: 862e2b6af9413b43 ("can: rcar_can: support all input clocks")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
>
> v1->v2:
> * dropped id specific data as per Geert's comments
>
> This patch applies on top of linux-can-next-for-4.19-20180727.
>
>  drivers/net/can/rcar/rcar_can.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/can/rcar/rcar_can.c b/drivers/net/can/rcar/rcar_=
can.c
> index 11662f4..771a460 100644
> --- a/drivers/net/can/rcar/rcar_can.c
> +++ b/drivers/net/can/rcar/rcar_can.c
> @@ -24,6 +24,9 @@
>
>  #define RCAR_CAN_DRV_NAME"rcar_can"
>
> +#define RCAR_SUPPORTED_CLOCKS(BIT(CLKR_CLKP1) | BIT(CLKR_CLKP2) | \
> + BIT(CLKR_CLKEXT))
> +
>  /* Mailbox configuration:
>   * mailbox 60 - 63 - Rx FIFO mailboxes
>   * mailbox 56 - 59 - Tx FIFO mailboxes
> @@ -789,7 +792,7 @@ static int rcar_can_probe(struct platform_device *pde=
v)
>  goto fail_clk;
>  }
>
> -if (clock_select >=3D ARRAY_SIZE(clock_names)) {
> +if (!(BIT(clock_select) & RCAR_SUPPORTED_CLOCKS)) {
>  err =3D -EINVAL;
>  dev_err(&pdev->dev, "invalid CAN clock selected\n");
>  goto fail_clk;
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
