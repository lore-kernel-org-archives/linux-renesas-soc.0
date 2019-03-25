Return-Path: <SRS0=tR/q=R4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A491DC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 10:53:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 688E62085A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 10:53:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="GyK9CBaY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730588AbfCYKxF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Mar 2019 06:53:05 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36362 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729727AbfCYKxF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Mar 2019 06:53:05 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E669725BEDF;
        Mon, 25 Mar 2019 21:53:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553511183; bh=tpqeQhV2D2BpXQRTEqzDCiweAShRUy2EA/Ns5cddyBs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GyK9CBaYrrHf4d+LzRSchtdblVTJW9dDoqrmoMDpMlBDD9DilwmGRd4bxD/Wl+QT6
         Z2Td+su050eynL3d2T29+LsA/VbCE29+Ta2swIYFhVTLuIn/BiqRhvdeHhmXDqIMTn
         vxECjXdo/KkWkYawjp1AJV1nGyfCevpbtBZgp0CQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 35DF0940563; Mon, 25 Mar 2019 11:53:01 +0100 (CET)
Date:   Mon, 25 Mar 2019 11:53:01 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77995: draak: Fix
 EthernetAVB phy mode to rgmii
Message-ID: <20190325105300.wttrjzvkzndq55xk@verge.net.au>
References: <20190213103255.1265-1-horms+renesas@verge.net.au>
 <1770426335.645190.1551787612347@webmail.strato.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1770426335.645190.1551787612347@webmail.strato.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 05, 2019 at 01:06:52PM +0100, Ulrich Hecht wrote:
> 
> > On February 13, 2019 at 11:32 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> > 
> > 
> > From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > 
> > According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
> > August 24, 2018, the TX clock internal Delay mode does'nt support
> > on R-Car D3. This patch fixes EthernetAVB phy mode to rgmii.
> > 
> > This is achieved by simply dropping the phy-mode property from
> > r8a77995-draak.dts as the default property for this for r8a77995,
> > as set in r8a77995.dtsi, is "rgmii".
> > 
> > Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > index db2bed1751b8..bfa260c9f78c 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > @@ -168,7 +168,6 @@
> >  	pinctrl-names = "default";
> >  	renesas,no-ether-link;
> >  	phy-handle = <&phy0>;
> > -	phy-mode = "rgmii-txid";
> >  	status = "okay";
> >  
> >  	phy0: ethernet-phy@0 {
> > -- 
> > 2.11.0
> >
> 
> Works for me.
> 
> Tested-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks, applied for v5.2.
