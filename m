Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB9DC282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 12:08:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C4A04217F5
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 12:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfAWMIz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 07:08:55 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:45278 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbfAWMIz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 07:08:55 -0500
Received: by mail-vs1-f65.google.com with SMTP id x28so1109055vsh.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jan 2019 04:08:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7HvdJqsQe7TI1YTrpsNONuvS70sqq3aAmGmAR2yAqqU=;
        b=LaT9j10MjteQwjCHREujgLiU7LX+lYY16uIi4mq99UHYYfjJNWXNDRAz3v+0n+7h/t
         sXtXR2qpmmPD3J9jtUQYW41MjgJY1pHt5LDL+6WYMHeiEKPXEtjYo7G2thGXNfpvjQiE
         SSPONRrXs4AtWpbFCov6rf/BAkIvDqY+YUIfVcTKEuDpvOvPKpv5JoUCiAIyB13cvP0H
         3tqt8IiyQD1kCIm0iE8T5hRJ0Cnvzu9bP5se6bczuvMXxVF6+kOq2mfEr08JCe+s6k35
         dQEsuhJKN23iBldWlc55ayCYZB4Y39kmYtpBnL8Ea8bNVEvKEj93BfWyAawklsXeujal
         DpcA==
X-Gm-Message-State: AJcUukcu+VasKF2VI16Xm0j03XRt+6MybwUhDuVxMD/kbIPuPG3mHaEa
        jCjPOnphMXiCiZUM6NH3sc8iJb3t00tTc4/jKKA=
X-Google-Smtp-Source: ALg8bN6fKriB+pjwwLfmMdabFtuBfLiHN7I7eK2qDHYORYzZq4Mtqb2d4+xOCIZtHcFRL3R5EuwpxHQB12vSoA/cnqM=
X-Received: by 2002:a67:b60d:: with SMTP id d13mr769770vsm.152.1548245334203;
 Wed, 23 Jan 2019 04:08:54 -0800 (PST)
MIME-Version: 1.0
References: <20190104091316.12716-1-geert+renesas@glider.be>
 <20190104094712.jfqgvmm5qmysryex@verge.net.au> <20190123114118.hgwd7uwi7blpgmwl@verge.net.au>
In-Reply-To: <20190123114118.hgwd7uwi7blpgmwl@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jan 2019 13:08:42 +0100
Message-ID: <CAMuHMdXc+wYJUWy763QOmR4G1-foHZ3v=ua5vYe6hkAi5EEB3A@mail.gmail.com>
Subject: Re: [PATCH LOCAL 0/2] arm64: dts: renesas: Add dummy board files
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Wed, Jan 23, 2019 at 12:41 PM Simon Horman <horms@verge.net.au> wrote:
> On Fri, Jan 04, 2019 at 10:47:13AM +0100, Simon Horman wrote:
> > On Fri, Jan 04, 2019 at 10:13:14AM +0100, Geert Uytterhoeven wrote:
> > > This patch series adds dummy board files for SoCs that do not have
> > > upstream board support yet (RZ/G2M and RZ/G2E).
> > >
> > > Not intended for upstream merge, but perhaps useful to add to your
> > > topic/renesas-defconfig branch (or a new branch), and merge into devel,
> > > to improve build coverage?
> > >
> > > Thanks!
> > >
> > > Geert Uytterhoeven (2):
> > >   [LOCAL] arm64: dts: renesas: r8a774a1: Add dummy board DTS
> > >   [LOCAL] arm64: dts: renesas: r8a774c0: Add dummy board DTS
> > >
> > >  arch/arm64/boot/dts/renesas/Makefile           | 4 ++++
> > >  arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts | 2 ++
> > >  arch/arm64/boot/dts/renesas/r8a774c0-dummy.dts | 2 ++
> > >  3 files changed, 8 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts
> > >  create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-dummy.dts
> >
> > Thanks, I will create topic/arm64-dummy-boards for these patches
> > and included in the devel branch.
>
> The following files are now present in my tree,
> queued up for v5.0.
>
>         arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
>         arch/arm64/boot/dts/renesas/r8a774c0-ek874.dts
>
> Shall I go ahead and drop arch/arm64/boot/dts/renesas/r8a774c0-dummy.dts ?

Yes please, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
