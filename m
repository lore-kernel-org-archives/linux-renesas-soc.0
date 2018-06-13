Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36703 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934677AbeFMLS1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 07:18:27 -0400
Date: Wed, 13 Jun 2018 13:18:23 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 3/3] ARM: shmobile: convert to SPDX identifier
Message-ID: <20180613111823.pfg3jggd7dvflvpw@verge.net.au>
References: <20180611144937.9554-1-wsa+renesas@sang-engineering.com>
 <20180611144937.9554-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180611144937.9554-4-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 11, 2018 at 11:49:37PM +0900, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  arch/arm/include/debug/renesas-scif.S              |  5 +----
>  arch/arm/mach-shmobile/headsmp-apmu.S              |  5 +----
>  arch/arm/mach-shmobile/platsmp-apmu.c              |  5 +----
>  arch/arm/mach-shmobile/platsmp-apmu.h              | 10 +---------
>  arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 10 +---------
>  arch/arm/mach-shmobile/setup-emev2.c               | 10 +---------
>  arch/arm/mach-shmobile/setup-r7s72100.c            | 10 +---------
>  arch/arm/mach-shmobile/setup-r8a73a4.c             | 10 +---------
>  arch/arm/mach-shmobile/setup-r8a7740.c             | 10 +---------
>  arch/arm/mach-shmobile/setup-r8a7778.c             | 10 +---------
>  arch/arm/mach-shmobile/setup-r8a7779.c             | 10 +---------
>  arch/arm/mach-shmobile/setup-r8a7790.c             | 10 +---------
>  arch/arm/mach-shmobile/setup-r8a7791.c             | 10 +---------
>  arch/arm/mach-shmobile/setup-rcar-gen2.c           | 10 +---------
>  arch/arm/mach-shmobile/setup-sh73a0.c              | 10 +---------
>  arch/arm/mach-shmobile/smp-emev2.c                 | 10 +---------
>  arch/arm/mach-shmobile/smp-r8a7779.c               | 10 +---------
>  arch/arm/mach-shmobile/smp-r8a7790.c               | 10 +---------
>  arch/arm/mach-shmobile/smp-r8a7791.c               | 10 +---------
>  19 files changed, 19 insertions(+), 156 deletions(-)

This does not apply cleanly on top of renesas-devel-20180608-v4.17.

Please rebase.
