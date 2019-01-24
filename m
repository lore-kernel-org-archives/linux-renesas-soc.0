Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7291C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 11:39:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82873217D4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 11:39:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="VU+j/udk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfAXLjF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 06:39:05 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:36968 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfAXLjE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 06:39:04 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6309B25B769;
        Thu, 24 Jan 2019 22:39:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548329942; bh=+n0KnK2xyc162bccU002/sjZmRFzLAaIr3MEwVCOxYo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VU+j/udkw1C4zImrb2kOo0ssJ+iMkbxqHxXjAQe8Tr1rrgQKy8Ibj11T9MAC0aoNx
         eBsdXbCB/U5ZDJ4hdo1iVpWmiUm2C4W4dnMDS96NVZbNlBG8KTo+5Tkh1qWBUWexgH
         3n3qE0lp0DVjRvxduAFJgvCuodyAiFihOtD47w+w=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id BD6659403C0; Thu, 24 Jan 2019 12:39:00 +0100 (CET)
Date:   Thu, 24 Jan 2019 12:39:00 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Haavard Skinnemoen <hskinnemoen@gmail.com>
Subject: Re: [PATCH] i2c: gpio: merge two very similar comments
Message-ID: <20190124113828.w4ift2osoubva4le@verge.net.au>
References: <20190119113642.5348-1-wsa+renesas@sang-engineering.com>
 <20190123101854.ps42vsgehusaimi5@verge.net.au>
 <20190123184258.GC1708@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190123184258.GC1708@kunai>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 23, 2019 at 07:42:58PM +0100, Wolfram Sang wrote:
> On Wed, Jan 23, 2019 at 11:18:54AM +0100, Simon Horman wrote:
> > On Sat, Jan 19, 2019 at 12:36:42PM +0100, Wolfram Sang wrote:
> > > I think it is clear enough if we have the explanation once and make it
> > > clear it is applicable for both SCL and SDA.
> > > 
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > ---
> > >  drivers/i2c/busses/i2c-gpio.c | 15 ++++-----------
> > >  1 file changed, 4 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
> > > index c008d209f0b8..b9d43bc2853f 100644
> > > --- a/drivers/i2c/busses/i2c-gpio.c
> > > +++ b/drivers/i2c/busses/i2c-gpio.c
> > > @@ -286,10 +286,10 @@ static int i2c_gpio_probe(struct platform_device *pdev)
> > >  
> > >  	/*
> > >  	 * First get the GPIO pins; if it fails, we'll defer the probe.
> > > -	 * If the SDA line is marked from platform data or device tree as
> > > -	 * "open drain" it means something outside of our control is making
> > > -	 * this line being handled as open drain, and we should just handle
> > > -	 * it as any other output. Else we enforce open drain as this is
> > > +	 * If the SCL/SDA lines are marked from platform data or device tree
> > > +	 * as "open drain" it means something outside of our control is making
> > > +	 * these lines being handled as open drain, and we should just handle
> > > +	 * them as any other output. Else we enforce open drain as this is
> > >  	 * required for an I2C bus.
> > 
> > <2c>
> > 	If the SCL/SDA lines are marked "open drain" by platform data or
> > 	device tree then this means that something outside of our control is
> > 	marking these lines to be handled as open drain, and we should just
> > 	handle them as we handle any other output. Else we enforce open
> > 	drain as this is required for an I2C bus.
> > </2c>
> 
> Cool, thanks Simon. Should I add your SoB when sending V2?

Sure,

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>



