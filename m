Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2006C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 10:29:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EF5821841
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 10:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="kCCbei0d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbeLRK3D (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 05:29:03 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53775 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbeLRK3C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 05:29:02 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BAB8625B75B;
        Tue, 18 Dec 2018 21:29:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545128941; bh=QSD3hmMyq/xc4ah+eUbP0UccoMHdRtisLnxOcmXdsFQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kCCbei0doW08KnYUcipgMkT5/jfbjW+2B15i/Lfv09l0dJeuw7C5oS7gXzLDw9yYY
         G+KysM5634rG78o9PRgVLVwn1Y86esDCCT0odjAWswahANhEKy1yoAPzbXOmoaL3cS
         x1poY3YQbCgFRfrp7kkwbOvDFoei49cJDZF9nOgs=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0D95B940274; Tue, 18 Dec 2018 11:28:58 +0100 (CET)
Date:   Tue, 18 Dec 2018 11:28:58 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77990: ebisu: Fix EthernetAVB
 phy mode to rgmii
Message-ID: <20181218102858.z3ukhsb4baclu2j3@verge.net.au>
References: <20181214155844.25662-1-horms+renesas@verge.net.au>
 <1705781973.498941.1545125110032@webmail.strato.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1705781973.498941.1545125110032@webmail.strato.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 18, 2018 at 10:25:09AM +0100, Ulrich Hecht wrote:
> 
> > On December 14, 2018 at 4:58 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > 
> > 
> > From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > 
> > According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
> > August 24, 2018, the TX clock internal delay mode doesn't support
> > on R-Car E3. This patch fixes EthernetAVB phy mode to rgmii.
> > 
> > v2 [Simon Horman]
> > * Simply drop phy-mode property from r8a77990-ebisu.dts
> >   as the default property for this for r8a77990, as set in
> >   r8a77990.dtsi, is "rgmii".
> > 
> > Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> >  Based on renesas-devel-20181213-v4.20-rc6
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > index 62bdddcbbae7..b7082c5bab60 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > @@ -248,7 +248,6 @@
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
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks, applied for v4.22.
