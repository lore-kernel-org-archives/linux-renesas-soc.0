Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42201 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751668AbcLFMkJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Dec 2016 07:40:09 -0500
Date: Tue, 6 Dec 2016 13:39:13 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] ARM: shmobile: R-Car Gen2: Allow booting
 secondary CPU cores in debug mode
Message-ID: <20161206123854.GA10942@verge.net.au>
References: <1480934381-32126-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480934381-32126-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 05, 2016 at 11:39:36AM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series allows booting secondary CPU cores on R-Car Gen2 when
> hardware debug mode is enabled. In this mode, reset requests derived
> from power-shutoff to the AP-system CPU cores must be enabled before the
> AP-system CPU cores resume from power-shutoff for the first time.
> Else resume may fail, causing the system to hang during boot.
> Currently we avoid the hang by prohibiting booting secondary CPU cores
> when hardware debug mode is enabled (except on legacy r8a7790, see
> below).
> 
> On all R-Car Gen2 SoCs, hardware debug mode is enabled by setting
> MD21=1.  On both Koelsch and Lager, this is done by setting mode switch
> SW8-4 to OFF.
> 
> Unfortunately the hang is not easy to reproduce: I only saw it (on
> Koelsch) during real cold boot (power off during the night), and even
> then it's not guaranteed to trigger. Pressing the reset button
> afterwards recovers the system, and a subsequent boot will succeed
> (incl. secondary CPU core boot).
> 
> This series configures the reset requests as documented in the R-Car
> Gen2 datasheet, and removes the check for MD21 during secondary CPU
> bringup.  It was inspired by CPU-specific patches in the BSP by
> Nakamura-san.
> 
> And finally, we get rid of reading the Mode Monitoring register using
> hardcoded addresses in platform code!
> 
> This series also fixes a minor regression introduced by adding the
> "renesas,apmu" enable-method on Lager, where secondary CPU cores are no
> longer available when hardware debug mode is enabled.
> 
> This has been boot-tested on r8a7791/koelsch (both debug mode and normal
> mode), on r8a7790/lager, r8a7792/blanche, and r8a7793/gose (normal mode
> only), and on r8a7794/alt (normal mode UP only).  Its core parts have
> been in renesas-drivers since renesas-drivers-2016-09-06-v4.8-rc5.
> 
> Changes compared to v1:
>   - Add Tested-by,
>   - New patch "ARM: shmobile: rcar-gen2: Remove unused
>     rcar_gen2_read_mode_pins()".
> 
> This series is against renesas-devel-20161202-v4.9-rc7, with my
> "rcar-rst" branch merged in, which resulted in a merge conflict.
> The latter dependency is present in clk-next, and expected to land
> upstream in v4.10-rc1.
> 
> For your convenience (and for conflict resolution), this series is also
> available in the topic/rcar-secondary-booting-in-debug-mode-v2 branch of
> my renesas-drivers git repository at
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> 
> Thanks for applying!

Thanks, I have tentatively queued this up for v4.11.

I have pulled in the rcar-rst dependency with the expectation ttha
it will disappear when I rebase on v4.10-rc1 once it has been released.
