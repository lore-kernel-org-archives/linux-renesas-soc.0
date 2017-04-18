Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38934 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932186AbdDRHar (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 03:30:47 -0400
Date: Tue, 18 Apr 2017 16:30:42 +0900
From: Simon Horman <horms@verge.net.au>
To: Tejun Heo <tj@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>, linux-ide@vger.kernel.org,
        Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Subject: Re: [PATCH/RFT] sata: rcar_sata: Reset SATA PHY on resume
Message-ID: <20170418073042.GB16340@verge.net.au>
References: <1492498973-2969-1-git-send-email-horms+renesas@verge.net.au>
 <20170418071738.GD3899@wtj.duckdns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170418071738.GD3899@wtj.duckdns.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 18, 2017 at 04:17:38PM +0900, Tejun Heo wrote:
> On Tue, Apr 18, 2017 at 04:02:53PM +0900, Simon Horman wrote:
> > In the case where power is cut on suspend the SATA PHY state needs to be
> > suspended on resume.
>   ^
>   re-initialized?

Yes, sorry for the think-o.

> > This is the case on the Salvator-X board with the r8a7795 or r8a7796 SoC.
> > In that environment it has been observed that SATA partitions cannot not be
> > accessed on resume.
> > 
> > Based on work by Khiem Nguyen.
> > 
> > Cc: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > * Compile and boot tested only
> 
> Can somebody verify this fix?

Yes, I should be able to do so but I need to set up the appropriate
hardware environment first. I would, of course, welcome verification by
others.
