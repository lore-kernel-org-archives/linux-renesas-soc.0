Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74E4C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 10:47:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 974152087C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 10:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="QhkuQrj+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbfCMKrB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 06:47:01 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34673 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfCMKrA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 06:47:00 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id ED39825BEEE;
        Wed, 13 Mar 2019 21:46:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552474019; bh=armDGLss9tJ6zvqNRvbA4WfQExh6szn6LZnC8trrlQw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QhkuQrj+B8SFNso9STdsDi7wUYi8wtVRt9vuGacrwH/aZ+Ipk7PSyoGpE2s4JEp8F
         EhS1a2lFWvGTMO+xN3RR0uoQns+F3nOH4jg3Y5nnBCnn5BmEHPw2UZTo9TSqU9Chea
         NxkYISINh1EISWHqhQLaZO8D8kFKL93QSVfH84Tg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3A9C5940C8F; Wed, 13 Mar 2019 11:46:57 +0100 (CET)
Date:   Wed, 13 Mar 2019 11:46:57 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Remove invalid compatible
 value for CSI40
Message-ID: <20190313104656.5gizt65ieekrnwim@verge.net.au>
References: <20190306123926.10064-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXV_wNaXq388_r-20yB-+38y4ZDt0w=oOPf1Bz9Xe1arA@mail.gmail.com>
 <20190308120232.kueqdbkwoi2b6l6g@verge.net.au>
 <20190308144926.GR9239@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190308144926.GR9239@bigcity.dyn.berto.se>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 08, 2019 at 03:49:26PM +0100, Niklas Söderlund wrote:
> Hi Simon,
> 
> On 2019-03-08 13:02:33 +0100, Simon Horman wrote:
> > On Wed, Mar 06, 2019 at 06:45:56PM +0100, Geert Uytterhoeven wrote:
> > > Hi Niklas,
> > > 
> > > On Wed, Mar 6, 2019 at 4:14 PM Niklas Söderlund
> > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > The compatible value renesas,rcar-gen3-csi2 was used while prototyping
> > > > the R-Car CSI-2 driver but was removed before the driver was merged.
> > > > Remove the only occurrence of the compatible value which manage to make
> > > 
> > > Nah, there's a second one, in r8a774c0.dtsi ;-)
> > > 
> > > > it upstream.
> > > >
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > 
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > Thanks,
> > 
> > should this patch have:
> > 
> > Fixes: ec70407ae7d7 ("arm64: dts: renesas: r8a77990: Add VIN and CSI-2 device nodes")
> 
> Yes it should. Want me to send a v2 or can you add then when picking up 
> the patch?

No need, I've manually added the tag when applying this patch for v5.2.

It looks like the patch this one fixes was included in v4.20, however,
I don't think we need to do anything special to accelerate getting
this fix into v5.1 or -stable.
