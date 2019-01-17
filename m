Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E01C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 12:37:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB97420657
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 12:37:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="HakQnX1B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbfAQMh3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 07:37:29 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33099 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbfAQMh3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 07:37:29 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 86A6B25B760;
        Thu, 17 Jan 2019 23:37:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547728646; bh=GtuDrT4T5HX7MdWyidAer3/08a8OL1MEfnBuj5taq4M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HakQnX1BkygNWbfNU8Lp1brFi31pTlhMxtLM5IJIulFM7v/BmZkvByQM+oCFTRyDd
         Cqy/Qwd6uf9zfnZWZtujTd/5tVlMuZ+JZJXJgwuMMW6gntRHvx9ETUZJaGN64BNRvv
         6qPiMLEiDk1WkUT3oqY4pGLX3LMIdaVwN5QVQ7Dw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0201F940459; Thu, 17 Jan 2019 13:37:24 +0100 (CET)
Date:   Thu, 17 Jan 2019 13:37:24 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77965: Replace DU_DOTCLKIN2 by
 DU_DOTCLKIN3
Message-ID: <20190117123724.olrl2uj5cmk3uie6@verge.net.au>
References: <20190116131555.6337-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190116131555.6337-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 16, 2019 at 02:15:55PM +0100, Geert Uytterhoeven wrote:
> Unlike R-Car M3-W, R-Car M3-N does not have DU_DOTCLKIN2, but the
> corresponding pin carries the DU_DOTCLKIN3 signal.  Correct all
> references to DU_DOTCLKIN2 to fix this.
> 
> This change does not have any runtime effect, as it only changes an
> internal enum name, and a comment.
> 
> Fixes: 490e687eb8b274b5 ("pinctrl: sh-pfc: Initial R-Car M3-N support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> The comment for the bit in DRVCTRL12 was already correct.
> ---
> To be queued in sh-pfc-for-v5.1.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

