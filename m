Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:51592 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726083AbeJPRrM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 13:47:12 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: USB2.0 blocks on RZ/G1C
Date: Tue, 16 Oct 2018 09:57:26 +0000
Message-ID: <OSBPR01MB2103F5ADFBEE09EA449D6523B8FE0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <OSBPR01MB2103F6DE88169CDDB9BDA373B8FD0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <OSBPR01MB22939063413AFE919B7941F9D8FE0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB22939063413AFE919B7941F9D8FE0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-San,

Thanks for the feedback.

> <fabrizio.castro@bp.renesas.com>
> Subject: RE: USB2.0 blocks on RZ/G1C
> >
> > Hello Shimoda-San and  all,
> >
> > RZ/G1C  USB2.0 host/function controller  has the below features
> > compared to R-Car Gen2/Gen3 USB2.0 block
> >
> > 1) It has a shared pll reset register for hsusb0/hsusb1 and this regist=
er
> reside in hsusb0 block.
> > 2) This implies, in order to enable USB1 host/peripheral, we need to en=
able
> hsusb0 block as well.
> > 3) USB2.0 Host controller block is similar to R-Car Gen3 USB2.0 host
> controller but with
> >    few register sets. There is no PLL reset on the host side(USBCTR).
>
> I also checked the RZ/G1C datasheet and I understood them.
> - Each USB host needs to deassert the pll reset only if RZ/G1C.
>  (In other words, other RZ/G1 and R-Car Gen2/3 don't need to deassert the
> pll reset of hsusb block for host side.)
>
> > To address 1 and 3, I have modified the phy-rcar-gen2 with rz/g1c speci=
fic
> phy_ops .
> > Also added optional usb2.0 host reg property for initializing
> > interrupt enable, OVC detection timer and Suspend/resume timer register
> .
> If so, you also have to add optional usb2.0 host clock and enable the clo=
ck on
> the phy-rcar-gen2 driver.

OK. Will add this in phy-rcar-gen2 driver.

> > I will send the patch based on the below discussion.
> >
> > To address 2, I am seeing 2 solutions
> >
> > solution 1) On the SoC dtsi->define USB1 clocks(ehci1/ohci1/hsusb1) and
> >                     On the board dts-> enable hsusb0 + usb1 host/periph=
eral.
> >
> > solution 2) On the SoC dtsi->define  USB1 clocks(ehci1/ohci1/hsusb1)
> followed by hsusb0 clock and
> >                      On the board dts-> enable only usb1 host/periphera=
l.
> >                     This will allow us to do pll reset without enabling=
 hsusb0 on the
> board dts.
>
> I'm afraid but I don't understand these 2 solutions. Where are the USB1
> clocks defined?

  - ehci0/ohci0/hsusb0 nodes have phys property with usbphy0.
  - ehci1/ohci1/hsusb1 nodes have phys property with usbphy1
To achieve2, I have added usbphy0 clock +  usb1 (ehci1/ohc1/hsusb1) clocks =
to  ehci1/ohc1/hsusb1 node.

> > Do you have any preferences one way or the other? Or a third option?
>
> I'm thinking which nodes we will have on RZ/G1C dtsi:
>  - We will have ehci[01]/ohci[01]/hsusb[01]/usbphy[01] nodes.
>  - ehci0/ohci0/hsusb0 nodes have phys property with usbphy0.
>  - ehci1/ohci1/hsusb1 nodes have phys property with both usbphy0 and
> usbphy1 to achieve the 2) you mentioned above.
>  - usbphy[01] has reg/clocks as both own hsusb and usb host blocks.

Looks this solution is better. I will submit the patches based on this.

> About the phy driver:
>  - Add the 1) and 3) you mentioned above.

Regards,
Biju



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
