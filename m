Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD7DC2F421
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 16:57:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 44D2820663
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 16:57:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="RG2WHlst"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729974AbfAUQ5i (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 11:57:38 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:47728 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729191AbfAUQ5h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 11:57:37 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 468D225B7CB;
        Tue, 22 Jan 2019 03:57:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548089855; bh=Tl/8ubQHZOi/NcjTHvNSJviBv21dSvSWfHwvQzuFrb8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RG2WHlst9zEOEhdVhb+pKIroCI1H1DjynR4Xljl7b+8J7AWbtrJX3bzz8JhgK6ITJ
         FlfO98LV5/glk0Zdh444eWypwwwJuxGc6d/UzUV/MbJohhI0p7R3y8IElCWhnOPWc7
         RdFB3Wg1ErSw3FdGrqEdFMG0gt3Y4EcHAjTO3jhI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 98A06940459; Mon, 21 Jan 2019 17:57:33 +0100 (CET)
Date:   Mon, 21 Jan 2019 17:57:33 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77990: ebisu: Enable HS400 of
 SDHI3
Message-ID: <20190121165733.7jqlhqif3es64i43@verge.net.au>
References: <20190118122536.20000-1-horms+renesas@verge.net.au>
 <20190119222220.GA7266@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190119222220.GA7266@kunai>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jan 19, 2019 at 11:22:20PM +0100, Wolfram Sang wrote:
> On Fri, Jan 18, 2019 at 01:25:36PM +0100, Simon Horman wrote:
> > Enable HS400 of SDHI3 using the corresponding DT property.
> > No further changes are required.
> > 
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> We might need to find an explanation for the performance numbers,
> nontheless this patch is correct.

Thanks, I think we can queue this up for mainline and I have done so for
v5.1.
