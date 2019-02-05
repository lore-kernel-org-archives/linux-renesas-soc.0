Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68565C282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 15:01:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 374D9217F9
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 15:01:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="jXKkeO2z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728574AbfBEPBm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 10:01:42 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:51733 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbfBEPBm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 10:01:42 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C3B1A25B7E9;
        Wed,  6 Feb 2019 02:01:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549378900; bh=2iy/5AKve+LD+8UKF7ZygwkImrGURKFy7UtnGBxG8uA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jXKkeO2zPnbbUEjQ2X5jNBIG6rfGPjsv36x8ETvDFmzx6zZrLGDnODcAaeFpHB4xR
         hud3TjXa/YbLNh1W1PBl8pidceVNm8mmOqLnfepgMksbLeRrZUO3cMTpJR4Ho/ZKjt
         N0ul3A2nu0gITqqgFKCIo7NdxwKHTNBwi7HMxCB8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id EF211940486; Tue,  5 Feb 2019 16:01:37 +0100 (CET)
Date:   Tue, 5 Feb 2019 16:01:37 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: renesas: r8a774c0: Add CMT device
 nodes
Message-ID: <20190205150134.abuxualxl63k42ws@verge.net.au>
References: <1549272007-33471-1-git-send-email-biju.das@bp.renesas.com>
 <1549272007-33471-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1549272007-33471-3-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 04, 2019 at 09:20:04AM +0000, Biju Das wrote:
> This patch adds CMT{0|1|2|3} device nodes for r8a774c0 SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V1-->V2 No change

Thanks, applied for v5.1.
