Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:6011 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726422AbeJOWkx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Oct 2018 18:40:53 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: USB2.0 blocks on RZ/G1C
Date: Mon, 15 Oct 2018 14:55:12 +0000
Message-ID: <OSBPR01MB2103F6DE88169CDDB9BDA373B8FD0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Shimoda-San and  all,

RZ/G1C  USB2.0 host/function controller  has the below features compared to=
 R-Car Gen2/Gen3 USB2.0 block

1) It has a shared pll reset register for hsusb0/hsusb1 and this register r=
eside in hsusb0 block.
2) This implies, in order to enable USB1 host/peripheral, we need to enable=
 hsusb0 block as well.
3) USB2.0 Host controller block is similar to R-Car Gen3 USB2.0 host contro=
ller but with
   few register sets. There is no PLL reset on the host side(USBCTR).

To address 1 and 3, I have modified the phy-rcar-gen2 with rz/g1c specific =
phy_ops .
Also added optional usb2.0 host reg property for initializing interrupt ena=
ble, OVC detection timer and Suspend/resume timer register .

I will send the patch based on the below discussion.

To address 2, I am seeing 2 solutions

solution 1) On the SoC dtsi->define USB1 clocks(ehci1/ohci1/hsusb1) and
                    On the board dts-> enable hsusb0 + usb1 host/peripheral=
.

solution 2) On the SoC dtsi->define  USB1 clocks(ehci1/ohci1/hsusb1) follow=
ed by hsusb0 clock and
                     On the board dts-> enable only usb1 host/peripheral.
                    This will allow us to do pll reset without enabling hsu=
sb0 on the board dts.

Do you have any preferences one way or the other? Or a third option?

Note:-
The board is populated with USB2.0 host on USB port 1 and USB2.0 function o=
n USB Port0.

Regards,
Biju



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
