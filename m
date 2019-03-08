Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386CCC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 12:05:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0ADDC20684
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 12:05:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="KQ4Yrsv6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfCHMFP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 07:05:15 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:47453 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbfCHMFP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 07:05:15 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 12EDA25BEE4;
        Fri,  8 Mar 2019 23:05:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552046713; bh=6d2e18nSS+SRSEKsYG79bGZk4tzXQcwcVxpu9kDWPoA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KQ4Yrsv6t75H0BIxhDDlTkczU6McT44NuosVKXl45wW39EtPv0uW9hdvX/3Da1SjV
         qvqHRVnJKKuXtzRpjJat9ca4KjVvkTT87YO2BAwOaPR349prlYmdc2iXts82dC21oU
         NHRKmdfXOTMhl6/9zEyiWK2G373We8j9aSEcA91Q=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 77603940270; Fri,  8 Mar 2019 13:05:11 +0100 (CET)
Date:   Fri, 8 Mar 2019 13:05:11 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Chris Paterson <Chris.Paterson2@renesas.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add RWDT support
Message-ID: <20190308120511.vw3tseqvkyotkpeu@verge.net.au>
References: <1551871785-4093-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYAPR01MB22857AB97F530249900887C1B7730@TYAPR01MB2285.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYAPR01MB22857AB97F530249900887C1B7730@TYAPR01MB2285.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 06, 2019 at 11:52:03AM +0000, Chris Paterson wrote:
> 
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Sent: 06 March 2019 11:30
> > 
> > Enable RWDT and use 60 seconds as default timeout.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

Thanks, applied for v5.2.

> Kind regards, Chris
> 
> > ---
> >  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> > b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> > index 96ee0d2c..49ad3a5 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> > @@ -84,6 +84,11 @@
> >  	};
> >  };
> > 
> > +&rwdt {
> > +	timeout-sec = <60>;
> > +	status = "okay";
> > +};
> > +
> >  &scif2 {
> >  	pinctrl-0 = <&scif2_pins>;
> >  	pinctrl-names = "default";
> > --
> > 2.7.4
> 
