Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE72C67839
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 11:18:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 649FB2086D
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 11:18:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="nZk739Fy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 649FB2086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verge.net.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728625AbeLMLSv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 06:18:51 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:43878 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbeLMLSv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 06:18:51 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 78B2A25B781;
        Thu, 13 Dec 2018 22:18:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544699928; bh=KVpWb03srOcFkfypGNXk+izRyriCM8D7RCZfD/zBvB8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nZk739FyNHesp8ECupcQSpeZFjPmgI54hAoxaQ6D0sU1v9DDD42OagHWQfZInJbbo
         8XaxhdmP17q/mIwlHjF6XkblnNUHmnDg8yExUeYUpBurfstHJV40CHjjb/P0ejk14D
         VGbEIhEQ6401S02nHdNCBe0uUTjn+rkvdj5vWJOw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6CC0B940421; Thu, 13 Dec 2018 12:18:46 +0100 (CET)
Date:   Thu, 13 Dec 2018 12:18:46 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] soc: renesas: r8a774c0-sysc: Fix initialization order of
 3DG-{A,B}
Message-ID: <20181213111846.qd25vzpnejbzzldg@verge.net.au>
References: <1544617031-28114-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544617031-28114-1-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 12, 2018 at 12:17:11PM +0000, Biju Das wrote:
> The workaround for the wrong hierarchy of the 3DG-{A,B} power domains on
> RZ/G2E ES1.0 corrected the parent domains. However, the 3DG-{A,B} power
> domains were still initialized and powered in the wrong order, causing
> 3DG operation to fail.
> 
> Fix this by changing the order in the table at runtime, when running on
> an affected SoC.
> 
> This work is based on the work done by Geert for R-Car E3.
> 
> Fixes: f37d211c687588328 ("soc: renesas: rcar-sysc: Add r8a774c0 support")
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
