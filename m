Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF50C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 09:59:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8B40218AF
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 09:59:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="cT69vi2/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbfAXJ7N (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 04:59:13 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:36011 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727808AbfAXJ7M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 04:59:12 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 72D3125B769;
        Thu, 24 Jan 2019 20:59:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548323950; bh=3z62uOVLdjU5KzOZjPi4vS2g0+lh+imVKtl7ybTC5nQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cT69vi2/dY0F31fpmdAyZ12B6TrLhtq/l4n+Ca9KQ84zIIeZ+NYPyMWOnwp4LC6M+
         Xze0XZHMcyuRi9hFAxyW39+iTO3qihutuvlB3xPT5ggPt8zn7VFMCUfVcPBjUtXZ77
         G81mf7u2Ibf9ourCqfy2Iw7CrzsKxdqWWq0prnLI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 80D12940708; Thu, 24 Jan 2019 10:59:08 +0100 (CET)
Date:   Thu, 24 Jan 2019 10:59:08 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH LOCAL 0/2] arm64: dts: renesas: Add dummy board files
Message-ID: <20190124095904.uaenin6xavudnczq@verge.net.au>
References: <20190104091316.12716-1-geert+renesas@glider.be>
 <20190104094712.jfqgvmm5qmysryex@verge.net.au>
 <20190123114118.hgwd7uwi7blpgmwl@verge.net.au>
 <CAMuHMdXc+wYJUWy763QOmR4G1-foHZ3v=ua5vYe6hkAi5EEB3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXc+wYJUWy763QOmR4G1-foHZ3v=ua5vYe6hkAi5EEB3A@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 23, 2019 at 01:08:42PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Jan 23, 2019 at 12:41 PM Simon Horman <horms@verge.net.au> wrote:
> > On Fri, Jan 04, 2019 at 10:47:13AM +0100, Simon Horman wrote:
> > > On Fri, Jan 04, 2019 at 10:13:14AM +0100, Geert Uytterhoeven wrote:
> > > > This patch series adds dummy board files for SoCs that do not have
> > > > upstream board support yet (RZ/G2M and RZ/G2E).
> > > >
> > > > Not intended for upstream merge, but perhaps useful to add to your
> > > > topic/renesas-defconfig branch (or a new branch), and merge into devel,
> > > > to improve build coverage?
> > > >
> > > > Thanks!
> > > >
> > > > Geert Uytterhoeven (2):
> > > >   [LOCAL] arm64: dts: renesas: r8a774a1: Add dummy board DTS
> > > >   [LOCAL] arm64: dts: renesas: r8a774c0: Add dummy board DTS
> > > >
> > > >  arch/arm64/boot/dts/renesas/Makefile           | 4 ++++
> > > >  arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts | 2 ++
> > > >  arch/arm64/boot/dts/renesas/r8a774c0-dummy.dts | 2 ++
> > > >  3 files changed, 8 insertions(+)
> > > >  create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts
> > > >  create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-dummy.dts
> > >
> > > Thanks, I will create topic/arm64-dummy-boards for these patches
> > > and included in the devel branch.
> >
> > The following files are now present in my tree,
> > queued up for v5.0.
> >
> >         arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> >         arch/arm64/boot/dts/renesas/r8a774c0-ek874.dts
> >
> > Shall I go ahead and drop arch/arm64/boot/dts/renesas/r8a774c0-dummy.dts ?
> 
> Yes please, thanks!

Thanks, done.
