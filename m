Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54778 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751127AbeA2IT5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jan 2018 03:19:57 -0500
Date: Mon, 29 Jan 2018 09:19:53 +0100
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 0/2] ARM: dts: r8a774[35]: sort subnodes of soc node
Message-ID: <20180129081953.u3olz55j4v464t5d@verge.net.au>
References: <20180126094052.17119-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180126094052.17119-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 26, 2018 at 10:40:50AM +0100, Simon Horman wrote:
> Sort the subnodes of the soc node to improve maintainability.
> The sort key is the address on the bus with instances of the same
> IP block grouped together and sorted alphabetically.
> 
> Minor whitespace and line-wrapping changes are also made
> to match the formatting of R-Car Gen2 SoCs.
> 
> This is part of an ongoing effort to improve consistency within and between
> the DT of Renesas SoCs to allow for easier comparison and maintenance.
> 
> This patch should not introduce any functional change.
> 
> Based on renesas-devel-20180123-v4.15-rc9

I have applied this series with Geert's reviewed-by tags.
