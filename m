Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118F3C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 14:38:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB10C205C9
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 14:38:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="pi0V2TA+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfAQOiv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 09:38:51 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:35352 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbfAQOiv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 09:38:51 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4658F25B760;
        Fri, 18 Jan 2019 01:38:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547735929; bh=D9V2YtdMQzhzMFL09enVQXtZuG3ZCl4MEBpTv2rUSaY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pi0V2TA+ec9AzPcwjEj6XJ9bUSmrn0qOaHgNI43cVW2AQ24Iu/0m46nBggimduJKO
         8f0+mdsGl6PeaasRyitfrsLylKnnM+BQBb0j9IA1wnnC5xEF0Mr2X5y3SYoY3E7RfG
         rMBhG94GloP/a5ftAb/AN05SVVlwMaEvjE81tj7Y=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6073F940459; Thu, 17 Jan 2019 15:38:47 +0100 (CET)
Date:   Thu, 17 Jan 2019 15:38:47 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Enable HS400 of
 SDHI3
Message-ID: <20190117143846.owmvegwqdlb4bybx@verge.net.au>
References: <20190110142833.31577-1-horms+renesas@verge.net.au>
 <20190117133216.sx7rqao73xy3ne7r@verge.net.au>
 <20190117141812.kvyjeja65r7e26jq@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190117141812.kvyjeja65r7e26jq@ninjato>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 17, 2019 at 03:18:12PM +0100, Wolfram Sang wrote:
> On Thu, Jan 17, 2019 at 02:32:17PM +0100, Simon Horman wrote:
> > [CC Wolfram, Niklas]
> > 
> > On Thu, Jan 10, 2019 at 03:28:33PM +0100, Simon Horman wrote:
> > > Add SDHI3 UHS pin control and use it when enabling HS200 support
> > > for SDHI3.
> > > 
> > > Based on work by Takeshi Kihara.
> > > 
> > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > > ---
> > > Tested on top of renesas-devel-20190110-v5.0-rc1
> > 
> > I would value a review of this patch.
> 
> Can you resend with the added CCs, please?

Sure, done.
