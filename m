Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177D8C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 09:23:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2AAB2077C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 09:23:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729367AbfDJJX4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 05:23:56 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40076 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729289AbfDJJX4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 05:23:56 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 056C625BE4C;
        Wed, 10 Apr 2019 19:23:54 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1BBF5940356; Wed, 10 Apr 2019 11:23:52 +0200 (CEST)
Date:   Wed, 10 Apr 2019 11:23:52 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     broonie@kernel.org, geert+renesas@glider.be,
        devicetree@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com,
        kuninori.morimoto.gx@renesas.com,
        linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH 4/4] dt-bindings: timer: renesas, cmt: Document
 r8a779{5|65|90} CMT support
Message-ID: <20190410092351.4zoljcxhnsmkskwp@verge.net.au>
References: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp>
 <1554443049-25127-5-git-send-email-cv-dong@jinso.co.jp>
 <20190405080343.74cclqyndkmrsrsg@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190405080343.74cclqyndkmrsrsg@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 05, 2019 at 10:03:43AM +0200, Simon Horman wrote:
> On Fri, Apr 05, 2019 at 02:44:09PM +0900, Cao Van Dong wrote:
> > Document SoC specific bindings for R-Car H3/M3-N/E3 SoCs.
> > 
> > Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> 
> Thanks,
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

I think this patch should be reposted with the following recipients
included:

Daniel Lezcano <daniel.lezcano@linaro.org>
Thomas Gleixner <tglx@linutronix.de>
Rob Herring <robh+dt@kernel.org>
Mark Rutland <mark.rutland@arm.com>
devicetree@vger.kernel.org
