Return-Path: <SRS0=AhbF=PM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACC2C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 09:04:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 664D92184B
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 09:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="MtHog4gc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbfADJEG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Jan 2019 04:04:06 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:49300 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbfADJEG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jan 2019 04:04:06 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id AC3F025BDE3;
        Fri,  4 Jan 2019 20:04:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546592645; bh=kVpFQcy8QLFc5L9lC8MX8BnZcBoVMnpJBgn2+aSvZU4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=MtHog4gcwwZJ1zMyDR9d+sdUe3CYnFvJ5uJGaNMudBFn8NUaHjMSfoIXSxbKyO2Kv
         AaWNzYPidfWWKefqu7ltD09YvJw45UDxm4Qadbi854Mi0KwEUo1zGi2Y1sOKEIjilK
         xi4nXnOcsMQTQYn4ZK+M6CHOh9L164UaSWdDBpqY=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C3554940376; Fri,  4 Jan 2019 10:04:02 +0100 (CET)
Date:   Fri, 4 Jan 2019 10:04:02 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Biju Das <biju.das@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] soc: renesas: r8a774c0-sysc: Fix initialization order of
 3DG-{A,B}
Message-ID: <20190104090401.d4vuq37vdgfc4tow@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103C55C91F968BE2CD870AEB88C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdX60zMDd49ySuinJJnfTpqNJ_Nzj7DO+YYF7C=HFQ-SkA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 02, 2019 at 11:39:03AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Jan 2, 2019 at 10:40 AM Simon Horman <horms@verge.net.au> wrote:
> > On Fri, Dec 14, 2018 at 04:59:00PM +0100, Simon Horman wrote:
> > > On Thu, Dec 13, 2018 at 12:18:46PM +0100, Simon Horman wrote:
> > > > On Wed, Dec 12, 2018 at 12:17:11PM +0000, Biju Das wrote:
> > > > > The workaround for the wrong hierarchy of the 3DG-{A,B} power domains on
> > > > > RZ/G2E ES1.0 corrected the parent domains. However, the 3DG-{A,B} power
> > > > > domains were still initialized and powered in the wrong order, causing
> > > > > 3DG operation to fail.
> > > > >
> > > > > Fix this by changing the order in the table at runtime, when running on
> > > > > an affected SoC.
> > > > >
> > > > > This work is based on the work done by Geert for R-Car E3.
> > > > >
> > > > > Fixes: f37d211c687588328 ("soc: renesas: rcar-sysc: Add r8a774c0 support")
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > >
> > > > Thanks,
> > > >
> > > > This looks fine to me but I will wait to see if there are other reviews
> > > > before applying.
> > > >
> > > > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> > >
> > > Thanks, v2 sent.
> > >
> >
> > I don't see a v2 or any other review of this patch.
> > Am I missing something?
> 
> Presumably the "Thanks, v2 sent." reply (by you!) was a reply meant for
> another thread?

On Wed, Jan 02, 2019 at 03:11:13PM +0000, Biju Das wrote:
> Hi Simon,
> 
> Thanks for the feedback.

...

> > I don't see a v2 or any other review of this patch.
> > Am I missing something?
> 
> I guess you have sent v2,
> 
> https://patchwork.kernel.org/patch/10731381/
> 
> based on
> 
> https://patchwork.kernel.org/patch/10726065/
> 
> regards,
> Biju


Thanks for clearing up my self-inflicted confusion.

I have gone ahead and applied this patch for v4.22.

