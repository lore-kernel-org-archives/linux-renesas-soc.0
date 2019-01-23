Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C3FC282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 09:03:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B335B20861
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 09:03:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Szv4Kg+J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbfAWJDl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 04:03:41 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:49822 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbfAWJDl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 04:03:41 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0FFF925BDDE;
        Wed, 23 Jan 2019 20:03:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548234219; bh=SdBFlOiCjsUdyP40NSmae9gaPdcNH7dOy161tV0ehxY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Szv4Kg+Jp20xkWKHd9A1N2pehfk3TVcu23Rvhh7qvHA7SZ1/NT4te0Rm9p1DOiVrh
         0u5gFvYNGMnQQt0s2ZFCOoaQk3R5XvdqAL9OqRdhPoPWT9/MYDTP/SvkaLzEAPt0+T
         mDDzX5KHydOl09Rw/0cQpzFFuYRa42wlp/NsNhpc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 38F3D940471; Wed, 23 Jan 2019 10:03:37 +0100 (CET)
Date:   Wed, 23 Jan 2019 10:03:37 +0100
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
Subject: Re: [PATCH v3 5/5] ARM: dts: r8a7744: Add LVDS support
Message-ID: <20190123090336.ji2d5zpzzo6iuaxq@verge.net.au>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-6-git-send-email-biju.das@bp.renesas.com>
 <20190122171411.GD26166@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190122171411.GD26166@pendragon.ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 22, 2019 at 07:14:11PM +0200, Laurent Pinchart wrote:
> Hi Biju,
> 
> Thank you for the patch.
> 
> On Tue, Jan 22, 2019 at 03:25:49PM +0000, Biju Das wrote:
> > Add LVDS encoder node to r8a7744 SoC DT.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I expect Simon to pick this up.

Thanks, applied for v5.1.
