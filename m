Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56107 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034780AbcKAJVx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2016 05:21:53 -0400
Date: Tue, 1 Nov 2016 10:21:45 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: r8a7794: remove Z clock
Message-ID: <20161101092144.GC28143@verge.net.au>
References: <1529351.Fac5N2tKoF@wasted.cogentembedded.com>
 <2289596.xFBEUD1OgK@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2289596.xFBEUD1OgK@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Oct 30, 2016 at 12:31:27AM +0300, Sergei Shtylyov wrote:
> R8A7794 doesn't have Cortex-A15 CPUs, thus there's no Z clock...
> 
> Fixes: 0dce5454d5c2 ("ARM: shmobile: Initial r8a7794 SoC device tree")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> The patch is against the 'master' branch of Simon Horman's 'renesas.git' repo.

Thanks, I have queued this up.
