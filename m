Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:25947 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932185AbdJWNfe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2017 09:35:34 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>
CC: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH  0/4] Add USB function support
Date: Mon, 23 Oct 2017 13:35:29 +0000
Message-ID: <TY1PR06MB08958DB6829660A94EB93E2FC0460@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1507909843-52034-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1507909843-52034-1-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

one of the dependencies of this series belongs to another series currently =
being
reworked, therefore I'll resend the all thing again or as part of a differe=
nt/larger
series.

Thanks,
Fab

> Subject: [PATCH 0/4] Add USB function support
>
> Hello,
>
> This series aims to add USB function support for iWave RZ/G1E (R8A7745) b=
oard.
> This series has been tested against renesas-dev tag 20171013-v4.14-rc4.
>
> The patch "ARM: dts: iwg22d-sodimm: Enable HS-USB" depend upon
> the below patch
>
> * [4/4] ARM: dts: iwg22d-sodimm: sort dt nodes
> https://patchwork.kernel.org/patch/10004691/
>
> This patch has documentation dependency on below patches
>
> * [v2] usb: renesas_usbhs: Add compatible string for r8a7743/5
> https://patchwork.kernel.org/patch/9990063/
> * [v2] dmaengine: usb-dmac: Add compatible string for r8a7743/5
> https://patchwork.kernel.org/patch/9990113/
>
> Regards,
>
> Biju Das (4):
>   ARM: dts: r8a7745: Add HS-USB device node
>   ARM: dts: r8a7745: Add USB-DMAC device nodes
>   ARM: dts: r8a7745: Enable DMA for HSUSB
>   ARM: dts: iwg22d-sodimm: Enable HS-USB
>
>  arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 11 +++++++
>  arch/arm/boot/dts/r8a7745.dtsi              | 45 +++++++++++++++++++++++=
++++++
>  2 files changed, 56 insertions(+)
>
> --
> 1.9.1




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
