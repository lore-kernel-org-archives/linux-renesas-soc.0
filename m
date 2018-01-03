Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:40912 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751021AbeACRiE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jan 2018 12:38:04 -0500
Received: by mail-lf0-f66.google.com with SMTP id u84so2448753lff.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jan 2018 09:38:03 -0800 (PST)
Date: Wed, 3 Jan 2018 18:38:01 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: r8a779[56]: Add OPPs table for cpu
 devices
Message-ID: <20180103173801.GF22490@bigcity.dyn.berto.se>
References: <20180103124105.1999-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180103124105.1999-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

Thanks for your work.

I tested these patches together with the dependencies of the 
topic/rcar-gen3-cpufreq-v4 branch, feel free to add to all patches in 
this series.

Tested-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

On 2018-01-03 13:41:02 +0100, Simon Horman wrote:
> These are dependencies for supporting CPUFreq. The remainder of that
> work is being posted separately and can be found at:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/rcar-gen3-cpufreq-v4
> 
> 
> Patch 1: Cleanup of DTS, only related as its an apply-time conflict
> Patches 2 & 3: Add OPPs
> 
> Changes since v2:
> * Preserve alphabetical order of sub-nodes of root node
> * Do not provide unit name for opps, they have no base address
> * Describe clock dependency for all CPU cores
> 
> Changes since v1:
> * Only provide one operating points node for each operating-points-v2 node
>   as per the binding; other nodes were unused and have been removed
> 
> A description of steps taken to lightly exercise the same feature for the
> r8a7795 the above can be found at the link below. The results are the same
> for the r8a7796 with the exception that it has two active CPU cores rather
> than four.
> 
> http://elinux.org/Tests:R-CAR-GEN3-CPUFreq
> 
> 
> Dien Pham (2):
>   arm64: dts: renesas: r8a7795: Add OPPs table for cpu devices
>   arm64: dts: renesas: r8a7796: Add OPPs table for cpu devices
> 
> Simon Horman (1):
>   arm64: dts: renesas: r8a7795: move scif node into alphabetical order
> 
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 71 +++++++++++++++++++++++++++++---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 62 ++++++++++++++++++++++++++++
>  2 files changed, 128 insertions(+), 5 deletions(-)
> 
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas S�derlund
