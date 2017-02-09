Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46543 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751368AbdBINlN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2017 08:41:13 -0500
Date: Thu, 9 Feb 2017 14:40:21 +0100
From: Simon Horman <horms@verge.net.au>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/2] ARM: shmobile: Remove ARCH_SHMOBILE_MULTI
Message-ID: <20170209134020.GA20339@verge.net.au>
References: <1486635529-6636-1-git-send-email-geert+renesas@glider.be>
 <20170209105546.GI16056@verge.net.au>
 <SG2PR06MB1165BBFDAA507BB95DF0A2808A450@SG2PR06MB1165.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SG2PR06MB1165BBFDAA507BB95DF0A2808A450@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 09, 2017 at 01:12:24PM +0000, Chris Brandt wrote:
> Hi Simon and Geert,
> 
> On Thursday, February 09, 2017, Simon Horman wrote:
> > On Thu, Feb 09, 2017 at 11:18:47AM +0100, Geert Uytterhoeven wrote:
> > > 	Hi Simon, Magnus,
> > >
> > > This patch series completes the migration from ARCH_SHMOBILE_MULTI to
> > > ARCH_RENESAS, which was started by commit 9b5ba0df4ea4 ("ARM: shmobile:
> > > Introduce ARCH_RENESAS").
> > >
> > > Thanks for applying!
> > 
> > Thanks, nice to see this coming to an end.
> > 
> > I have queued up patch 1/2 in the dt-for-v4.12 branch.
> > 
> > I am of a mind to defer patch 2/2 because it looks like it should go in
> > the soc-for-v4.12 branch and I'd rather not add a dependency on the dt-
> > for-v4.12 branch for a cleanup.
> > 
> > In a perfect world we could have one branch to rule them all; we do not
> > live in that world.
> 
> 
> Out of curiosity, when will arch/arm/mach-shmobile and arch/arm/configs/shmobile_defconfig be renamed (if ever)??

There are no plans at this time.
I am happy to discuss a rename if there is a need for it.
