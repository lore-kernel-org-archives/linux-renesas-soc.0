Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675B8C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 11:03:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2BA39206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 11:03:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="NaQQM3pC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbeLQLD2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 06:03:28 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38586 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbeLQLD2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 06:03:28 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 23AC225B781;
        Mon, 17 Dec 2018 22:03:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545044606; bh=gPCtg/5VPpQP1JFBP8Uba4ZbuhOV0E1ZU6bLKzY3qKA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NaQQM3pCdkwZKeQbEx0/B6oaQ0PHPXaf3jG8qyvyj58tjAuCLju6sNR7QXOiIZFNC
         +cMd3WcseGs06qBUs5cKyzIAyGNS6naxTI52fQRnB717WiCaliJorRYsOiXMn446N/
         4k4Zf+JVU2/5HzFepyhWni2bwtZapA4i+vemMKfo=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 787CF94048A; Mon, 17 Dec 2018 12:03:24 +0100 (CET)
Date:   Mon, 17 Dec 2018 12:03:24 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 13/17] arm64: dts: renesas: r8a774c0: Connect RZ/G2E
 SYS-DMAC to IPMMU
Message-ID: <20181217110324.mzkdctwnngjolcgg@verge.net.au>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-14-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544780260-27590-14-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 14, 2018 at 09:37:36AM +0000, Fabrizio Castro wrote:
> Hook up SYS-DMAC0, SYS-DMAC1, and SYS-DMAC2 to IPMMU-DS0 and
> IPMMU-DS1, according to what reported by the RZ/G2 User's manual.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
