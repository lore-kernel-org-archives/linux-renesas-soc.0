Return-Path: <SRS0=tR/q=R4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70694C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 10:58:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3374120863
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 10:58:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="EGyfMD7+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730505AbfCYK6f (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Mar 2019 06:58:35 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36468 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729727AbfCYK6f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Mar 2019 06:58:35 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3FD1025BEDF;
        Mon, 25 Mar 2019 21:58:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553511513; bh=blavjPTsA5jDXtexhxDiZOkmotHn+OKVJeljJsF58CA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EGyfMD7+nBE9+TRdn5/5PWg0e+pSDwtEne6R8jYz0V9hf0e/72ZuH98VXcatxeLGD
         yu8czFYFkxQ9YLMsCjAB43ipUx5v1CV3V0W7HgAJMS37hSGHXiL+cUvikXfrtqTlnr
         +s4cfewCz6ddxO3Rb+uHdUCARkcSYvdxO6UU//wk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 8A330940563; Mon, 25 Mar 2019 11:58:31 +0100 (CET)
Date:   Mon, 25 Mar 2019 11:58:31 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 2/2] ARM: dts: iwg23s-sbc: Add HDMI support
Message-ID: <20190325105831.wjufmb3snarhgic7@verge.net.au>
References: <1552998099-22972-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1552998099-22972-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1552998099-22972-3-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 19, 2019 at 12:21:39PM +0000, Fabrizio Castro wrote:
> This patch adds HDMI video output support to the iwg23s board
> from iWave. Due to a problem with the bootloader not dealing
> with the configuration of one of the pins correctly, we have
> to use a gpio-hog for the interrupt line to make sure the pin
> is configured as GPIO-input when requesting the interrupt.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks Fabrizio, applied for v5.2.
