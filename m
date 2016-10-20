Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44656 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753511AbcJTJGS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Oct 2016 05:06:18 -0400
Date: Thu, 20 Oct 2016 10:58:04 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2] ARM: shmobile: Consolidate R8A7743 and R8A779[234]
 machine definitions
Message-ID: <20161020085804.GK4612@verge.net.au>
References: <1476712744-32619-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476712744-32619-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 17, 2016 at 04:59:04PM +0300, Laurent Pinchart wrote:
> The four SoCs use identical machine operations, consolidate them into
> two machine definitions in a single file.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since v1:
> 
> - Rebased on top of Simon's latest devel branch, thus including R8A7743
>   consolidation
> 
>  arch/arm/mach-shmobile/Makefile          |  4 ----
>  arch/arm/mach-shmobile/setup-r8a7743.c   | 34 -------------------------------
>  arch/arm/mach-shmobile/setup-r8a7792.c   | 35 --------------------------------
>  arch/arm/mach-shmobile/setup-r8a7793.c   | 33 ------------------------------
>  arch/arm/mach-shmobile/setup-r8a7794.c   | 33 ------------------------------
>  arch/arm/mach-shmobile/setup-rcar-gen2.c | 33 ++++++++++++++++++++++++++++++
>  6 files changed, 33 insertions(+), 139 deletions(-)
>  delete mode 100644 arch/arm/mach-shmobile/setup-r8a7743.c
>  delete mode 100644 arch/arm/mach-shmobile/setup-r8a7792.c
>  delete mode 100644 arch/arm/mach-shmobile/setup-r8a7793.c
>  delete mode 100644 arch/arm/mach-shmobile/setup-r8a7794.c

Thanks for this Laurent, its a very nice diffstat.
I have queued it up for v4.10.
