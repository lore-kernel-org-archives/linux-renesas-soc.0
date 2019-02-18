Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85809C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 14:15:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 57677217D7
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 14:15:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="JzBb+s0k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732696AbfBROPM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 09:15:12 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:50931 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730695AbfBROPL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 09:15:11 -0500
Received: from penelope.horms.nl (176-142-25-88.abo.bbox.fr [176.142.25.88])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 13E0025B740;
        Tue, 19 Feb 2019 01:15:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1550499309; bh=qkutETDZHUL1DLNiZ6cBUucYfY+T06CmND1M303xshA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JzBb+s0kWGFZO2Trf8+jPMAfddKeqQlOZz8B6BQ778Oz8c/chTpmpehMqy5pXY9sN
         T6FrqYzOe2pns2R0oc7l+I7NaFY//0DlsITZ+Wv41WHNH0Jf+oEDWi3ZN/o5Cj5R4+
         OCdx3JQpZcZD4Hr06u40v66HrMvkMNIkGeLIsRWM=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 0D666E218D3; Mon, 18 Feb 2019 15:15:05 +0100 (CET)
Date:   Mon, 18 Feb 2019 15:15:05 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        stable <stable@vger.kernel.org>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Updates for v5.1
Message-ID: <20190218141417.7n6q5petp5oepd55@verge.net.au>
References: <cover.1549622472.git.horms+renesas@verge.net.au>
 <CAK8P3a0prd-4eyVOVUpp2Bhn1mGOVZwA_we79TNjSa4FF5DP6A@mail.gmail.com>
 <20190218112715.zufzr3knrhs37t6h@verge.net.au>
 <CAK8P3a1BrahyfrRD=1dSLNzc1mujh+rxdLoU8CtGruRSbo3JVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1BrahyfrRD=1dSLNzc1mujh+rxdLoU8CtGruRSbo3JVg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 18, 2019 at 02:12:07PM +0100, Arnd Bergmann wrote:
> On Mon, Feb 18, 2019 at 12:27 PM Simon Horman <horms@verge.net.au> wrote:
> > On Fri, Feb 15, 2019 at 05:49:32PM +0100, Arnd Bergmann wrote:
> > > On Fri, Feb 8, 2019 at 12:14 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > > > Renesas ARM Based SoC Updates for v5.1
> > > >
> > > > * Correct shared IRQ handling of R-Car Gen2 Regulator quirk
> > > > * Add missing dts files to MAINTAINERS
> > >
> > > Should the bugfix be marked Cc:stable and and Fixes:... ?
> > >
> > Sorry for missing that, I think that the bugfix should have had the following.
> > Let me know if/how you want to handle updating the patch's changelog.
> >
> > Fixes: 6d14d4d313d09dab ("ARM: shmobile: Rework the PMIC IRQ line quirk")
> 
> I think the easiest way is to send an email to stable@kernel.org asking for
> a backport of commit 5347a0203709 ("ARM: shmobile: Fix R-Car Gen2 regulator
> quirk") after that has hit the mainline kernel and asking for a backport.
> 
> I've added it to Cc here, but I don't know if that's sufficient.
> 
> If you'd rather have me pick up the patch for 5.0 as well, I can also do
> that and add the Cc/Fixes lines there. We will then have a duplicate
> commit in 5.1, but it should not cause any merge issues.

Thanks Arnd,

I'm happy to handle this via stable and avoid the duplicate.
If I don't hear back from them in a few days I'll make a formal
submission there.
