Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49629 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbeHQNVq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 09:21:46 -0400
Date: Fri, 17 Aug 2018 12:18:50 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] arm64: renesas_defconfig: enable R8A774A1 SoC
Message-ID: <20180817101850.mgrnjkz467har5sd@verge.net.au>
References: <1534241090-702-1-git-send-email-biju.das@bp.renesas.com>
 <20180817094346.toajacq64czd7vjx@verge.net.au>
 <OSBPR01MB2103C1EAFE1750D8B08497B8B83D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103C1EAFE1750D8B08497B8B83D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 17, 2018 at 09:46:34AM +0000, Biju Das wrote:
> Hi Simon,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH] arm64: renesas_defconfig: enable R8A774A1 SoC
> >
> > On Tue, Aug 14, 2018 at 11:04:50AM +0100, Biju Das wrote:
> > > Enable the Renesas RZ/G2M (R8A774A1) SoC in the ARM64
> > renesas_defconfig.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Thanks,
> >
> > I have applied this to the topic/renesas-defconfig branch which is included in
> > the devel branch and tags of the Renesas tree as a convenience to
> > developers.  The branch is not, however, included in the next branch or tags
> > nor is it targeted at upstream.
> >
> > Please consider providing, as a follow-up, a similar patch for the upstream
> > defconfig, arch/arm64/configs/defconfig
> 
> I have already sent a patch for this.
> https://patchwork.kernel.org/patch/10563917/

Thanks, I see that now.
