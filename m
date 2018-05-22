Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40629 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751420AbeEVMzr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 08:55:47 -0400
Date: Tue, 22 May 2018 14:55:43 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/03] arm64: dts: renesas: r8a77965: Add IPMMU devices
 nodes
Message-ID: <20180522125543.v2w4qf3xdmpxkp57@verge.net.au>
References: <152691388485.29667.16990860330809844193.sendpatchset@little-apple>
 <152691389327.29667.11748814522423573308.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <152691389327.29667.11748814522423573308.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 21, 2018 at 11:44:53PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Add IPMMU device nodes for the R-Car M3-N SoC aka r8a77965.
> 
> The r8a77965 IPMMU is quite similar to r8a7796 however VP0
> has been added and PV1 has been removed. Also the IMSSTR
> bit assignment has been reworked.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Developed on top of renesas-devel-20180518-v4.17-rc5
> 
>  The DT binding for the M3-N IPMMU has earlier been documented in:
>  [PATCH] iommu/ipmmu-vmsa: Document R-Car M3-N IPMMU DT bindings

This looks fine but I will wait to see if there are other reviews before
applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
