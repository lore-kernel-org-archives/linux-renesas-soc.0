Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:46188 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751079AbeD1San (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 28 Apr 2018 14:30:43 -0400
Received: by mail-lf0-f43.google.com with SMTP id v85-v6so7090645lfa.13
        for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Apr 2018 11:30:43 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] pinctrl: sh-pfc: Add r8a77470 PFC support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Biju Das <biju.das@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
References: <1522855377-48527-1-git-send-email-biju.das@bp.renesas.com>
 <1522855377-48527-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdX9YC+QT_dbKSqtQUHJkoA=3=gmgPYNFdXBOrsTT9rCRw@mail.gmail.com>
 <OSBPR01MB2103463F72505673548AC737B8B70@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdX6YTD9X0r9Dfz5uLAx2vSvxPp7Hidi_FbtZjrdSuE8eA@mail.gmail.com>
 <01abcbad-8ac6-4968-1a29-b6e8486b3383@cogentembedded.com>
Message-ID: <8f9816f1-f922-5db7-2c3a-8d7c102ee335@cogentembedded.com>
Date: Sat, 28 Apr 2018 21:30:39 +0300
MIME-Version: 1.0
In-Reply-To: <01abcbad-8ac6-4968-1a29-b6e8486b3383@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/28/2018 08:40 PM, Sergei Shtylyov wrote:

>>>> Subject: Re: [PATCH v2 1/2] pinctrl: sh-pfc: Add r8a77470 PFC support
>>>> On Wed, Apr 4, 2018 at 5:22 PM, Biju Das <biju.das@bp.renesas.com> wrote:
>>>>> Add PFC support for the R8A77470 SoC including pin groups for some
>>>>> on-chip devices such as SCIF, AVB and MMC.
>>>>>
>>>>> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>>>>> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>>
>>>>> --- /dev/null
>>>>> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
>>
>>>>> +/* - AVB
>>>>> +-------------------------------------------------------------------- */ static const
>>>> unsigned int avb_link_pins[] = {
>>>>> +       RCAR_GP_PIN(5, 14),
>>>>> +};
>>>>> +static const unsigned int avb_link_mux[] = {
>>>>> +       AVB_LINK_MARK,
>>>>> +};
>>>>> +static const unsigned int avb_magic_pins[] = {
>>>>> +       RCAR_GP_PIN(5, 15),
>>>>> +};
>>>>> +static const unsigned int avb_magic_mux[] = {
>>>>> +       AVB_MAGIC_MARK,
>>>>> +};
>>>>> +static const unsigned int avb_phy_int_pins[] = {
>>>>> +       RCAR_GP_PIN(5, 16),
>>>>> +};
>>>>> +static const unsigned int avb_phy_int_mux[] = {
>>>>> +       AVB_PHY_INT_MARK,
>>>>> +};
>>>>> +static const unsigned int avb_mdio_pins[] = {
>>>>> +       RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 13), }; static const
>>>>> +unsigned int avb_mdio_mux[] = {
>>>>> +       AVB_MDC_MARK, AVB_MDIO_MARK,
>>>>> +};
>>>>> +static const unsigned int avb_mii_pins[] = {
>>>>> +       RCAR_GP_PIN(3, 14), RCAR_GP_PIN(3, 15), RCAR_GP_PIN(3, 16),
>>>>> +       RCAR_GP_PIN(3, 27),
>>>>> +
>>>>> +       RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3), RCAR_GP_PIN(3, 4),
>>>>> +       RCAR_GP_PIN(3, 5),
>>>>> +
>>>>> +       RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 0), RCAR_GP_PIN(3, 1),
>>>>> +       RCAR_GP_PIN(5, 17), RCAR_GP_PIN(3, 13), RCAR_GP_PIN(5, 23),
>>>>> +       RCAR_GP_PIN(3, 12),
>>>>> +};
>>>>> +static const unsigned int avb_mii_mux[] = {
>>>>> +       AVB_TXD0_MARK, AVB_TXD1_MARK, AVB_TXD2_MARK,
>>>>> +       AVB_TXD3_MARK,
>>>>> +
>>>>> +       AVB_RXD0_MARK, AVB_RXD1_MARK, AVB_RXD2_MARK,
>>>>> +       AVB_RXD3_MARK,
>>>>> +
>>>>> +       AVB_RX_ER_MARK, AVB_RX_CLK_MARK, AVB_RX_DV_MARK,
>>>>> +       AVB_CRS_MARK, AVB_TX_EN_MARK, AVB_TX_ER_MARK,
>>>>> +       AVB_TX_CLK_MARK,
>>>>
>>>> You forgot AVB_COL, which is GP5_18?
>>>
>>> GP5_18 is shred between the signals AVB_COL and VI0_CLK. As per the RZ/G1C board schematic /hardware user guide
>>> Ethernet Phy collision pin(AVB_COL) pin  is not populated on this board by default. It is populated only for
>>> Video Input Channel0 pixel clock.
>>>
>>> Since it is initial submission, I thought of adding only board specific pins first and later
>>> add this collision pin alone as a separate pin entry  in the avb group. That way we can support existing board
>>> as well as any future RZ/G1C board which populates this pin. Are you ok for this approach?
> 
>> Oops. That means our grouping is suboptimal. Perhaps we should revisit
>> (for all SoCs, while keeping backwards compatibility)?
> 
> 
>> After reading some wikipedia, I came up with:
>>
>>     mii_tx
>>     mii_tx_er (optional)
>>     mii_rx
> 
>    I don't see why we should have the separate TX/RX subgroups just because they're
> described separately in the Wikipedia. Or did you have some special reason to do it? 
> 
>>     mii_col_crs (optional, half duplex)
>>
>> However, given your board uses AVB_CRS without AVB_COL, that would still
>> not be sufficient, so the last group should be split to cover your use case?
> 
>> BTW, how does it work with AVB_COL not wired to anything by default, and thus
>> floating? Do you enable pull-up/down for that pin in the PFC, or is the pin
>> just ignored in full-duplex mode?
> 
>    Well, I'm seeing the strong possibility the half-duplex mode just doesn't work as
> the collision indication isn't available.

   And indeed, the manuals tell me that RZ/G (and R-Car gen2) EtherAVB only supports
the full-duplex mode.

> [...]
> 
>> Gr{oetje,eeting}s,
>>
>>                         Geert

MBR, Sergei
