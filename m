Return-Path: <SRS0=AddW=QB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48A4C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 11:16:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAA63218A6
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 11:16:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="B2VD81jk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbfAYLQZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jan 2019 06:16:25 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:54676 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfAYLQZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jan 2019 06:16:25 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0F82225BDFF;
        Fri, 25 Jan 2019 22:16:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548414982; bh=5eiJUnf62BN1LHgWeCSiSh1qYfMtm7XCADoDD0lkrmA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B2VD81jknvWGJjWwLPg7Eq81sQ13Qa8F5gcfrlXAozI6Vl5g1l2uHpWPeC6P5HQBd
         gxXS4KmmdqgvdsDwTTRkV+6jIGafXO607NjWPk9YzgrwPHdMlKYj2NlKCXKcCMTjOd
         tfvs3iCZOojQAwGVSMoRx3KZIshOqxF28HVu0PYc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 62E4594048D; Fri, 25 Jan 2019 12:16:20 +0100 (CET)
Date:   Fri, 25 Jan 2019 12:16:20 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: enable HS400 on R-Car Gen3
Message-ID: <20190125111616.gtv6ojlmpc2uvrhe@verge.net.au>
References: <20181031233125.2800-1-niklas.soderlund@ragnatech.se>
 <20181101194528.GS2433@kunai>
 <20181102115718.7alk6psbkg4sdqtj@verge.net.au>
 <20181205204628.wvc2d4zfynbrztgq@ninjato>
 <20181205213613.GA20406@bigcity.dyn.berto.se>
 <20181207205204.GF17972@bigcity.dyn.berto.se>
 <CAMuHMdWH3G-80Ay=xi+HhRFMTQ=f6idDLFXt94sj5GmppC55Uw@mail.gmail.com>
 <20181218102412.4h3iyevlrmhhnjds@verge.net.au>
 <20190124102422.GT4127@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190124102422.GT4127@bigcity.dyn.berto.se>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 24, 2019 at 11:24:22AM +0100, Niklas Söderlund wrote:
> Hi Simon,
> 
> On 2018-12-18 11:24:13 +0100, Simon Horman wrote:
> > On Tue, Dec 18, 2018 at 10:07:13AM +0100, Geert Uytterhoeven wrote:
> > > Hi Niklas, Simon,
> > > 
> > > On Fri, Dec 7, 2018 at 9:52 PM Niklas Söderlund
> > > <niklas.soderlund@ragnatech.se> wrote:
> > > > On 2018-12-05 22:36:13 +0100, Niklas Söderlund wrote:
> > > > > On 2018-12-05 21:46:28 +0100, Wolfram Sang wrote:
> > > > > > On Fri, Nov 02, 2018 at 12:57:19PM +0100, Simon Horman wrote:
> > > > > > > On Thu, Nov 01, 2018 at 08:45:29PM +0100, Wolfram Sang wrote:
> > > > > > > >
> > > > > > > > > This patch have quiet a few dependencies I'm afraid, let me know if you
> > > > > > > > > wish to be notified once they all upstream. I don't think it's a good
> > > > > > > > > idea to pick this up before all dependencies are resolved.
> > > > > > > >
> > > > > > > > Yes, we should do that. Ping Simon once all dependencies are in next. It
> > > > > > > > is still fine to have this patch here in case people want to test. BTW
> > > > > > > > did you mention your branch somewhere where you collected all these
> > > > > > > > patches to make HS400 working/enabled?
> > > > > > > >
> > > > > > > > For this patch already:
> > > > > > > >
> > > > > > > > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > > > > > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > > > >
> > > > > > > Thanks, I am marking this as deferred.
> > > > > > >
> > > > > > > Please repost or ping me once the dependencies are present in
> > > > > > > an rc release.
> > > > > >
> > > > > > Niklas, are we done now, so we can ask Simon to pick up the DTS change?
> > > > > >
> > > > >
> > > > > Almost :-)
> > > > >
> > > > > I'm  waiting for Geert to take the SD quirk patches before pinging Simon
> > > > > to take this one. Spoke to him today about that so I hope it will not be
> > > > > to long.
> > > > >
> > > >
> > > > I just confirmation that the clock patches have been pulled into
> > > > clk-next so this patch is ready to be consumed by you Simon.
> > > >
> > > > Would it be possible to get this in this cycle or is it to late? I know
> > > > you wished to close your tree for v4.21 at the end of this week which it
> > > > technically is now ;-)
> > > 
> > > This patch seems to depend on both the clock patches, and mmc/next.
> > > Else the kernel hangs with an rcu check :-(
> > > 
> > > Hence please drop, and requeue in renesas-devel after the release of v4.21-rc1.
> > 
> > Thanks, dropped and marked as deferred.
> > 
> > Niklas, please repost or ping me once the dependencies are present in an RC
> > release.
> 
> Ping.

Hi Niklas,

with this applied on top of renesas-devel-20190124-v5.0-rc3
I see eMMC initialised in

* HS200 mode on Salvator-X/M3-W  ES1.0
* HS400 mode on Salvator-XS/H3   ES2.0
* HS400 mode on Salvator-XS/M3-N ES1.0

I believe that is expected and have gone ahead and applied this patch.
