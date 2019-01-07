Return-Path: <SRS0=nqfF=PP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25B4C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 13:52:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2AE82147C
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 13:52:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="JTBMDBQ+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbfAGNwv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Jan 2019 08:52:51 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40549 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727872AbfAGNwv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jan 2019 08:52:51 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5051825B7BA;
        Tue,  8 Jan 2019 00:52:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546869169; bh=Hkliy5LnFs+6gKnjesmJZwp0b032vzCsWS+tQr0d0BM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JTBMDBQ+4FkIeaEq4gyai7usYc89swzrDUobGM6njTrMD2fRRRul4b7VlfXfzIDFR
         aoqLKMr9Q5yvky/QA7FTmo9GHuqpZ9ay0DLyALbrahZvVnd6Kzq5IQVw4JpO1vXEeo
         kMczNUIfSwsoXq/VRtMW37+IhwihkqFn6gfArQIg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 52B5F940443; Mon,  7 Jan 2019 14:52:47 +0100 (CET)
Date:   Mon, 7 Jan 2019 14:52:47 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] soc: renesas: r8a774c0-sysc: Fix initialization order of
 3DG-{A,B}
Message-ID: <20190107135246.g36uf76rdexvsyko@verge.net.au>
References: <OSBPR01MB2103C55C91F968BE2CD870AEB88C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdX60zMDd49ySuinJJnfTpqNJ_Nzj7DO+YYF7C=HFQ-SkA@mail.gmail.com>
 <20190104090401.d4vuq37vdgfc4tow@verge.net.au>
 <CAMuHMdWZhXWu9JwiAS1L+M6bN6pMTTRN9jiQMi7voUWifLRb9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWZhXWu9JwiAS1L+M6bN6pMTTRN9jiQMi7voUWifLRb9w@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 07, 2019 at 09:34:02AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Jan 4, 2019 at 10:04 AM Simon Horman <horms@verge.net.au> wrote:
> > On Wed, Jan 02, 2019 at 11:39:03AM +0100, Geert Uytterhoeven wrote:
> > > On Wed, Jan 2, 2019 at 10:40 AM Simon Horman <horms@verge.net.au> wrote:
> > > > On Fri, Dec 14, 2018 at 04:59:00PM +0100, Simon Horman wrote:
> > > > > On Thu, Dec 13, 2018 at 12:18:46PM +0100, Simon Horman wrote:
> > > > > > On Wed, Dec 12, 2018 at 12:17:11PM +0000, Biju Das wrote:
> > > > > > > The workaround for the wrong hierarchy of the 3DG-{A,B} power domains on
> > > > > > > RZ/G2E ES1.0 corrected the parent domains. However, the 3DG-{A,B} power
> > > > > > > domains were still initialized and powered in the wrong order, causing
> > > > > > > 3DG operation to fail.
> > > > > > >
> > > > > > > Fix this by changing the order in the table at runtime, when running on
> > > > > > > an affected SoC.
> > > > > > >
> > > > > > > This work is based on the work done by Geert for R-Car E3.
> > > > > > >
> > > > > > > Fixes: f37d211c687588328 ("soc: renesas: rcar-sysc: Add r8a774c0 support")
> > > > > > >
> > > > > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > > > >
> > > > > > Thanks,
> > > > > >
> > > > > > This looks fine to me but I will wait to see if there are other reviews
> > > > > > before applying.
> 
> > I have gone ahead and applied this patch for v4.22.
> 
> Given commit 1585124d9563da64 ("soc: renesas: rcar-sysc: Merge PM Domain
> registration and linking") is in v5.0-rc1, this means the rcar-sysc driver
> will bail out without this fix, not registering any PM Domains.
> Sorry for not realizing this dependency before.
> 
> Hence you may want to queue it as a fix for v5.0 instead.
> Or not, as we won't have a board DTS for RZ/G2E in v5.0-rc1 anyway?

Thanks, it seems appropriate for this to be a fix for v5.0.
I've updated my branches accordingly.
