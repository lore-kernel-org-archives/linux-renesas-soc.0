Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3982FC282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 14:30:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02EEC20663
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 14:30:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Wt4+HKUF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbfBEOa0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 09:30:26 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:51459 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfBEOa0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 09:30:26 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0217F25B7E9;
        Wed,  6 Feb 2019 01:30:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549377024; bh=ErkQClqyoKpkk4fBTB527mI8jF6MTCLTcmZ44G1iB9c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wt4+HKUFAT5lKgchDb+AmfzAT3dqGZ5/UQKTL64O0bDoRuSbSzI+mgVmKz0mzwuMx
         Q2I9puUy1j6iTi8Gdvs22K0+2nOTZZ4JBy7Pk9/6BOISULg4aKGGG7VIVYOKk7ByrS
         liYJtSdaseZ1M7IC+EruYOinJsKlZOj8uGYLPpQ0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 192A6940486; Tue,  5 Feb 2019 15:30:22 +0100 (CET)
Date:   Tue, 5 Feb 2019 15:30:22 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] i2c: rcar: refactor TCYC handling
Message-ID: <20190205143021.be6lizgc63j5a6tn@verge.net.au>
References: <20190205133725.27688-1-wsa+renesas@sang-engineering.com>
 <20190205133845.GJ12401@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190205133845.GJ12401@kunai>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 05, 2019 at 02:38:46PM +0100, Wolfram Sang wrote:
> On Tue, Feb 05, 2019 at 02:37:25PM +0100, Wolfram Sang wrote:
> > The latest documentation made it clear that we need to initialize the
> > TCYC value independently of DMA. The old code used TCYC06 (wrongly) for
> > non-DMA transfers. The new code sets TCYC up independently from DMA.
> > 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> 
> The latter SoB shouldn't be there yet.

That aside,

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


