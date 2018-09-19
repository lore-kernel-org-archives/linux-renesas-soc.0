Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42503 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726972AbeISNxe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 09:53:34 -0400
Date: Wed, 19 Sep 2018 10:16:44 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: Attach the SYS-DMAC to
 the IPMMU
Message-ID: <20180919081643.ddgcs6ve7hqphexm@verge.net.au>
References: <153717438596.643.1467359690364003439.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153717438596.643.1467359690364003439.sendpatchset@octo>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 17, 2018 at 05:53:05PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm@opensource.se>
> 
> For R-Car V3H hook up SYS-DMAC1 and SYS-DMAC2 to IPMMU-DS1 to match
> information in the R-Car Gen3 Rev.1.00 (April 2018) datasheet.
> 
> Signed-off-by: Magnus Damm <damm@opensource.se>

Thanks Magnus,

applied for v4.20.
