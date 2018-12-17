Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68E0C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 12:42:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83D0D20672
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 12:42:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="J38gKK9k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbeLQMmy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 07:42:54 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39892 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbeLQMmy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 07:42:54 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8873F25B781;
        Mon, 17 Dec 2018 23:42:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545050571; bh=2cqEyOu6LCBOF/GpR1FOptJgTunE+Nk7PBkdf3sPwIU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J38gKK9k12kosOV7ibHXHhFsg4idxFo10gZLfSrih+4H38cic4AnwgC0lTd9v8jN/
         wisMHw8EUp4drG8Lnn0dND5x82iBO1MaYYJeJ8wD3VAiUmMj6ajFr9XxLvzPnJPXyQ
         DOtrLni3bfutdSQvRSI/M9lJGlKpS1yDzty73XcM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0844E94048A; Mon, 17 Dec 2018 13:42:49 +0100 (CET)
Date:   Mon, 17 Dec 2018 13:42:49 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 11/17] arm64: dts: renesas: r8a774c0: Add USB-DMAC and
 HSUSB device nodes
Message-ID: <20181217124249.tdyeafem7exry4xr@verge.net.au>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-12-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181217105437.u2lgri7iuomjn7wq@verge.net.au>
 <TY1PR01MB1770B4A08F1C04979B88C0FBC0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770B4A08F1C04979B88C0FBC0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 12:17:12PM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> Thank you for your feedback!
> 
> > From: Simon Horman <horms@verge.net.au>
> > Sent: 17 December 2018 10:55
> > To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Subject: Re: [PATCH 11/17] arm64: dts: renesas: r8a774c0: Add USB-DMAC and HSUSB device nodes
> >
> > On Fri, Dec 14, 2018 at 09:37:34AM +0000, Fabrizio Castro wrote:
> > > Add usb dmac and hsusb device nodes on RZ/G2E SoC dtsi.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > ---
> > >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 45 +++++++++++++++++++++++++++++++
> > >  1 file changed, 45 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > index 0ab3aa6..79cdaac 100644
> > > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > @@ -514,6 +514,51 @@
> > >  status = "disabled";
> > >  };
> > >
> > > +hsusb: usb@e6590000 {
> > > +compatible = "renesas,usbhs-r8a774c0",
> > > +     "renesas,rcar-gen3-usbhs";
> > > +reg = <0 0xe6590000 0 0x200>;
> >
> > The above looks good but while reviewing this patch I noticed
> > that the size of the hsusb register range on in the DT for r8a774a1
> > is 0x100, Is that correct?
> 
> That is a good catch! No, I don't think it's correct, I'll send a patch to fix that.

Great, thanks!
