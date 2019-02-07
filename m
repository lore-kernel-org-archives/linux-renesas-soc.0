Return-Path: <SRS0=J+Ha=QO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D717DC282C2
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 10:42:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3E9021872
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 10:42:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="RO1GqvAQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbfBGKmy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Feb 2019 05:42:54 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53873 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfBGKmx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Feb 2019 05:42:53 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8FE6825B7E2;
        Thu,  7 Feb 2019 21:42:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549536171; bh=85pHy1C+VMwikcr9VjsWQr2VV+QisnMaB9rdWMrBBjI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RO1GqvAQ4xb8JM2EGE9VS2EjPmY9ZbwiysnAWR2/e5cqFp1Tepc7W9JJLP+vtobVu
         ipH4OvA2D/Uz5407IE0HjyTj/83UcMqPY7IMn8AIOMYjuac4N7fASb1uNPXpW75IfN
         qc7r+7ixrxogfF7Z7875HAKI+6AUCqbcYWbTWyrU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id D50CA9444BE; Thu,  7 Feb 2019 11:42:49 +0100 (CET)
Date:   Thu, 7 Feb 2019 11:42:49 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH LOCAL] arm64: dts: renesas: r8a774a1: Add required model
 to dummy board DTS
Message-ID: <20190207104249.yewajvpwhfoz644l@verge.net.au>
References: <20190207091047.22046-1-geert+renesas@glider.be>
 <20190207101415.llxazy3wi36yjgov@verge.net.au>
 <CAMuHMdWD3x8ZJy_8r1yA4QGAerySjwSAPDESEQwgsyPYscWueg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWD3x8ZJy_8r1yA4QGAerySjwSAPDESEQwgsyPYscWueg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 07, 2019 at 11:25:24AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Thu, Feb 7, 2019 at 11:14 AM Simon Horman <horms@verge.net.au> wrote:
> > On Thu, Feb 07, 2019 at 10:10:47AM +0100, Geert Uytterhoeven wrote:
> > > make dtbs_check:
> > >
> > >     arch/arm64/boot/dts/renesas/r8a774a1-dummy.dt.yaml: 'model' is a required property
> > >
> > > Fixes: caf23540a44f1036 ("arm64: dts: renesas: r8a774a1: Add dummy board DTS")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Thanks, applied to topic/arm64-dummy-boards which is included in devel
> > branch of the renesas tree but is not included not the next branch of the
> > renesas tree nor targeted at linux-next.
> 
> Thanks!
> 
> Feel free to squash it into the original, if you think that makes sense.

Thanks, I've left it separate for now.
