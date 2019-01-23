Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909B4C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 09:55:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C01620861
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 09:55:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LLAGiOtY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbfAWJzz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 04:55:55 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44822 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbfAWJzy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 04:55:54 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89F8A23D;
        Wed, 23 Jan 2019 10:55:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1548237352;
        bh=RfN1GNYp2dxfqUlAyfCK2KVIROgjFo3GCiHjbQnlLO8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LLAGiOtYG9h6abFwgULfmGOZXSW9JTzi8hndM2IDW574TTmXuv5qAKO8eQKoxNe7X
         hLgGTrwlT3RX5fZMSPnAxP5ZOTHAlC+R1IwRbe8b1sLWcxOxmVMQCOvWxeMfbCCa2g
         ibPqylMC9A3ecFGrpVegyt+CNWJEQqc3/xNs0wXA=
Date:   Wed, 23 Jan 2019 11:55:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Simon Horman <horms@verge.net.au>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: renesas: r8a77990: ebisu: Enable
 LVDS1 encoder
Message-ID: <20190123095552.GE4485@pendragon.ideasonboard.com>
References: <20190122225405.7815-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190122225405.7815-6-laurent.pinchart+renesas@ideasonboard.com>
 <20190123085656.5mgfcuv55efegrps@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190123085656.5mgfcuv55efegrps@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Wed, Jan 23, 2019 at 09:56:57AM +0100, Simon Horman wrote:
> On Wed, Jan 23, 2019 at 12:54:04AM +0200, Laurent Pinchart wrote:
> > The LVDS1 encoder must supply a pixel clock to the DU for the DPAD
> > output when the LVDS0 encoder is used. Enable it despite its output not
> > being connected.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Add a comment in the DT to explain why the LVDS1 encoder needs to be
> >   enabled.
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Please note that this will likely cause probe failures if applied
without the driver patches from this series. Would it be OK to merge the
DT changes through the DRM tree ?

-- 
Regards,

Laurent Pinchart
