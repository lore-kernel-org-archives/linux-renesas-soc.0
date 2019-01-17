Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F72C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 15:23:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7396205C9
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 15:23:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="XpVzRe3N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727623AbfAQPXQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 10:23:16 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:36156 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbfAQPXQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 10:23:16 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 86DD225B760;
        Fri, 18 Jan 2019 02:23:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547738594; bh=auQ2NRBR4hn04VH61X7DcbjJAq/IliX1dcZSqqQeUnM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XpVzRe3Nxh5az1fTwLu8GW7EuNs+D83FoMq2+CX2aS3KsroNSF6c+SyWCLBxnuZrg
         /HhkM73oiV1T+Uv16e2m4eAbwGM8jQAMyMOXgA7k0PjVTKkfCbhY8FSNhHDDjYjjJP
         K3zSxgKNPTXc2QVF4qibjn36ELGVNaz/OY4jpcEE=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 80746940459; Thu, 17 Jan 2019 16:23:12 +0100 (CET)
Date:   Thu, 17 Jan 2019 16:23:12 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH repost] arm64: dts: renesas: r8a77990: ebisu: Enable
 HS400 of SDHI3
Message-ID: <20190117152312.slckgb3w3n4ysgfj@verge.net.au>
References: <20190117143829.6ubwnj5cyh74mjq3@verge.net.au>
 <20190117150126.gku7sr3dcujfx2rq@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190117150126.gku7sr3dcujfx2rq@ninjato>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 17, 2019 at 04:01:26PM +0100, Wolfram Sang wrote:
> On Thu, Jan 17, 2019 at 03:38:29PM +0100, Simon Horman wrote:
> > Add SDHI3 UHS pin control and use it when enabling HS200 support
> > for SDHI3.
> 
> HS400
> 
> > # dd if=/dev/mmcblk0 of=/dev/null bs=1M count=512 iflag=direct
> > 512+0 records in
> > 512+0 records out
> > 536870912 bytes (537 MB) copied, 9.02486 s, 59.5 MB/s
> > # dd if=/dev/mmcblk0 of=/dev/null bs=1M count=512 iflag=direct
> > 512+0 records in
> > 512+0 records out
> > 536870912 bytes (537 MB) copied, 7.36003 s, 72.9 MB/s
> > # dd if=/dev/mmcblk0 of=/dev/null bs=1M count=512 iflag=direct
> > 512+0 records in
> > 512+0 records out
> > 536870912 bytes (537 MB) copied, 11.0156 s, 48.7 MB/s
> 
> Hmmmm, quite some fluctuation and far away from the performances of M3N.

Perhaps the M3N measurements were taken without iflag=direct ?

In that case for E3 I see:

# dd if=/dev/mmcblk0 of=/dev/null bs=1M count=512
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 3.79686 s, 141 MB/s
# dd if=/dev/mmcblk0 of=/dev/null bs=1M count=512
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 3.77128 s, 142 MB/s
# dd if=/dev/mmcblk0 of=/dev/null bs=1M count=512
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 3.79916 s, 141 MB/s

> Marek, do you have an idea why? Did you note any E3 differences when
> coding support for U-Boot?
> 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > index 89383aa35d65..f2846c9eb83f 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > @@ -535,6 +535,12 @@
> >  		power-source = <1800>;
> >  	};
> >  
> > +	sdhi3_pins_uhs: sd3_uhs {
> > +		groups = "sdhi3_data8", "sdhi3_ctrl", "sdhi3_ds";
> > +		function = "sdhi3";
> > +		power-source = <1800>;
> > +	};
> > +
> 
> This is exactly the same as sdhi3_pins, so no need.

Yes, silly me.
