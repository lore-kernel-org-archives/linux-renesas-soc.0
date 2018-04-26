Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:55354 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753487AbeDZJ3d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 05:29:33 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 1/4] ARM: dts: renesas: r8a7790: Add FDP1 instances
Date: Thu, 26 Apr 2018 12:29:47 +0300
Message-ID: <3436484.5CPF3kj4Jb@avalon>
In-Reply-To: <20180423110713.klsakgblp4ud7umv@verge.net.au>
References: <20180422103528.3402-1-laurent.pinchart+renesas@ideasonboard.com> <20180422103528.3402-2-laurent.pinchart+renesas@ideasonboard.com> <20180423110713.klsakgblp4ud7umv@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Monday, 23 April 2018 14:07:14 EEST Simon Horman wrote:
> On Sun, Apr 22, 2018 at 01:35:25PM +0300, Laurent Pinchart wrote:
> > The r8a7790 has three FDP1 instances.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Hi Laurent,
> 
> could you rearrange these nodes so they preserve the sorting
> of sub-nodes of the soc node by bus address. The other patches
> in the series seem fine in this regards and I have applied them.

I would have if you hadn't merged the patch already :-) Would you like me to 
submit a follow-up patch ?

-- 
Regards,

Laurent Pinchart
