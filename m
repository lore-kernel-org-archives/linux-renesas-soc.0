Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D41C282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 15:06:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8959217D6
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 15:06:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="p8XiMIQF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbfBEPGQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 10:06:16 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:51791 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbfBEPGQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 10:06:16 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 43CF625B7E9;
        Wed,  6 Feb 2019 02:06:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549379174; bh=LeLZe8g9TiZ6aP6gJd3vCX9BxBFHEgPTfA+816a9pac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p8XiMIQFlOdGBEbjLxQU16P3qjmLF9I7SMf4i7FA9F0Hwuvc5b3D5I14l81dlW/jk
         f4h9RJ4JB+K24BCl+sGENMuQaKM4Tc4FmZt9jl6RYD3SqAj7hY4Ya2Vjb/0ZEcZiSs
         hN6xwlZRCpxRw2MZkTx413EAOwJiYtnA8OIKk7X0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6B330940486; Tue,  5 Feb 2019 16:06:12 +0100 (CET)
Date:   Tue, 5 Feb 2019 16:06:12 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: renesas: r8a774c0: Add TMU device
 nodes
Message-ID: <20190205150612.7ac5xns67gkzi3ii@verge.net.au>
References: <1549272007-33471-1-git-send-email-biju.das@bp.renesas.com>
 <1549272007-33471-6-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1549272007-33471-6-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 04, 2019 at 09:20:07AM +0000, Biju Das wrote:
> This patch adds TMU{0|1|2|3|4} device nodes for r8a774c0 SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V1-->V2 No change

Thanks, applied for v5.1
