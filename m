Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41989 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750752AbeAPONG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jan 2018 09:13:06 -0500
Date: Tue, 16 Jan 2018 15:12:46 +0100
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 3/4] ARM: r8a7790: sort subnodes of soc node
Message-ID: <20180116141244.4dgsgofvil6iu2an@verge.net.au>
References: <20180116101330.21688-1-horms+renesas@verge.net.au>
 <20180116101330.21688-4-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180116101330.21688-4-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 16, 2018 at 11:13:29AM +0100, Simon Horman wrote:
> Sort the subnodes of the soc node to improve maintainability.
> The sort key is the addresss on the bus with instances of the same
> IP block grouped together.
> 
> This patch should not introduce any functional change.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Looking over this it seems I messed up the ordering of
qspi, msiof*, can*, and vin* nodes.
