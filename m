Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D46FC282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 09:42:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2BAC21019
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 09:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="UOJPHuQk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbfAWJmB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 04:42:01 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:50585 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727166AbfAWJmB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 04:42:01 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 18CED25BE34;
        Wed, 23 Jan 2019 20:41:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548236519; bh=h1lQJG8jWm8+iDNmKc1tFfTXhwcrbcdrsC3tLJru7S0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UOJPHuQk21ja0D0Y0+jesy8oXj9kCXwsxkgnP+TkVVG40rr+lOOO3PX+1HFdkmPCN
         fImHmXX/raVmENsdxXM4YM1ydI+2zDjNfstAaJDBgSCioh6GHqFecX/AbiJMH4A+wd
         n++bOwJJHfxh57ThIvdOQdFzOJNIWDG76D2EF+Pk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0ABD3940471; Wed, 23 Jan 2019 10:41:56 +0100 (CET)
Date:   Wed, 23 Jan 2019 10:41:56 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v4 0/2] Add Initial Device Tree for RZ/A2
Message-ID: <20190123094155.ynxgmvy2xg6l2ywq@verge.net.au>
References: <20181218170555.121673-1-chris.brandt@renesas.com>
 <TY1PR01MB1562E0657C155C47620BF6F68A9F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1562E0657C155C47620BF6F68A9F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 21, 2019 at 09:17:20PM +0000, Chris Brandt wrote:
> Hi Simon,
> 
> On Tuesday, December 18, 2018, Chris Brandt wrote:
> > Add a Device Tree for RZ/A2 and the existing eval board.
> > 
> > Once these get approved, I'll start piling on the other drivers in
> > another patch series
> > 
> > NOTE:
> > Since Rob is currently converting shmobile.txt to renesas.yaml,
> > I'll wait till renesas.yaml hits -next, then add this RZ/A2M EVB
> > board (it's too confusing to me to figure out how to make a patch
> > series using multiple different trees)
> > 
> > Chris Brandt (2):
> >   ARM: dts: r7s9210: Initial SoC device tree
> >   ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
> > 
> >  arch/arm/boot/dts/Makefile             |   1 +
> >  arch/arm/boot/dts/r7s9210-rza2mevb.dts |  82 +++++++++++++
> >  arch/arm/boot/dts/r7s9210.dtsi         | 218
> > +++++++++++++++++++++++++++++++++
> >  3 files changed, 301 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/r7s9210-rza2mevb.dts
> >  create mode 100644 arch/arm/boot/dts/r7s9210.dtsi
> 
> 
> What ever happened to these patches?
> 
> I didn't see any negative feedback after V4, but I also never saw 
> anything get queued up.

Sorry about that, it slipped through the cracks somehow.

I have now applied this for v5.1.
