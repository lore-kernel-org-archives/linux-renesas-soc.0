Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 642B7C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 10:57:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A559206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 10:57:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="KtmOwUPp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbeLQK5y (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 05:57:54 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38532 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbeLQK5y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 05:57:54 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1876825B781;
        Mon, 17 Dec 2018 21:57:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545044272; bh=bUgUNWg9mwQJy7Bm+h44KmPYWvc3bNgGZuDt1tyYYjs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KtmOwUPpuj4x5TkznJGpIcaOySx2gx7JFmc+gS5/HqIMCx3Ow1lSzZNnDCnTWdp8+
         tdLYApPp6j2FuMuCxjuo9cqPjZLMsRCs1znMSpN73lJoA3kL62jAv8wcqJwuI8RmCv
         qzETvuy9vtDitrxMAcYuwf8mVeDO1su2rXeEkzoc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6AAED94048A; Mon, 17 Dec 2018 11:57:50 +0100 (CET)
Date:   Mon, 17 Dec 2018 11:57:50 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 12/17] arm64: dts: renesas: r8a774c0: Add USB3.0 device
 nodes
Message-ID: <20181217105750.prijc3yvvsi3m3ne@verge.net.au>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-13-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544780260-27590-13-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 14, 2018 at 09:37:35AM +0000, Fabrizio Castro wrote:
> Add usb3.0 host and function device nodes to the RZ/G2E SoC dtsi.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
