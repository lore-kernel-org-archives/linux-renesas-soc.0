Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58375 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727572AbeGTJFI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 05:05:08 -0400
Date: Fri, 20 Jul 2018 10:17:57 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: Attach the SYS-DMAC to
 the IPMMU
Message-ID: <20180720081757.xo3dw62y76wavckm@verge.net.au>
References: <153199952510.10548.10726518369494565858.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153199952510.10548.10726518369494565858.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 19, 2018 at 08:25:25PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Hook up SYS-DMAC0, SYS-DMAC1 and SYS-DMAC2 to IPMMU-DS0 and IPMMU-DS1
> following the R-Car Gen3 Rev.1.00 (April 2018) datasheet.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks Magnus,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
