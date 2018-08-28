Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:40892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbeH1Okd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 10:40:33 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77990: Add DU pins, groups and function
Date: Tue, 28 Aug 2018 13:49:30 +0300
Message-ID: <4713868.QquCvF2C2s@avalon>
In-Reply-To: <CAMuHMdXiFGjJROJM0iOajOyU-GL70BbG1WZ5U04F_yuT-Asb+A@mail.gmail.com>
References: <20180823070903.4380-1-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdXiFGjJROJM0iOajOyU-GL70BbG1WZ5U04F_yuT-Asb+A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Tuesday, 28 August 2018 11:41:00 EEST Geert Uytterhoeven wrote:
> On Thu, Aug 23, 2018 at 9:09 AM Laurent Pinchart wrote:
> > This patch adds DU pins, groups and function for the R8A77990 (E3) SoC.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> > @@ -1371,6 +1371,87 @@ static const unsigned int avb_avtp_capture_a_mux[]
> > = {> 
> >         AVB_AVTP_CAPTURE_A_MARK,
> >  
> >  };
> > 
> > +/* - DU
> > --------------------------------------------------------------------- */
> > +static const unsigned int du_rgb666_pins[] = {
> > +       /* R[7:2], G[7:2], B[7:2] */
> > +       RCAR_GP_PIN(0, 8),  RCAR_GP_PIN(0, 6),  RCAR_GP_PIN(0, 5),
> > +       RCAR_GP_PIN(0, 3),  RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 0),
> > +       RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 10),
> > +       RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 11),
> > +       RCAR_GP_PIN(0, 1),  RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 16),
> > +       RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13),
> > +};
> > +static const unsigned int du_rgb666_mux[] = {
> > +       DU_DR7_MARK, DU_DR6_MARK, DU_DR5_MARK, DU_DR4_MARK,
> > +       DU_DR3_MARK, DU_DR2_MARK,
> > +       DU_DG7_MARK, DU_DG6_MARK, DU_DG5_MARK, DU_DG4_MARK,
> > +       DU_DG3_MARK, DU_DG2_MARK,
> > +       DU_DB7_MARK, DU_DB6_MARK, DU_DB5_MARK, DU_DB4_MARK,
> > +       DU_DB3_MARK, DU_DB2_MARK,
> > +};
> > +static const unsigned int du_rgb888_pins[] = {
> > +       /* R[7:0], G[7:0], B[7:0] */
> > +       RCAR_GP_PIN(0, 8),  RCAR_GP_PIN(0, 6),  RCAR_GP_PIN(0, 5),
> > +       RCAR_GP_PIN(0, 3),  RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 0),
> > +       RCAR_GP_PIN(1, 22), RCAR_GP_PIN(1, 21),
> > +       RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 10),
> > +       RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 11),
> > +       RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 9),
> > +       RCAR_GP_PIN(0, 1),  RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 16),
> > +       RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13),
> > +       RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 18),
> > +};
> > +static const unsigned int du_rgb888_mux[] = {
> > +       DU_DR7_MARK, DU_DR6_MARK, DU_DR5_MARK, DU_DR4_MARK,
> > +       DU_DR3_MARK, DU_DR2_MARK, DU_DR1_MARK, DU_DR0_MARK,
> > +       DU_DG7_MARK, DU_DG6_MARK, DU_DG5_MARK, DU_DG4_MARK,
> > +       DU_DG3_MARK, DU_DG2_MARK, DU_DG1_MARK, DU_DG0_MARK,
> > +       DU_DB7_MARK, DU_DB6_MARK, DU_DB5_MARK, DU_DB4_MARK,
> > +       DU_DB3_MARK, DU_DB2_MARK, DU_DB1_MARK, DU_DB0_MARK,
> > +};
> > +static const unsigned int du_clk_in_1_pins[] = {
> > +       /* CLKIN */
> > +       RCAR_GP_PIN(1, 1),
> > +};
> > +static const unsigned int du_clk_in_1_mux[] = {
> > +       DU_DOTCLKIN1_MARK
> > +};
> 
> Missing du_clk_in_0 (GP0_16)?

Indeed. v2 is on its way.

-- 
Regards,

Laurent Pinchart
