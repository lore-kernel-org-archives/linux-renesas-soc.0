Return-Path: <SRS0=RWjW=PK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4369EC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 09:40:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E50C206C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 09:40:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="BtN6tMNU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbfABJkC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 2 Jan 2019 04:40:02 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33583 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726499AbfABJkC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jan 2019 04:40:02 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2286325BE2C;
        Wed,  2 Jan 2019 20:40:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546422000; bh=P54wHyw0JOasIQfSwdFhPAQHK2Bn08jnDAh5WzvAo70=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BtN6tMNUiz3ntr3REHj42ou6X4BQL1renvfG5dQKVq7Nu+QRzAIns21wSf2FKdfVX
         XXVjxdtjK+kfXhZ/UpSFrZ1T0yXtZECzhU0nB0Za6JNQ1KcBR5VLTQNKi8CXO8MVnY
         GjH4TWdJolG0+ZdQwTXMhGx8cwEyxyFIwNseo1UU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 46D0A9402C1; Wed,  2 Jan 2019 10:39:58 +0100 (CET)
Date:   Wed, 2 Jan 2019 10:39:58 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] soc: renesas: r8a774c0-sysc: Fix initialization order of
 3DG-{A,B}
Message-ID: <20190102093958.e7wjhm7eqeu367s7@verge.net.au>
References: <1544617031-28114-1-git-send-email-biju.das@bp.renesas.com>
 <20181213111846.qd25vzpnejbzzldg@verge.net.au>
 <20181214155900.za4xbl74sbbgc4ef@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181214155900.za4xbl74sbbgc4ef@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 14, 2018 at 04:59:00PM +0100, Simon Horman wrote:
> On Thu, Dec 13, 2018 at 12:18:46PM +0100, Simon Horman wrote:
> > On Wed, Dec 12, 2018 at 12:17:11PM +0000, Biju Das wrote:
> > > The workaround for the wrong hierarchy of the 3DG-{A,B} power domains on
> > > RZ/G2E ES1.0 corrected the parent domains. However, the 3DG-{A,B} power
> > > domains were still initialized and powered in the wrong order, causing
> > > 3DG operation to fail.
> > > 
> > > Fix this by changing the order in the table at runtime, when running on
> > > an affected SoC.
> > > 
> > > This work is based on the work done by Geert for R-Car E3.
> > > 
> > > Fixes: f37d211c687588328 ("soc: renesas: rcar-sysc: Add r8a774c0 support")
> > > 
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > 
> > Thanks,
> > 
> > This looks fine to me but I will wait to see if there are other reviews
> > before applying.
> > 
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Thanks, v2 sent.
> 

I don't see a v2 or any other review of this patch.
Am I missing something?
