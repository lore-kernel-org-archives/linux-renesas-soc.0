Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7386CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 14:21:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4ED5A21901
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 14:21:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388761AbfBROVc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 09:21:32 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39165 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732892AbfBROVc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 09:21:32 -0500
Received: by mail-qt1-f195.google.com with SMTP id o6so19303202qtk.6;
        Mon, 18 Feb 2019 06:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tedBm7tEj+42p5CtJWgjBm2AF23zaCje89BVBJneM0M=;
        b=M07yrDGP4dCkWIh5bPtNcgF1CWAGo4JKW78al+r5T9nVZ0LHXygZhdVwY0Vbr/xpiR
         L3Q4mzcJ/MBLjECM3id5llyjhIRHakU5ghbn+eLS431/VBsFJnr4E13FLBkAL10qO9Bc
         6yMTx112xIWaO7BIfYSCJAH0DT89kSmiT9/CiycdOzQ5vFm+BoU94N4TRDpAcroPMbvE
         pa0mjcHZRfyA0uGNH8OKSIJRjPNnw+a7UUuyI5x3+5CK8kq+t2BSFTjL8nZSQrBs7Dz+
         CFwrgAn2WJN6y9cZDExTah5+v3HzR2plRJlNd74Qka1ZOZY2QO/dHkn1hbnivdUkyyqv
         JOsg==
X-Gm-Message-State: AHQUAubTl/eZ9l0FuI5j9vXr00BF/UohCUeMn6MLxQ2v3f2JqJ7YqLFa
        T6ugu1Q+wca2wDtc+PmEMWxzJPfZxKDiD6JN4jo=
X-Google-Smtp-Source: AHgI3IYDAZCUlkI7uxhgCkk4TDyxQIXuDT4FYtE1p2U9SAK447aJaSaRygET62vtdWwZLvPjF3nMocbUC5+AbSI/fvg=
X-Received: by 2002:ac8:445a:: with SMTP id m26mr18226786qtn.212.1550499691188;
 Mon, 18 Feb 2019 06:21:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549622472.git.horms+renesas@verge.net.au>
 <CAK8P3a0prd-4eyVOVUpp2Bhn1mGOVZwA_we79TNjSa4FF5DP6A@mail.gmail.com>
 <20190218112715.zufzr3knrhs37t6h@verge.net.au> <CAK8P3a1BrahyfrRD=1dSLNzc1mujh+rxdLoU8CtGruRSbo3JVg@mail.gmail.com>
 <20190218141417.7n6q5petp5oepd55@verge.net.au>
In-Reply-To: <20190218141417.7n6q5petp5oepd55@verge.net.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 18 Feb 2019 15:21:14 +0100
Message-ID: <CAK8P3a3ULz5BG=hUmhX0a+AX4yYs9gB9G8QEjYjV9pDO=5BBuw@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Updates for v5.1
To:     Simon Horman <horms@verge.net.au>
Cc:     arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 18, 2019 at 3:15 PM Simon Horman <horms@verge.net.au> wrote:
>
> On Mon, Feb 18, 2019 at 02:12:07PM +0100, Arnd Bergmann wrote:
> > On Mon, Feb 18, 2019 at 12:27 PM Simon Horman <horms@verge.net.au> wrote:
> > > On Fri, Feb 15, 2019 at 05:49:32PM +0100, Arnd Bergmann wrote:
> > > > On Fri, Feb 8, 2019 at 12:14 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > > > > Renesas ARM Based SoC Updates for v5.1
> > > > >
> > > > > * Correct shared IRQ handling of R-Car Gen2 Regulator quirk
> > > > > * Add missing dts files to MAINTAINERS
> > > >
> > > > Should the bugfix be marked Cc:stable and and Fixes:... ?
> > > >
> > > Sorry for missing that, I think that the bugfix should have had the following.
> > > Let me know if/how you want to handle updating the patch's changelog.
> > >
> > > Fixes: 6d14d4d313d09dab ("ARM: shmobile: Rework the PMIC IRQ line quirk")
> >
> > I think the easiest way is to send an email to stable@kernel.org asking for
> > a backport of commit 5347a0203709 ("ARM: shmobile: Fix R-Car Gen2 regulator
> > quirk") after that has hit the mainline kernel and asking for a backport.
> >
> > I've added it to Cc here, but I don't know if that's sufficient.
> >
> > If you'd rather have me pick up the patch for 5.0 as well, I can also do
> > that and add the Cc/Fixes lines there. We will then have a duplicate
> > commit in 5.1, but it should not cause any merge issues.
>
> Thanks Arnd,
>
> I'm happy to handle this via stable and avoid the duplicate.
> If I don't hear back from them in a few days I'll make a formal
> submission there.

Ok, sounds good.

To clarify: I think you should only write them /after/ the commit
is in mainline then, i.e. near the end of the 5.1 merge window.

      Arnd
