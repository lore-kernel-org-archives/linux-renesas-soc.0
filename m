Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9D8C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:59:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CBAEC2133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:59:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="kaEFnmVf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732930AbeLQN7D (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 08:59:03 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:41063 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732257AbeLQN7B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 08:59:01 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id F2DCC25B781;
        Tue, 18 Dec 2018 00:58:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545055139; bh=crihpIo0QGFAceRpw+bB1Q7zIFuFtdWtd2UEG9RF2rs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kaEFnmVfKtRZM7cvXyXmHcciOgtfVMNhto+S6kDpBEcBEmzxZwR+rFplCP0TZGEri
         FPfBAK7QAwvFTt0hIBqBC/U/y6LjljcoLCxn/tBQ7uwBNBjwwjrvud3xVprdT4sut4
         Ky+kUzlW3l2ol9p7C3w0KNnZ2VXPdDiOKdwZS/Wk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 09A6494048A; Mon, 17 Dec 2018 14:58:56 +0100 (CET)
Date:   Mon, 17 Dec 2018 14:58:56 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 05/15] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL0 SEL_I2C1
 field width
Message-ID: <20181217135856.ppxujqr3t2zak3pn@verge.net.au>
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-6-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213182714.26094-6-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 07:27:04PM +0100, Geert Uytterhoeven wrote:
> The SEL_I2C1 (MOD_SEL0[21:20]) field in Module Select Register 0 has a
> width of 2 bits, i.e. it allows programming one out of 4 different
> configurations.
> However, the MOD_SEL0_21_20 macro contains 8 values instead of 4,
> overflowing into the subsequent fields in the register, and thus breaking
> the configuration of the latter.
> 
> Fix this by dropping the bogus last 4 values, including the non-existent
> SEL_I2C1_4 configuration.
> 
> Fixes: 6d4036a1e3b3ac0f ("pinctrl: sh-pfc: Initial R8A77990 PFC support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
