Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFB1C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 09:02:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 57BCE20861
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 09:02:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="PFImybLZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbfAWJCp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 04:02:45 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:49792 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbfAWJCo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 04:02:44 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 36DCE25BEAC;
        Wed, 23 Jan 2019 20:02:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548234162; bh=SERwDHWDeYDoTmVs6ALU0X7vP4b7sH56OmvZAR3/AUc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PFImybLZNu0S6lWXgiGeYvWh/NUmkx7HY6dnkj7ZU+rt5pWXIFcTNVhy1ELK8EL1m
         1NNf1Q3QFywOz4q3XRUqlGFWMoExqWv+ItqIleLv4rJ8mPD73VSmMzBdt1zI12WgBZ
         oSgM2M61oCt02TtIo5wDPB99s4V44fCLexUP3joE=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 56B51940471; Wed, 23 Jan 2019 10:02:40 +0100 (CET)
Date:   Wed, 23 Jan 2019 10:02:40 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 4/5] ARM: dts: r8a7744: Add DU support
Message-ID: <20190123090239.2un7uavw3vwtguay@verge.net.au>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-5-git-send-email-biju.das@bp.renesas.com>
 <20190122170751.GB26166@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190122170751.GB26166@pendragon.ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 22, 2019 at 07:07:51PM +0200, Laurent Pinchart wrote:
> Hi Biju,
> 
> Thank you for the patch.
> 
> On Tue, Jan 22, 2019 at 03:25:48PM +0000, Biju Das wrote:
> > Add du node to r8a7744 SoC DT. Boards that want to enable the DU
> > need to specify the output topology.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I expect Simon to pick this up.

Thanks, applied for v5.1.
