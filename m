Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57459 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752603AbcJUHOj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2016 03:14:39 -0400
Date: Fri, 21 Oct 2016 09:14:31 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2] ARM: shmobile: Consolidate R8A7743 and R8A779[234]
 machine definitions
Message-ID: <20161021071431.GA11736@verge.net.au>
References: <1476712744-32619-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <20161020085804.GK4612@verge.net.au>
 <4b407584-21d4-5dc7-6866-6feff12f302f@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b407584-21d4-5dc7-6866-6feff12f302f@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 20, 2016 at 09:44:56PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 10/20/2016 11:58 AM, Simon Horman wrote:
> 
> >>The four SoCs use identical machine operations, consolidate them into
> >>two machine definitions in a single file.
> >>
> >>Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>Tested-by: Simon Horman <horms+renesas@verge.net.au>
> >>Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>---
> >>Changes since v1:
> >>
> >>- Rebased on top of Simon's latest devel branch, thus including R8A7743
> >>  consolidation
> >>
> >> arch/arm/mach-shmobile/Makefile          |  4 ----
> >> arch/arm/mach-shmobile/setup-r8a7743.c   | 34 -------------------------------
> >> arch/arm/mach-shmobile/setup-r8a7792.c   | 35 --------------------------------
> >> arch/arm/mach-shmobile/setup-r8a7793.c   | 33 ------------------------------
> >> arch/arm/mach-shmobile/setup-r8a7794.c   | 33 ------------------------------
> >> arch/arm/mach-shmobile/setup-rcar-gen2.c | 33 ++++++++++++++++++++++++++++++
> >> 6 files changed, 33 insertions(+), 139 deletions(-)
> >> delete mode 100644 arch/arm/mach-shmobile/setup-r8a7743.c
> >> delete mode 100644 arch/arm/mach-shmobile/setup-r8a7792.c
> >> delete mode 100644 arch/arm/mach-shmobile/setup-r8a7793.c
> >> delete mode 100644 arch/arm/mach-shmobile/setup-r8a7794.c
> >
> >Thanks for this Laurent, its a very nice diffstat.
> >I have queued it up for v4.10.
> 
>    I'm not seeing a new devel tag when fetching... :-(

Sorry about that. It should be there now.
