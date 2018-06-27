Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34641 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752437AbeF0PJl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jun 2018 11:09:41 -0400
Date: Wed, 27 Jun 2018 17:09:37 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: rcar-gen2: Stop compiling headsmp-apmu on
 !SMP
Message-ID: <20180627150936.xwbsppxcewg5qsow@verge.net.au>
References: <20180619172049.20089-1-geert+renesas@glider.be>
 <20180620085618.dy5vnlhxiajppryy@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180620085618.dy5vnlhxiajppryy@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 20, 2018 at 10:56:19AM +0200, Simon Horman wrote:
> On Tue, Jun 19, 2018 at 07:20:49PM +0200, Geert Uytterhoeven wrote:
> > As of commit cad160ed0a94927e ("ARM: shmobile: Convert file to use
> > cntvoff"), there's no non-SMP code left in headsmp-apmu.S.
> > 
> > Hence build the file for SMP only, and drop the no longer needed check
> > for CONFIG_SMP inside the file.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks Geert,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, applied.
