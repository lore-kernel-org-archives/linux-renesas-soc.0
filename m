Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40800 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751192AbeEVNMr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 09:12:47 -0400
Date: Tue, 22 May 2018 15:12:43 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 03/03] arm64: dts: renesas: r8a77990: Add IPMMU devices
 nodes
Message-ID: <20180522131243.u2stod67gfdx4epy@verge.net.au>
References: <152691388485.29667.16990860330809844193.sendpatchset@little-apple>
 <152691391024.29667.17698981264851738340.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <152691391024.29667.17698981264851738340.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 21, 2018 at 11:45:10PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Add IPMMU device nodes for the R-Car E3 SoC aka r8a77990.
> 
> The r8a77990 IPMMU is similar to r8a77995. Power domains are
> however different but the documentation seems unclear.
> 
> As expected VC0 belongs to R8A77990_PD_A3VC however VP0
> is for now assigned to R8A77990_PD_ALWAYS_ON even though
> the IPMMU data sheet lists it as part of A3VP.
> 
> What I can tell A3VP is not implemented on E3 so the data
> sheet probably needs an update.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Developed on top of renesas-devel-20180518-v4.17-rc5
> 
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi |   82 +++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)

This looks fine but I will wait to see if there are other reviews before
applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
