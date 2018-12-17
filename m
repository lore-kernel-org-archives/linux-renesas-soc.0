Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D47C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:04:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35C8E2133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:04:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="H1qydLhU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732641AbeLQOEB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:04:01 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:41192 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732476AbeLQOEA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:04:00 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0275F25B7CF;
        Tue, 18 Dec 2018 01:03:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545055438; bh=b+yXJIhn2sMAgFgRjspHm6AGBPS92yBEMYphlRJ59m8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H1qydLhUugurXunvhTU5h4gFrY6Ku1gDExAMPti93W3kQv/aIRz9zFz+zXWjYpI8l
         sPCogoqTIGsJuRJh06HaYWxNBKU57vHs8zitp9InEci0Gt7epK/YiqH6SUg7h4Pbrb
         I1baGZFYhQ/Tz6wfnHdu2oojCPRet/0vo9W+PCEM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0E5FC94048A; Mon, 17 Dec 2018 15:03:55 +0100 (CET)
Date:   Mon, 17 Dec 2018 15:03:55 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 04/15] pinctrl: sh-pfc: sh7734: Add missing IPSR11 field
Message-ID: <20181217140355.rthk7ydbwskb5o7h@verge.net.au>
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-5-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213182714.26094-5-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 07:27:03PM +0100, Geert Uytterhoeven wrote:
> The Peripheral Function Select Register 11 contains 3 reserved bits and
> 15 variable-width fields, but the variable field descriptor does not
> contain the 3-bit field IP11[25:23].
> 
> Fixes: 856cb4bb337ee504 ("sh: Add support pinmux for SH7734")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
