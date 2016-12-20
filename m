Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38931 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751399AbcLTLDz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Dec 2016 06:03:55 -0500
Date: Tue, 20 Dec 2016 12:03:48 +0100
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH renesas/devel 0/4] ARM, arm64: dts: Use R-Car fallback
 bindings for msiof nodes
Message-ID: <20161220110348.GL19532@verge.net.au>
References: <1482229959-25584-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1482229959-25584-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 20, 2016 at 11:32:35AM +0100, Simon Horman wrote:
> Hi,
> 
> this short series makes use of newly added R-Car fallback bindings in msiof
> nodes of the DTs for SoCs where the drivers in question are already used.
> 
> This should have no run-time effect at this time as the current driver
> implementations use the same initialisation sequences for SoC-specific and
> R-Car fallback bindings for all the cases covered by this patch-set.
> 
> Based on renesas-devel-20161212-v4.9
> 
> Simon Horman (4):
>   arm64: dts: r8a7796: Use R-Car Gen 3 fallback binding for msiof nodes
>   ARM: dts: r8a7791: Use R-Car Gen 2 fallback binding for msiof nodes
>   ARM: dts: r8a7792: Use R-Car Gen 2 fallback binding for msiof nodes
>   ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for msiof nodes

I have queued these up with Geert's Acks.
