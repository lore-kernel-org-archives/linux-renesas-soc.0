Return-Path: <SRS0=AhbF=PM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CE8C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 13:15:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 766CD21871
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 13:15:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Emj4sbRP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfADNPh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Jan 2019 08:15:37 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:52363 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbfADNPh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jan 2019 08:15:37 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 42C4D25B747;
        Sat,  5 Jan 2019 00:15:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546607734; bh=duS/C5f2ArnpxMnYmNAJSSPfOzi2JSwQQ96/l/mJGFc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Emj4sbRP7g6lmvM3pdXlji3ZgJq8f/QLYlqv2D3aNRPuGQrKkFHCh938VY7dRiKG1
         mjZN8A/utnjachCVVg3sA83XgN0qTA8lkLD6TCkAj2tlkgyP0t5vG0fKtKOjvwX3kV
         9tgocp9RQ8u1IFVpp/7oESCz8XRSe9MymV81W0i0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 37D94940376; Fri,  4 Jan 2019 14:15:32 +0100 (CET)
Date:   Fri, 4 Jan 2019 14:15:32 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable R-Car thermal driver
Message-ID: <20190104131531.yqw2drds5rjpe6bg@verge.net.au>
References: <20190102095154.25839-1-horms+renesas@verge.net.au>
 <CAMuHMdU=aR8mSwd876LV=DG_vh6Bx45zxRTfMXuX3BQpy0M=ow@mail.gmail.com>
 <20190104085720.36ccxhtcbyyzgfrk@verge.net.au>
 <CAMuHMdWf=_-WZT9XUqPCZocNs1As3RJnXMYRYc05Y4td6SciFg@mail.gmail.com>
 <20190104091216.dgbnkxuuamgicysg@verge.net.au>
 <CAMuHMdWhCf-DSvVw7Z-uNpCJZ_kdGzf297OSFLZzc5TZvTNS3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWhCf-DSvVw7Z-uNpCJZ_kdGzf297OSFLZzc5TZvTNS3A@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 04, 2019 at 10:17:15AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Jan 4, 2019 at 10:12 AM Simon Horman <horms@verge.net.au> wrote:
> > On Fri, Jan 04, 2019 at 10:01:13AM +0100, Geert Uytterhoeven wrote:
> > > On Fri, Jan 4, 2019 at 9:57 AM Simon Horman <horms@verge.net.au> wrote:
> > > > On Wed, Jan 02, 2019 at 11:45:37AM +0100, Geert Uytterhoeven wrote:
> > > > > On Wed, Jan 2, 2019 at 10:53 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> > > > > > Enable the R-Car thermal driver as a built-in.
> > > > > >
> > > > > > This driver is used in conjunction with the R-Car V3M (r8a77970),
> > > > > > E3 (r8a77990) and D3 (r8a77995) SoCs.
> > > > >
> > > > > > [v2] Enable as a built-in rather than a module as this seems
> > > > > >      safer from the point of view of protecting equipment from
> > > > > >      overheating.
> > > > >
> > > > > Shouldn't the above paragraph be moved below the ---?
> > > >
> > > > I have recently come to believe that its a matter of taste. And I think in
> > > > this case it captures important information that is worthy of inclusion in
> > > > the changelog.
> > >
> > > The rationale behind doing it this way could still be appended to the
> > > first line of the body of the patch decription.
> >
> > Sorry, I'm having a little trouble parsing that. Do you mean that it could
> > be appended to the body of the changelog at apply-time?
> 
> I mean the rationale could have been part of the patch description, i.e.
> above the ---, e.g.:

Thanks, I understand now.

> 
>     Subject: [PATCH v2] arm64: defconfig: Enable R-Car thermal driver
> 
>     Enable the R-Car thermal driver as a built-in.
>     Built-in seems safer than modular from the point of view of protecting
>     equipment from overheating.
> 
>     This driver is used in conjunction with the R-Car V3M (r8a77970),
>     E3 (r8a77990) and D3 (r8a77995) SoCs.
> 
>     Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>     ---
>     v2:
>       - Switch from built-in to modular.
> 
>      arch/arm64/configs/defconfig | 1 +
>      1 file changed, 1 insertion(+)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
