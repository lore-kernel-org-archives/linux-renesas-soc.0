Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A978C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 09:34:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51F362087E
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 09:34:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="IANLPIc+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732008AbfCAJeh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 04:34:37 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:60502 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727697AbfCAJeh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 04:34:37 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1311F25B73F;
        Fri,  1 Mar 2019 20:34:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551432875; bh=dNTvYz8vTo8nnMdto3G+CsUluT5VhE31AYS9U+LRHKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IANLPIc+EjqnCZWfSrlbr4QNbt3bIeQCovGezaCpZCstWWYd6cyn6G1F35NXuiMCV
         Zw6lcGoj/ABe00kXzTL5F/v5+/i/uQA6xeGecsbYbbzIxMybHhN3sXa6+0OWB5piwR
         zCMVlVBznsU6xG/ywMs7husMHfYZ1Um/qXCdlZ28=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3BA80940421; Fri,  1 Mar 2019 10:34:33 +0100 (CET)
Date:   Fri, 1 Mar 2019 10:34:33 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: power: r8a77965: Remove non-existent
 A3IR power domain
Message-ID: <20190301093432.palahslxko5byvwh@verge.net.au>
References: <20190228105119.548-1-geert+renesas@glider.be>
 <TY1PR01MB1770F8D490EB33636F24954AC0750@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770F8D490EB33636F24954AC0750@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 28, 2019 at 11:36:28AM +0000, Fabrizio Castro wrote:
> > From: Geert Uytterhoeven <geert+renesas@glider.be>
> > Sent: 28 February 2019 10:51
> > Subject: [PATCH v2] dt-bindings: power: r8a77965: Remove non-existent A3IR power domain
> > 
> > The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
> > removed the A3IR power domain on R-Car M3-N, as this SoC does not have
> > an Image Processing Unit (IMP-X5).
> > 
> > As of commit d8c6557bc93be73e ("arm64: dts: renesas: r8a77965: Remove
> > non-existent IPMMU-IR"), this definition is no longer used from DT, and
> > thus can be removed.
> > 
> > Fixes: a527709b78b3c997 ("soc: renesas: rcar-sysc: Add R-Car M3-N support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks, applied for v5.2.
