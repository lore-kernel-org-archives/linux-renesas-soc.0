Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44663 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754500AbeDWK1E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Apr 2018 06:27:04 -0400
Date: Mon, 23 Apr 2018 12:26:59 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] arm64: dts: renesas: r8a779xx: sort nodes
Message-ID: <20180423102658.ezofcrgzzwvzdfor@verge.net.au>
References: <1524082480-18163-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524082480-18163-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 19, 2018 at 05:14:35AM +0900, Yoshihiro Kaneko wrote:
> Sort nodes of the R-Car M3-N (r8a77965), V3M (r8a77970) and D3 (r8a77995) DTs.
> 
> This is part of an ongoing effort to provide consistent node
> order in the DT of Renesas SoCs to improve maintainability.
> 
> This should not have any run-time effect.
> 
> Based on the devel branch of Simon Horman's renesas tree.
> 
> Yoshihiro Kaneko (5):
>   arm64: dts: renesas: r8a77995: sort subnodes of the root node
>   arm64: dts: renesas: r8a77995: sort subnodes of the soc node
>   arm64: dts: renesas: r8a77965: sort subnodes of the root node
>   arm64: dts: renesas: r8a77965: sort subnodes of the soc node
>   arm64: dts: renesas: r8a77970: sort subnodes of the soc node

Thanks, applied.

There ware a few nodes added to r8a77970 between when you made
this patchset and when I applied it. I think the r8a77970 is still
sorted as desired. Could you double-check once I push a devel
branch later today?
