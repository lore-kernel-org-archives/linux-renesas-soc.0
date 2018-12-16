Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BFEC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 20:43:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01C8420672
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 20:43:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="IqLJqjt6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730773AbeLPUnn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 15:43:43 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59179 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbeLPUnn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 15:43:43 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6850F25B764;
        Mon, 17 Dec 2018 07:43:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544993020; bh=uiALdOCIECW2d8LbLC2AUoeMK47aRwmCJ7rkBusi1vg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IqLJqjt6S4skCjI6v6BWwNREalQrzq0RlNjMdJQhAgTsy2174rym43NhvTaaMDlED
         /fbhAmRqmOppk6QiFyfuXmzKCUuuWHz4YTsy44ymt/Aoa2mBSCDJ7AzrxWHNSZx3KE
         XVQs2sXFdOm/zDYveHuTWHD4iUeFsXArV8fMPpoE=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 62EF8E2120F; Sun, 16 Dec 2018 12:43:38 -0800 (PST)
Date:   Sun, 16 Dec 2018 21:43:38 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 05/17] arm64: dts: renesas: r8a774c0: Add thermal support
Message-ID: <20181216204338.mb3a6aoen3typrom@verge.net.au>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544780260-27590-6-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 14, 2018 at 09:37:28AM +0000, Fabrizio Castro wrote:
> This patch adds the thermal device node and the thermal-zones
> node to the SoC specific dtsi for the RZ/G2E.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

