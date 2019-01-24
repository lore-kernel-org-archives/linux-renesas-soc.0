Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0ADC282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 12:41:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4105A20855
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 12:41:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ffhqpbEu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbfAXMly (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 07:41:54 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:37617 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727455AbfAXMlx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 07:41:53 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 41A9525B769;
        Thu, 24 Jan 2019 23:41:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548333711; bh=A57HJqcg15zNcLi/Pn8i1MP30i6F3S+js1+ay5rcZq4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ffhqpbEunm6JJWYn9vsNWT7MVsaQhQmZVdurz9WEptbS7M1Tt40zUhjBH+SjrI32o
         1eDNac4s7PBHyVl6KZ/uwIlJuiKcDtxZK9WUHyPRkf5RfYEYePxWtI3D5gEKtomIUt
         TcdGqHyeo5loNt3Eb5FAQZIIyuGBAM8lVMik1E4E=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id AC7EB9403C0; Thu, 24 Jan 2019 13:41:49 +0100 (CET)
Date:   Thu, 24 Jan 2019 13:41:49 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: rcar: refactor TCYC handling
Message-ID: <20190124124145.odoqfbmcj2crmpq2@verge.net.au>
References: <20190121170800.21144-1-wsa+renesas@sang-engineering.com>
 <20190121170800.21144-3-wsa+renesas@sang-engineering.com>
 <20190123102506.hi6tvyby5f4wbaho@verge.net.au>
 <20190123173926.GA956@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190123173926.GA956@kunai>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 23, 2019 at 06:39:26PM +0100, Wolfram Sang wrote:
> On Wed, Jan 23, 2019 at 11:25:06AM +0100, Simon Horman wrote:
> > On Mon, Jan 21, 2019 at 06:08:00PM +0100, Wolfram Sang wrote:
> > > The latest documentation made it clear that we need to initialize the
> > > TCYC value independently of DMA. Simplify the code to do that.
> > 
> > Hi Wolfram,
> > 
> > I see TCYC bit 6 is no longer used after this patch.
> > Does that warrant a mention in the changelog?
> 
> Do you think so? The old code used TCYC06 (wrongly) for non-DMA transfers.
> The new code sets TCYC up "independently from DMA" <- commit message.

FWIIW, the text above is much clearer to me than the original changelog.
But perhaps that is more a reflection on me than anything else.

