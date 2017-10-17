Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:19394 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1759902AbdJQJJ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2017 05:09:56 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Felipe Balbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC: Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: renesas_usbhs: Add compatible string for r8a7743/5
Date: Tue, 17 Oct 2017 09:09:50 +0000
Message-ID: <KL1PR06MB170284D41F8517AD9A96E8A0B84C0@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1507216358-917-1-git-send-email-biju.das@bp.renesas.com>
 <87wp3uji3x.fsf@linux.intel.com>
In-Reply-To: <87wp3uji3x.fsf@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> -----Original Message-----
> From: devicetree-owner@vger.kernel.org [mailto:devicetree-
> owner@vger.kernel.org] On Behalf Of Felipe Balbi
> Sent: 17 October 2017 09:26
> To: Biju Das <biju.das@bp.renesas.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Rob Herring <robh+dt@kernel.org>; Mark
> Rutland <mark.rutland@arm.com>
> Cc: Simon Horman <horms@verge.net.au>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>; devicetree@vger.kernel.org; linux-renes=
as-
> soc@vger.kernel.org; linux-usb@vger.kernel.org; Biju Das
> <biju.das@bp.renesas.com>
> Subject: Re: [PATCH] usb: renesas_usbhs: Add compatible string for r8a774=
3/5
>
>
> Hi,
>
> Biju Das <biju.das@bp.renesas.com> writes:
> > This patch adds support for r8a7743/5 SoC.  The Renesas RZ/G1[ME]
> > (R8A7743/5) usbhs is identical to the R-Car Gen2 family.
> >
> > This doesn't change the driver, so it does nothing by itself.  But it
> > does mean that checkpatch won't complain about a future patch that
> > adds "renesas,usbhs-r8a7743" or "renesas,usbhs-r8a7745" to a DT, which
> > helps ensure that shipped DTs use documented compatibility strings.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> > This patch is tested against Linux next tag next-20170929

> care to rebase on my testing/next? It fails to apply.

Sorry for the trouble.

I have already send a V2 for fixing this.

[v2] usb: renesas_usbhs: Add compatible string for r8a7743/5
https://patchwork.kernel.org/patch/9990063/

I have rebased this patch on my testing/next and confirms it apply cleanly.

Regds,
Biju








Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
