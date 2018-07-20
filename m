Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58425 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727133AbeGTJIc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 05:08:32 -0400
Date: Fri, 20 Jul 2018 10:21:21 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: Include R-Car product name in DTSI
 files
Message-ID: <20180720082121.nzumwrotoqla7aie@verge.net.au>
References: <153199919069.10140.15895581107478774899.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153199919069.10140.15895581107478774899.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 19, 2018 at 08:19:50PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Browsing the DTS for all the R-Car SoCs with similar part numbers
> makes my head hurt, so to improve the user friendliness of the
> DTS code base include R-Car product name in each DTSI file.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks Magnus,

I'm glad to hear its not just me!  This looks good but I will wait to see
if there are other reviews before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
