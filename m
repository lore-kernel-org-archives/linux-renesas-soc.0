Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A0FC10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 09:22:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 440C72077C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 09:22:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbfDJJWm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 05:22:42 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40044 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727546AbfDJJWl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 05:22:41 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8AEBC25BE4C;
        Wed, 10 Apr 2019 19:22:39 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 656B7940356; Wed, 10 Apr 2019 11:22:37 +0200 (CEST)
Date:   Wed, 10 Apr 2019 11:22:37 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     broonie@kernel.org, geert+renesas@glider.be,
        devicetree@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com,
        kuninori.morimoto.gx@renesas.com,
        linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r8a7795: Add CMT device nodes
Message-ID: <20190410092237.ctzwuevbprgjkocv@verge.net.au>
References: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp>
 <1554443049-25127-2-git-send-email-cv-dong@jinso.co.jp>
 <20190405081716.s74zbrd47ychcevw@verge.net.au>
 <d666b4d4-4b78-201f-c7a1-f41bd5c1cf71@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d666b4d4-4b78-201f-c7a1-f41bd5c1cf71@jinso.co.jp>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 05, 2019 at 06:02:30PM +0900, Cao Van Dong wrote:
> Dear Simon-san,
> 
> On 2019/04/05 17:17, Simon Horman wrote:
> > On Fri, Apr 05, 2019 at 02:44:06PM +0900, Cao Van Dong wrote:
> > > This patch adds CMT{0|1|2|3} device nodes for r8a7795 SoC.
> > > 
> > > Tested-by: Cao Van Dong <cv-dong@jinso.co.jp>
> > > Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> > Thanks,
> > 
> > This looks fine to me but I will wait to see if there are other reviews
> > before applying.
> > 
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Thanks you for review!
> > I am, however, curious to know how you tested this.
> > 
> > Likewise for patches 2/4 and 3/4.
> Always thanks for your curious!
> After booting, I checked the existence of the device and the device
> interrupt.

Thanks,

I have applied patches 1/4, 2/4 and 3/4 for inclusion in v5.2.
