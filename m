Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C6CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 15:59:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96AE3206DD
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 15:59:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="XsPojDtx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbeLNP7E (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 10:59:04 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:35782 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727540AbeLNP7E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 10:59:04 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5572925B770;
        Sat, 15 Dec 2018 02:59:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544803142; bh=cJVQww9ArpAceuUkz9NmThtxobmfNWEnJV2HWH1P8UE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XsPojDtx20WBrjnRrohCRuj6G5/CxEQyfm5cWMSGKOUaZUisHduQxbnxRUe1uK7Dd
         E/vs02BzvCl8fwayoH/b3fv0uGRZIEJYXSW96GaEJhdejOIfbX5gOW4vlJwx/miFmV
         cgfJ4fEBank3+WrDuAxGECtdqpBRlfhilJadTkJM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 845739403C3; Fri, 14 Dec 2018 16:59:00 +0100 (CET)
Date:   Fri, 14 Dec 2018 16:59:00 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] soc: renesas: r8a774c0-sysc: Fix initialization order of
 3DG-{A,B}
Message-ID: <20181214155900.za4xbl74sbbgc4ef@verge.net.au>
References: <1544617031-28114-1-git-send-email-biju.das@bp.renesas.com>
 <20181213111846.qd25vzpnejbzzldg@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213111846.qd25vzpnejbzzldg@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 12:18:46PM +0100, Simon Horman wrote:
> On Wed, Dec 12, 2018 at 12:17:11PM +0000, Biju Das wrote:
> > The workaround for the wrong hierarchy of the 3DG-{A,B} power domains on
> > RZ/G2E ES1.0 corrected the parent domains. However, the 3DG-{A,B} power
> > domains were still initialized and powered in the wrong order, causing
> > 3DG operation to fail.
> > 
> > Fix this by changing the order in the table at runtime, when running on
> > an affected SoC.
> > 
> > This work is based on the work done by Geert for R-Car E3.
> > 
> > Fixes: f37d211c687588328 ("soc: renesas: rcar-sysc: Add r8a774c0 support")
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, v2 sent.
