Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33986 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751295AbeCNMne (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Mar 2018 08:43:34 -0400
Date: Wed, 14 Mar 2018 13:43:30 +0100
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: Re: [PATCH v7] ARM: shmobile: Add watchdog support
Message-ID: <20180314124330.75xbinatpekhm576@verge.net.au>
References: <CAMuHMdVRxTCG0vCEEmhHm4XsZeJaPM1b_LOeZxqNdhRqsH0oZw@mail.gmail.com>
 <1521026033-8494-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521026033-8494-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 14, 2018 at 11:13:53AM +0000, Fabrizio Castro wrote:
> On R-Car Gen2 and RZ/G1 platforms, we use the SBAR registers to make non
> boot CPUs run a routine designed to bring up SMP and deal with hot plug.
> The value contained in the SBAR registers is not initialized by a WDT
> triggered reset, which means that after a WDT triggered reset we jump
> to the SMP bring up routine, preventing the system from executing the
> bootrom code.
> 
> The purpose of this patch is to jump to the bootrom code in case of a
> WDT triggered reset, and keep the SMP functionality untouched.
> In order to tell if the code had been called due to the WDT overflowing
> we are testing WOVF from register RWTCSRA.
> 
> The new function shmobile_boot_vector_gen2 isn't replacing
> shmobile_boot_vector for backward compatibility reasons. The kernel
> will install the best option (either shmobile_boot_vector or
> shmobile_boot_vector_gen2) to ICRAM1 after parsing the device tree,
> according to the amount of memory available.
> 
> Since shmobile_boot_vector has become bigger, "reg" property of nodes
> compatible with "renesas,smp-sram" now need to be set to a value
> greater or equal to "<0 0x60>".
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v6->v7:
> * restored ifdef within arch/arm/mach-shmobile/headsmp.S

Thanks. I believe that this is the same as the hand modified
version of v5 that I applied yesterday.
