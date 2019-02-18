Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD2DC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 11:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D1FF2173C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 11:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="byU9vJc0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbfBRL1Z (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 06:27:25 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:47393 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728732AbfBRL1Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 06:27:25 -0500
Received: from penelope.horms.nl (unknown [62.119.166.9])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6757725B73F;
        Mon, 18 Feb 2019 22:27:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1550489243; bh=eGiQNi8TPn8Yx8vbacBOQfprj4ZAZcfkjtn4kl7CV+g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=byU9vJc0C5y664mxP17ZTzVkFsgbHg2bJIPHh9Ax/KLwL0p63oUIAvhjQrur2yDb3
         sYfS6smaAyA1VkC6JMj6COOxVDnfnsKPGSvT/JFuEEoNMlrvxqGzGtZIhzBY3oFq5T
         kjX58RphN96LlhN6O/WzupyGYnzVT9ho/y/t4epY=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 53E8CE21807; Mon, 18 Feb 2019 12:27:15 +0100 (CET)
Date:   Mon, 18 Feb 2019 12:27:15 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Updates for v5.1
Message-ID: <20190218112715.zufzr3knrhs37t6h@verge.net.au>
References: <cover.1549622472.git.horms+renesas@verge.net.au>
 <CAK8P3a0prd-4eyVOVUpp2Bhn1mGOVZwA_we79TNjSa4FF5DP6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0prd-4eyVOVUpp2Bhn1mGOVZwA_we79TNjSa4FF5DP6A@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 15, 2019 at 05:49:32PM +0100, Arnd Bergmann wrote:
> On Fri, Feb 8, 2019 at 12:14 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> >
> > Hi Olof, Hi Kevin, Hi Arnd,
> >
> > Please consider these Renesas ARM based SoC updates for v5.1.
> >
> >
> > The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:
> >
> >   Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)
> >
> > are available in the git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-soc-for-v5.1
> >
> > for you to fetch changes up to 5347a0203709d5039a74d7c94e23519eee478094:
> >
> >   ARM: shmobile: Fix R-Car Gen2 regulator quirk (2019-01-07 13:24:07 +0100)
> >
> > ----------------------------------------------------------------
> > Renesas ARM Based SoC Updates for v5.1
> >
> > * Correct shared IRQ handling of R-Car Gen2 Regulator quirk
> > * Add missing dts files to MAINTAINERS
> 
> Should the bugfix be marked Cc:stable and and Fixes:... ?
> 
> Pulled into arm/soc, thanks!

Thanks,

Sorry for missing that, I think that the bugfix should have had the following.
Let me know if/how you want to handle updating the patch's changelog.

Fixes: 6d14d4d313d09dab ("ARM: shmobile: Rework the PMIC IRQ line quirk")
