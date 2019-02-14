Return-Path: <SRS0=Vdsz=QV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79755C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Feb 2019 12:56:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 493D02229F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Feb 2019 12:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="SEMveQtV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438572AbfBNM4f (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Feb 2019 07:56:35 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59181 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388215AbfBNM4f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Feb 2019 07:56:35 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A622C25B763;
        Thu, 14 Feb 2019 23:56:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1550148992; bh=P1vZdgonu0+1CXC3z2RGtwgKuQAV5cjS1ZhOhvNU/Gc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SEMveQtVI7VHnA/htbFlkPMZh2XcVjJUm+TyLHVhPtWJy2dabjIRDjB1bThBPRbNX
         vw2YMqktoedim+TvjUe3BSK14gbQMdUcqN05dPQ65xiIESqz7Ny21TnwTCb+mBy1Pv
         LuCISaO1IUyKX6c0iumgwB5GfiJDLm4DS2sBPd14=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 27AE19444E1; Thu, 14 Feb 2019 13:56:31 +0100 (CET)
Date:   Thu, 14 Feb 2019 13:56:31 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Fix SPDX license
 identifier style
Message-ID: <20190214125630.ecd4jbtcx2cavgyy@verge.net.au>
References: <20190212152129.10613-1-geert+renesas@glider.be>
 <20190212161035.x2wkopyde6omv4xg@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190212161035.x2wkopyde6omv4xg@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 12, 2019 at 05:10:39PM +0100, Simon Horman wrote:
> On Tue, Feb 12, 2019 at 04:21:29PM +0100, Geert Uytterhoeven wrote:
> > According to Documentation/process/license-rules.rst, SPDX license
> > identifiers in DTS files should use C++ style comments.
> > 
> > Fixes: f37a7767f6c4ec66 ("arm64: dts: renesas: Add Renesas R8A77990 SoC support")
> > Fixes: 77049191b24b4586 ("arm64: dts: renesas: Add Renesas Ebisu board support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

Thanks again, applied for v5.2.
