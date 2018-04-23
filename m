Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45371 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754449AbeDWLHS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Apr 2018 07:07:18 -0400
Date: Mon, 23 Apr 2018 13:07:14 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 1/4] ARM: dts: renesas: r8a7790: Add FDP1 instances
Message-ID: <20180423110713.klsakgblp4ud7umv@verge.net.au>
References: <20180422103528.3402-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180422103528.3402-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180422103528.3402-2-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Apr 22, 2018 at 01:35:25PM +0300, Laurent Pinchart wrote:
> The r8a7790 has three FDP1 instances.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

could you rearrange these nodes so they preserve the sorting
of sub-nodes of the soc node by bus address. The other patches
in the series seem fine in this regards and I have applied them.
