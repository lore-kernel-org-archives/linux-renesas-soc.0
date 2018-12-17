Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A8B7C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:38:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B17E20874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:38:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="dgW+53nH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbeLQNiN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 08:38:13 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40832 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbeLQNiN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 08:38:13 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id DDCDE25B7CF;
        Tue, 18 Dec 2018 00:38:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545053891; bh=lVqvCqKxLL30iOhJjHBaKZXsFJT84pRnhEKC7cN+L0E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dgW+53nH33k1NEVRIu/TkZ3U57o2HxX5P7MNYGG4wypGlGYP77DBC7WsXLQhsIHJx
         Ms3jJc9yuWsVxlmOAs7oX1EKA17EiglNnuB1YCmwQCdYl957vS7jt1jq87rqOBQ1g3
         TNGmFpLBpb1prdA5KGaIk3N1vjNgKYA9o/8QwvIg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E28F494048A; Mon, 17 Dec 2018 14:38:08 +0100 (CET)
Date:   Mon, 17 Dec 2018 14:38:08 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 01/15] pinctrl: sh-pfc: r8a77994: Remove bogus IPSR9 field
Message-ID: <20181217133808.6pxaudvjh5y7u2vq@verge.net.au>
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213182714.26094-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 07:27:00PM +0100, Geert Uytterhoeven wrote:
> The Peripheral Function Select Register 9 contains 12 fields, but the
> variable field descriptor contains a 13th bogus field of 3 bits.
> 
> Fixes: 43c4436e2f1890a7 ("pinctrl: sh-pfc: add R8A7794 PFC support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

