Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:46783 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725845AbeHQMtX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 08:49:23 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] arm64: renesas_defconfig: enable R8A774A1 SoC
Date: Fri, 17 Aug 2018 09:46:34 +0000
Message-ID: <OSBPR01MB2103C1EAFE1750D8B08497B8B83D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1534241090-702-1-git-send-email-biju.das@bp.renesas.com>
 <20180817094346.toajacq64czd7vjx@verge.net.au>
In-Reply-To: <20180817094346.toajacq64czd7vjx@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

Thanks for the feedback.

> Subject: Re: [PATCH] arm64: renesas_defconfig: enable R8A774A1 SoC
>
> On Tue, Aug 14, 2018 at 11:04:50AM +0100, Biju Das wrote:
> > Enable the Renesas RZ/G2M (R8A774A1) SoC in the ARM64
> renesas_defconfig.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> Thanks,
>
> I have applied this to the topic/renesas-defconfig branch which is includ=
ed in
> the devel branch and tags of the Renesas tree as a convenience to
> developers.  The branch is not, however, included in the next branch or t=
ags
> nor is it targeted at upstream.
>
> Please consider providing, as a follow-up, a similar patch for the upstre=
am
> defconfig, arch/arm64/configs/defconfig

I have already sent a patch for this.
https://patchwork.kernel.org/patch/10563917/

regards,
Biju





Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
