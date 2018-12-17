Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCE0C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:07:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4E0C2133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:07:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="QJwAmcIP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbeLQOH3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:07:29 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:41392 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733044AbeLQOH3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:07:29 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D077625B781;
        Tue, 18 Dec 2018 01:07:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545055647; bh=LHJAEY0ESCTpU5C6FRH8SX31WOhW5A9981rxVZV2t7I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QJwAmcIPxrKWJrgFU08PR667Gm6NYBWFMLXde8//IqByy6oRGw1QtP0MPjiHch7Sf
         Im8h+eLnfganlRSB6dzQOO9HQHozBPpLfwvdtwL946lFQ8SKCxTFbVZiULRLdbkfQf
         q/MPrpErsO90pZ7xirSwKYJkWWdjf/nLaSbpEcuo=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DFEAD94048A; Mon, 17 Dec 2018 15:07:24 +0100 (CET)
Date:   Mon, 17 Dec 2018 15:07:24 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/15] pinctrl: sh-pfc: r8a77995: Remove bogus
 SEL_PWM[0-3]_3 configurations
Message-ID: <20181217140723.l76nsznmu7exzqha@verge.net.au>
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-7-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213182714.26094-7-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 07:27:05PM +0100, Geert Uytterhoeven wrote:
> While the SEL_PWM[0-3] fields in the Module Select Register 0 support 4

s/support/supports

> possible configurations per PWM pin, only the first 3 are valid.
> 
> Replace the invalid and unused configurations for SEL_PWM[0-3]_3 by
> dummies.
> 
> Fixes: 794a6711764658a1 ("pinctrl: sh-pfc: Initial R8A77995 PFC support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
