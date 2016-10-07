Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39389 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753224AbcJGFwD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2016 01:52:03 -0400
Date: Fri, 7 Oct 2016 14:51:57 +0900
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] ARM: shmobile: Consolidate R8A779[234] machine
 definitions
Message-ID: <20161007055156.GC5855@verge.net.au>
References: <1475663489-4789-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <18001316.v0q3v65y95@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18001316.v0q3v65y95@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 05, 2016 at 04:51:26PM +0300, Laurent Pinchart wrote:
> On Wednesday 05 Oct 2016 13:31:29 Laurent Pinchart wrote:
> > The three SoCs use the exact same machine definition, consolidate them
> > into a single one.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  arch/arm/mach-shmobile/Makefile          |  3 ---
> >  arch/arm/mach-shmobile/setup-r8a7792.c   | 35
> > -------------------------------- arch/arm/mach-shmobile/setup-r8a7793.c   |
> > 33 ------------------------------ arch/arm/mach-shmobile/setup-r8a7794.c  
> > | 33 ------------------------------
> > arch/arm/mach-shmobile/setup-rcar-gen2.c | 20 ++++++++++++++++++
> >  5 files changed, 20 insertions(+), 104 deletions(-)
> >  delete mode 100644 arch/arm/mach-shmobile/setup-r8a7792.c
> >  delete mode 100644 arch/arm/mach-shmobile/setup-r8a7793.c
> >  delete mode 100644 arch/arm/mach-shmobile/setup-r8a7794.c
> > 
> > I don't have access to any R8A779[234] board, I'd appreciate if someone
> > could test the patch series.

I have tested this on an r8a7793/gose and r8a7794/alt.

Tested-by: Simon Horman <horms+renesas@verge.net.au>
