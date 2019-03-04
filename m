Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C50C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 09:38:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 097A120823
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 09:38:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="mIYfLjlA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfCDJif (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 04:38:35 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38503 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfCDJif (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 04:38:35 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7FEBC25B74E;
        Mon,  4 Mar 2019 20:38:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551692313; bh=9abut3tPvLi0lPfjqIukI6lMcXFsfCG25FfmhBlGmAM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mIYfLjlAIMiVr6qVt4uyTCnAtv/ely8HLKgV55JV2YOs/1V/nbniRYvTZ+06dZ+8B
         2ETiisP2LIV6dSY/GUwaKsArKBpYIIfKkB6p4HKa2YH63NZuVzkn479EIxiUzeX7O6
         iMBHFJhJ47dPkgI5PSX23WwMkgshZZchbzBoxoaU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 8E85694030D; Mon,  4 Mar 2019 10:38:31 +0100 (CET)
Date:   Mon, 4 Mar 2019 10:38:31 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Fix cpu nodes style
Message-ID: <20190304093831.4rchfgz574nb6itm@verge.net.au>
References: <1550233589-13891-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYXPR01MB17752BA491B4A41F1257EB61C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYXPR01MB17752BA491B4A41F1257EB61C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 01, 2019 at 12:00:39PM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> Are you happy with this patch?
> 
> Thanks,
> Fab
> 
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Sent: 15 February 2019 12:26
> > Subject: [PATCH] arm64: dts: renesas: r8a774c0: Fix cpu nodes style
> > 
> > We usually leave a space between "=" and the value of device
> > tree properties, but unfortunately that was overlooked for the
> > "clocks" property of cpu@0 and cpu@1.
> > This patch fixes the spacing with the "clocks" property of
> > cpu@0 and cpu@1.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks, and sorry for the delay.

Applied for v5.2.

> > ---
> >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > index 61a0afb..0bbcaf1 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > @@ -76,7 +76,7 @@
> >  			power-domains = <&sysc R8A774C0_PD_CA53_CPU0>;
> >  			next-level-cache = <&L2_CA53>;
> >  			enable-method = "psci";
> > -			clocks =<&cpg CPG_CORE R8A774C0_CLK_Z2>;
> > +			clocks = <&cpg CPG_CORE R8A774C0_CLK_Z2>;
> >  			operating-points-v2 = <&cluster1_opp>;
> >  		};
> > 
> > @@ -87,7 +87,7 @@
> >  			power-domains = <&sysc R8A774C0_PD_CA53_CPU1>;
> >  			next-level-cache = <&L2_CA53>;
> >  			enable-method = "psci";
> > -			clocks =<&cpg CPG_CORE R8A774C0_CLK_Z2>;
> > +			clocks = <&cpg CPG_CORE R8A774C0_CLK_Z2>;
> >  			operating-points-v2 = <&cluster1_opp>;
> >  		};
> > 
> > --
> > 2.7.4
> 
