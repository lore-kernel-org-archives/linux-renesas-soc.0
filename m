Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80147C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 09:01:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 426A820861
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 09:01:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="MTZerxsw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfAWJB0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 04:01:26 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:49767 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbfAWJBZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 04:01:25 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 849E925BDDE;
        Wed, 23 Jan 2019 20:01:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548234083; bh=607w01w33BYPZgWboYvpRv2z85tmmboHnER7aXbd6bM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MTZerxswHbtQ8mn5DOGyOvWluq/i+v6T1TSBjnkmQHR3XcFks6pC+VrIs0oo4MU8s
         UGimcmbijyneYrRp073L964Tj9/tXY0BouHLaB4gLsTv9W5qCKBG+S/iy4pt2psNuR
         S02gXG/xYyf28F1iNJhDbCq2R4XmwFC+PdCLfacQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 98BE9940471; Wed, 23 Jan 2019 10:01:21 +0100 (CET)
Date:   Wed, 23 Jan 2019 10:01:21 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 1/5] ARM: dts: r8a7743: Convert to new LVDS DT bindings
Message-ID: <20190123090120.rqrr6x4of6crflel@verge.net.au>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-2-git-send-email-biju.das@bp.renesas.com>
 <20190122171325.GC26166@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190122171325.GC26166@pendragon.ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 22, 2019 at 07:13:25PM +0200, Laurent Pinchart wrote:
> Hi Biju,
> 
> Thank you for the patch.
> 
> On Tue, Jan 22, 2019 at 03:25:45PM +0000, Biju Das wrote:
> > The internal LVDS encoder now has DT bindings separate from the DU. Port
> > the device tree over to the new model.
> > 
> > Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> 
> Sorry for the breakage. The DT and DU series raced each other, but I
> should have still caught it.
> 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I expect Simon to pick this up.

Thanks, applied as a fix for v5.0 as the fixes tag indicates the breakage
occurred in v4.17.
