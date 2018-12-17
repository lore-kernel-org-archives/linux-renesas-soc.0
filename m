Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F76C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:48:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F5B6206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:48:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="h/zie7aI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbeLQNs1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 08:48:27 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40987 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbeLQNs0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 08:48:26 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4A85225B781;
        Tue, 18 Dec 2018 00:48:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545054504; bh=U+Snl03dk6/tw+rzfyg9UKmbSrqJ7ve115UNwqBEqG8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h/zie7aI/L6OdqsuJGqmvNqn0q9malZ3t7KIrg98SgN6lUISm11rQf6PnVEDvkCwG
         oOQ/STvo5eUUbVjOl/cqOpARtzeuEQE2S+SCjyQOoLnukG8ELZYD1qXQ1fTObxcoYs
         APa34j1xAM4XAYC82oD0F3hgvvLpPwbVnwcG51c0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 473A594048A; Mon, 17 Dec 2018 14:48:22 +0100 (CET)
Date:   Mon, 17 Dec 2018 14:48:22 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 03/15] pinctrl: sh-pfc: r8a779980: Add missing MOD_SEL0
 field
Message-ID: <20181217134821.ha3cexmm2cw762ip@verge.net.au>
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213182714.26094-4-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 07:27:02PM +0100, Geert Uytterhoeven wrote:
> The Module Select Register 0 contains 20 (= 5 x 4) reserved bits, and 12
> single-bit fields, but the variable field descriptor lacks a field of 4
> reserved bits.
> 
> Fixes: f59125248a691dfe ("pinctrl: sh-pfc: Add R8A77980 PFC support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
