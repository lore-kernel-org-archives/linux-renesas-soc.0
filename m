Return-Path: <SRS0=TeIC=SU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283AAC10F0B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 18 Apr 2019 05:51:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2AFD21479
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 18 Apr 2019 05:51:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DZ8fTBmg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbfDRFvu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 18 Apr 2019 01:51:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57678 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfDRFvu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Apr 2019 01:51:50 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61217306;
        Thu, 18 Apr 2019 07:51:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1555566707;
        bh=ySJTmIQXKGITtfDRgSS/woOrjQ9F+gtUTqD/RdkSzRo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DZ8fTBmgROByRPMSyc6p0k7lpb00YG1DxY2x28L64DxJ3X5Qzq4GYVuIh4wCuRldY
         kdTKAwKyzz2fNrOFabVRm658zbDOdEoInwK/72lZHfKNy+NDkmdmUfSvxnaRPd6pHJ
         A4bwcV3xEHAKQQqRrOcPP4uay7XIA5695tI8cBso=
Date:   Thu, 18 Apr 2019 08:51:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH V2 0/4] Add RZ/G2M DU support
Message-ID: <20190418055138.GA4806@pendragon.ideasonboard.com>
References: <1555072685-59276-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1555072685-59276-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patches.

On Fri, Apr 12, 2019 at 01:38:01PM +0100, Biju Das wrote:
> This patch series aims to add binding/driver support for
> R8A774A1(a.k.a RZ/G2M) DU (which is very similar to the R8A7796 DU);
> it has one RGB output, one LVDS output and one HDMI output.
> 
> This patchset is based on linux_next next-20190411 branch.
> 
> V1-->V2
>   * Incorporated Kieran's review comment.
>     (https://patchwork.kernel.org/patch/10896165/)
> 
> Biju Das (4):
>   dt-bindings: display: renesas: du: Document the r8a774a1 bindings
>   dt-bindings: display: renesas: lvds: Document r8a774a1 bindings
>   drm: rcar-du: Add R8A774A1 support
>   drm: rcar-du: lvds: Add r8a774a1 support

For the whole series,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I've taken it to my tree and will submit a pull request.

>  .../bindings/display/bridge/renesas,lvds.txt       |  1 +
>  .../devicetree/bindings/display/renesas,du.txt     |  2 ++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c              | 30 ++++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                |  1 +
>  4 files changed, 34 insertions(+)

-- 
Regards,

Laurent Pinchart
