Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB1DC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 13:16:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E8D120652
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 13:16:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="QDBVL2Ds"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbfAQNQq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 08:16:46 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:34288 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbfAQNQq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 08:16:46 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E393F25B7E8;
        Fri, 18 Jan 2019 00:16:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547731004; bh=5YpuGCQsrwh/lUMRi5K0Kegv5H2+0PceZf/ThFZVKss=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QDBVL2DsBZuY6G41JoFpLoGtaYa7aEOEFJqymkxm2P71h6caP0PtF66aQavRvuWjm
         NfszlYZ0VEzcWy275JilUdbR9YudfLl1POu8k4wVbNDko4da+k0r1InMo80DPQk9aK
         o2/qyL6/VnhPrxGDM45U+6D4Ue8mM7VMcXPJ38ZY=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id D3D70940459; Thu, 17 Jan 2019 14:16:41 +0100 (CET)
Date:   Thu, 17 Jan 2019 14:16:41 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7778: Add HSCIF0/1 support
Message-ID: <20190117131641.meqjsylxnwiwi4v5@verge.net.au>
References: <20190110153232.21212-1-geert+renesas@glider.be>
 <20190111135319.mgixoxa5iigmx5x4@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190111135319.mgixoxa5iigmx5x4@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 11, 2019 at 02:53:20PM +0100, Simon Horman wrote:
> On Thu, Jan 10, 2019 at 04:32:32PM +0100, Geert Uytterhoeven wrote:
> > From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> > 
> > Add HSCIF0/1 clocks and device nodes, based on Rev. 1.00 of the R-Car
> > M1A datasheet.
> > 
> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> > [geert: Squashed two patches]
> > [geert: Correct HSCIF1 module clock index]
> > [geert: Correct reg properties for non-LPAE]
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, applied for v5.1.
