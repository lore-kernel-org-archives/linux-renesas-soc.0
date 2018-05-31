Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55421 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754522AbeEaLjh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 May 2018 07:39:37 -0400
Date: Thu, 31 May 2018 07:39:29 -0400
From: Simon Horman <horms@verge.net.au>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: rmobile: Drop MTD partitioning from DT
Message-ID: <20180531113928.ep3eqvkm4wlyb4c2@verge.net.au>
References: <20180530101130.3566-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180530101130.3566-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 30, 2018 at 12:11:30PM +0200, Marek Vasut wrote:
> Drop the MTD partitioning from DT, since it does not describe HW
> and to give way to a more flexible kernel command line partition
> passing.
> 
> To retain the original partitioning, assure you have enabled
> CONFIG_MTD_CMDLINE_PARTS in your kernel config and add the
> following to your kernel command line:
> 
> lager:   mtdparts=spi0.0:256k(loader),4m(user),-(flash)
> stout:   mtdparts=spi0.0:512k(loader),256k(uboot),256k(uboot-env),-(flash)
> koelsch: mtdparts=spi0.0:512k(loader),5632k(user),-(flash)
> porter:  mtdparts=spi0.0:256k(loader_prg),4m(user_prg),-(flash_fs)
> wheat:   mtdparts=spi0.0:256k(loader),4m(user),-(flash)
> gose:    mtdparts=spi0.0:256k(loader),4m(user),-(flash)
> alt:     mtdparts=spi0.0:256k(loader),256k(system),-(user)
> silk:    mtdparts=spi0.0:256k(loader),4m(user),-(flash)
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be> on Koelsch
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Drop the @0 anchor from the commit message, use 4m
> V3: Squash the patches into one as requested by the higher ups

Thanks, applied.
