Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f171.google.com ([209.85.217.171]:35736 "EHLO
        mail-ua0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753273AbeDSN4F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Apr 2018 09:56:05 -0400
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB21032379AC54CD51765820F6B8B50@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1522855377-48527-1-git-send-email-biju.das@bp.renesas.com>
 <1522855377-48527-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdX9YC+QT_dbKSqtQUHJkoA=3=gmgPYNFdXBOrsTT9rCRw@mail.gmail.com>
 <OSBPR01MB2103463F72505673548AC737B8B70@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdX6YTD9X0r9Dfz5uLAx2vSvxPp7Hidi_FbtZjrdSuE8eA@mail.gmail.com> <OSBPR01MB21032379AC54CD51765820F6B8B50@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Apr 2018 15:56:03 +0200
Message-ID: <CAMuHMdW6ZKAxpagLgHSsPTA8x6iH4-cg3JJm2-Hxhk3Nq6V7hQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: sh-pfc: Add r8a77470 PFC support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Thu, Apr 19, 2018 at 3:48 PM, Biju Das <biju.das@bp.renesas.com> wrote:
>> On Tue, Apr 17, 2018 at 11:07 AM, Biju Das <biju.das@bp.renesas.com>
>> wrote:
>> >> Subject: Re: [PATCH v2 1/2] pinctrl: sh-pfc: Add r8a77470 PFC support
>> >> On Wed, Apr 4, 2018 at 5:22 PM, Biju Das <biju.das@bp.renesas.com>
>> wrote:
>> >> > Add PFC support for the R8A77470 SoC including pin groups for some
>> >> > on-chip devices such as SCIF, AVB and MMC.
>> >> >
>> >> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>> >> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>>
>> >> > --- /dev/null
>> >> > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
>>
>> >> > +/* - AVB
>> >> > +------------------------------------------------------------------
>> >> > +-- */ static const
>> >> unsigned int avb_link_pins[] = {
>> >> > +       RCAR_GP_PIN(5, 14),
>> >> > +};
>> >> > +static const unsigned int avb_link_mux[] = {
>> >> > +       AVB_LINK_MARK,
>> >> > +};
>> >> > +static const unsigned int avb_magic_pins[] = {
>> >> > +       RCAR_GP_PIN(5, 15),
>> >> > +};
>> >> > +static const unsigned int avb_magic_mux[] = {
>> >> > +       AVB_MAGIC_MARK,
>> >> > +};
>> >> > +static const unsigned int avb_phy_int_pins[] = {
>> >> > +       RCAR_GP_PIN(5, 16),
>> >> > +};
>> >> > +static const unsigned int avb_phy_int_mux[] = {
>> >> > +       AVB_PHY_INT_MARK,
>> >> > +};
>> >> > +static const unsigned int avb_mdio_pins[] = {
>> >> > +       RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 13), }; static const
>> >> > +unsigned int avb_mdio_mux[] = {
>> >> > +       AVB_MDC_MARK, AVB_MDIO_MARK, }; static const unsigned int
>> >> > +avb_mii_pins[] = {
>> >> > +       RCAR_GP_PIN(3, 14), RCAR_GP_PIN(3, 15), RCAR_GP_PIN(3, 16),
>> >> > +       RCAR_GP_PIN(3, 27),
>> >> > +
>> >> > +       RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3), RCAR_GP_PIN(3, 4),
>> >> > +       RCAR_GP_PIN(3, 5),
>> >> > +
>> >> > +       RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 0), RCAR_GP_PIN(3, 1),
>> >> > +       RCAR_GP_PIN(5, 17), RCAR_GP_PIN(3, 13), RCAR_GP_PIN(5, 23),
>> >> > +       RCAR_GP_PIN(3, 12),
>> >> > +};
>> >> > +static const unsigned int avb_mii_mux[] = {
>> >> > +       AVB_TXD0_MARK, AVB_TXD1_MARK, AVB_TXD2_MARK,
>> >> > +       AVB_TXD3_MARK,
>> >> > +
>> >> > +       AVB_RXD0_MARK, AVB_RXD1_MARK, AVB_RXD2_MARK,
>> >> > +       AVB_RXD3_MARK,
>> >> > +
>> >> > +       AVB_RX_ER_MARK, AVB_RX_CLK_MARK, AVB_RX_DV_MARK,
>> >> > +       AVB_CRS_MARK, AVB_TX_EN_MARK, AVB_TX_ER_MARK,
>> >> > +       AVB_TX_CLK_MARK,
>> >>
>> >> You forgot AVB_COL, which is GP5_18?
>> >
>> > GP5_18 is shred between the signals AVB_COL and VI0_CLK. As per the
>> > RZ/G1C board schematic /hardware user guide Ethernet Phy collision
>> > pin(AVB_COL) pin  is not populated on this board by default. It is populated
>> only for Video Input Channel0 pixel clock.
>> >
>> > Since it is initial submission, I thought of adding only board
>> > specific pins first and later add this collision pin alone as a
>> > separate pin entry  in the avb group. That way we can support existing
>> board as well as any future RZ/G1C board which populates this pin. Are you
>> ok for this approach?
>>
>> Oops. That means our grouping is suboptimal. Perhaps we should revisit (for
>> all SoCs, while keeping backwards compatibility)?
>>
>> After reading some wikipedia, I came up with:
>>
>>     mii_tx
>>     mii_tx_er (optional)
>>     mii_rx
>>     mii_col_crs (optional, half duplex)
>>
>> However, given your board uses AVB_CRS without AVB_COL, that would still
>> not be sufficient, so the last group should be split to cover your use case?
>
> Ok I agree to your point. What about splitting the last group " mii_col_crs"  to "mii_col" and  "mii_crs" as separate groups .
> Since this pins are only meaning full in half duplex mode(https://en.wikipedia.org/wiki/Media-independent_interface)

Sounds fine to me.
As COL and CRS are the same for MII and GMII, they can just be named
avb_col_pins resp. avb_crs_pins.

BTW, Sergei, what's your opinion?

>> BTW, how does it work with AVB_COL not wired to anything by default, and
>> thus floating? Do you enable pull-up/down for that pin in the PFC, or is the
>> pin just ignored in full-duplex mode?
>
> Since it is unwired, the pin is in GPIO mode, high impedance state(ZU) with initial state is pull-up "on" in the PFC.

OK. But as soon as the VIN is used, it will no longer be configured as GPIO...

>> >> > +};
>> >> > +static const unsigned int avb_gmii_pins[] = {
>> >> > +       RCAR_GP_PIN(3, 14), RCAR_GP_PIN(3, 15), RCAR_GP_PIN(3, 16),
>> >> > +       RCAR_GP_PIN(3, 27), RCAR_GP_PIN(3, 28), RCAR_GP_PIN(3, 29),
>> >> > +       RCAR_GP_PIN(4, 0), RCAR_GP_PIN(5, 22),
>> >> > +
>> >> > +       RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3), RCAR_GP_PIN(3, 4),
>> >> > +       RCAR_GP_PIN(3, 5), RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
>> >> > +       RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
>> >> > +
>> >> > +       RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 0), RCAR_GP_PIN(3, 1),
>> >> > +       RCAR_GP_PIN(5, 17), RCAR_GP_PIN(4, 1), RCAR_GP_PIN(3, 11),
>> >> > +       RCAR_GP_PIN(3, 13), RCAR_GP_PIN(5, 23), RCAR_GP_PIN(3, 12),
>> >> > +}; static const unsigned int avb_gmii_mux[] = {
>> >> > +       AVB_TXD0_MARK, AVB_TXD1_MARK, AVB_TXD2_MARK,
>> >> > +       AVB_TXD3_MARK, AVB_TXD4_MARK, AVB_TXD5_MARK,
>> >> > +       AVB_TXD6_MARK, AVB_TXD7_MARK,
>> >> > +
>> >> > +       AVB_RXD0_MARK, AVB_RXD1_MARK, AVB_RXD2_MARK,
>> >> > +       AVB_RXD3_MARK, AVB_RXD4_MARK, AVB_RXD5_MARK,
>> >> > +       AVB_RXD6_MARK, AVB_RXD7_MARK,
>> >> > +
>> >> > +       AVB_RX_ER_MARK, AVB_RX_CLK_MARK, AVB_RX_DV_MARK,
>> >> > +       AVB_CRS_MARK, AVB_GTX_CLK_MARK, AVB_GTXREFCLK_MARK,
>> >> > +       AVB_TX_EN_MARK, AVB_TX_ER_MARK, AVB_TX_CLK_MARK,
>> >>
>> >> You forgot AVB_COL, which is GP5_18?
>> >
>> > The same comment as above.
>>
>> Likewise:
>>
>>     gmii_tx
>>     gmii_rx
>>     gmii_col_crs (optional, half duplex; should this be split?)
>
> Ok I agree to your point. What about splitting the group " gmii_col_crs"  to "gmii_col" and  "gmii_crs" as separate groups .
> Since this pins are only for half duplex mode(https://en.wikipedia.org/wiki/Media-independent_interface)

OK, same pin group as for mii.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
