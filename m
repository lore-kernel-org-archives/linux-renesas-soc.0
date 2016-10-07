Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:47890 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753511AbcJGIdi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2016 04:33:38 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Horman <horms@verge.net.au>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 03/11] ARM: shmobile: r8a7743: basic SoC support
Date: Fri, 07 Oct 2016 11:33:33 +0300
Message-ID: <2345971.ESZSzve5jF@avalon>
In-Reply-To: <20161007031537.GK13721@verge.net.au>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com> <15557770.lH5aPepOeZ@wasted.cogentembedded.com> <20161007031537.GK13721@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,


On Friday 07 Oct 2016 12:15:37 Simon Horman wrote:
> On Thu, Oct 06, 2016 at 12:37:08AM +0300, Sergei Shtylyov wrote:
> > Add minimal support for the RZ/G1M (R8A7743) SoC.
> > 
> > Based on the original (and large) patch by Dmitry Shifrin
> > <dmitry.shifrin@cogentembedded.com>.
> > 
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks, I have queued this up.

I'd like to see this patch rebased on top of "[PATCH] ARM: shmobile: 
Consolidate R8A779[234] machine definitions".

-- 
Regards,

Laurent Pinchart
