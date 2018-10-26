Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-os2jpn01on0128.outbound.protection.outlook.com ([104.47.92.128]:36182
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726149AbeJZSWf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Oct 2018 14:22:35 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
CC: Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH 7/7] ARM: shmobile: Enable USB [EO]HCI HCD PLATFORM
 support in shmobile_defconfig
Date: Fri, 26 Oct 2018 09:46:09 +0000
Message-ID: <TYXPR01MB17753A4004A82A87E7434E71C0F00@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
 <1540475819-47950-8-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540475819-47950-8-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> Subject: [PATCH 7/7] ARM: shmobile: Enable USB [EO]HCI HCD PLATFORM suppo=
rt in shmobile_defconfig
>
> The USB [EO]HCI controller on RZ/G1C SoC doesn't have PCI bridge like
> other R-Car Gen2 devices. So enable generic USB [EO]HCI HCD PLATFORM
> support in shmobile_defconfig.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  arch/arm/configs/shmobile_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmob=
ile_defconfig
> index f8faf37..b0db52c 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -163,7 +163,9 @@ CONFIG_USB=3Dy
>  CONFIG_USB_XHCI_HCD=3Dy
>  CONFIG_USB_XHCI_PLATFORM=3Dy
>  CONFIG_USB_EHCI_HCD=3Dy
> +CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
>  CONFIG_USB_OHCI_HCD=3Dy
> +CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
>  CONFIG_USB_R8A66597_HCD=3Dy
>  CONFIG_USB_RENESAS_USBHS=3Dy
>  CONFIG_USB_GADGET=3Dy
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
