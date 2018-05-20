Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33174 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750800AbeETI6O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 May 2018 04:58:14 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r8a77995-draak: add X12 input dot clock
Date: Sun, 20 May 2018 11:58:36 +0300
Message-ID: <2229151.yue33o4Tiy@avalon>
In-Reply-To: <20180516083822.xfmmg7sybdn37cjr@verge.net.au>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1526386840-15368-6-git-send-email-ulrich.hecht+renesas@gmail.com> <20180516083822.xfmmg7sybdn37cjr@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

Thank you for the patch.

On Wednesday, 16 May 2018 11:38:22 EEST Simon Horman wrote:
> On Tue, May 15, 2018 at 02:20:40PM +0200, Ulrich Hecht wrote:
> > 74.25 Mhz oscillator X12 is connected to DU_DOTCLKIN0.
> > 
> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > ---
> > 
> >  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> 
> This looks fine but I will wait to see if there are other reviews before
> applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

As far as I'm concerned this patch can be merged already. I would however 
possibly hold off merging patch 3/5 and 4/5 until they can be tested.

-- 
Regards,

Laurent Pinchart
