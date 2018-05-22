Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36233 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751240AbeEVInn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 04:43:43 -0400
Date: Tue, 22 May 2018 10:43:39 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] ARM: shmobile: rcar-gen2: Remove legacy SMP fallback
 code
Message-ID: <20180522084338.dk62ibxyi4mwmtby@verge.net.au>
References: <1526647734-1200-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526647734-1200-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 18, 2018 at 02:48:49PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> R-Car H2 and M2-W have been supporting SMP enablement from DT using the
> "renesas,apmu" enable-method since v4.8.  A legacy fallback was left in
> place for backwards compatibility with old DTBs.
> 
> This patch series removes the legacy SMP fallbacks for R-Car H2 and
> M2-W, and consolidates their support in the common R-Car Gen2 machine
> definition.
> 
> For testing, this series is available in the
> topic/rcar2-legacy-smp-removal-v1 branch of my renesas-drivers git
> repository at
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.
> 
> Thanks for applying!
> 
> Geert Uytterhoeven (5):
>   ARM: shmobile: r8a7790: Remove legacy SMP fallback code
>   ARM: shmobile: r8a7790: Use common R-Car Gen2 machine definition
>   ARM: shmobile: r8a7791: Remove legacy SMP fallback code
>   ARM: shmobile: r8a7791: Use common R-Car Gen2 machine definition
>   ARM: shmobile: Remove unused shmobile_smp_init_fallback_ops()

Thanks, applied for v4.19.
