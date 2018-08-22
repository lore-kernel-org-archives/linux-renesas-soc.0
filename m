Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50274 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbeHVOEr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 10:04:47 -0400
Date: Wed, 22 Aug 2018 12:40:23 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77965: Attach the SYS-DMAC to
 the IPMMU
Message-ID: <20180822104022.tyfctyfol73uyn7n@verge.net.au>
References: <153477467683.10333.4519731916058341587.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153477467683.10333.4519731916058341587.sendpatchset@octo>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 20, 2018 at 11:17:56PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> For R-Car M3-N hook up SYS-DMAC0, SYS-DMAC1 and SYS-DMAC2 to
> IPMMU-DS0 and IPMMU-DS1 in same way as for R-Car M3-W.
> This follows the R-Car Gen3 Rev.1.00 (April 2018) datasheet.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks Magnus,

applied for v4.20.
