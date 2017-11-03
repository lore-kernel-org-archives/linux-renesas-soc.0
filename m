Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36525 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754682AbdKCIE7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Nov 2017 04:04:59 -0400
Date: Fri, 3 Nov 2017 09:04:39 +0100
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] ARM: dts: koelsch: Move cec_clock to root node
Message-ID: <20171103080438.2lxcheqyqrg6jfld@verge.net.au>
References: <20171102091805.24967-1-horms+renesas@verge.net.au>
 <14112514.nMv28tbzn2@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14112514.nMv28tbzn2@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 02, 2017 at 07:39:18PM +0200, Laurent Pinchart wrote:
> Hi Simon,
> 
> Thank you for the patch.
> 
> On Thursday, 2 November 2017 11:18:05 EET Simon Horman wrote:
> > cec-clock is a fixed clock generator that is not controlled by i2c5 and
> > thus should not be a child of the i2c5 bus node. Rather, it should be
> > a child of the root node of the DT.
> > 
> > Fixes: 02a5ab18d366 ("ARM: dts: koelsch: Add CEC clock for HDMI
> > transmitter") Reported-by: Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, applied.
