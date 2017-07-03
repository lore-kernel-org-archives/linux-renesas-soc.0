Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57166 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752942AbdGCJNF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jul 2017 05:13:05 -0400
Date: Mon, 3 Jul 2017 11:03:23 +0200
From: Simon Horman <horms@verge.net.au>
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        catalin.marinas@arm.com, will.deacon@arm.com,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        chris.paterson2@renesas.com, geert+renesas@glider.be
Subject: Re: [PATCH] arm64: dts: r8a7795: Add DRIF support
Message-ID: <20170703090323.GA15426@verge.net.au>
References: <20170623091320.12664-1-ramesh.shanmugasundaram@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170623091320.12664-1-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 23, 2017 at 10:13:20AM +0100, Ramesh Shanmugasundaram wrote:
> Adds the DRIF controller nodes for r8a7795.
> 
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> ---
> Hi Simon,
> 
>    This patch is based on renesas-devel-20170622-v4.12-rc6 tag.
>    It is verified on both H3 ES1.1 and ES2.0 SoC revisions.
> 
>    The bindings[1] and the driver[2] were pushed into the media_tree.
> 
>    [1] https://git.linuxtv.org/media_tree.git/commit/?id=54a707ea011601f06cc5ef7fe6d0daac71ab0622
>    [2] https://git.linuxtv.org/media_tree.git/commit/?id=7625ee981af166ddb569e2e6c0006e2af471326f
> 
> Thanks,
> Ramesh.

Thanks for the reminder and sorry for letting this slip through.
I have queued this up for v4.14.
