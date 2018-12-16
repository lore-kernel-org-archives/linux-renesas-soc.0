Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B13C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 10:33:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 101D6217FA
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 10:33:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ap2zoKUI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729822AbeLPKdy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 05:33:54 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:55581 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729732AbeLPKdy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 05:33:54 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 60C5525BDFF;
        Sun, 16 Dec 2018 21:33:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544956431; bh=cnL6WWUZa5Sn4+Ofsv64tsgqFFjYwux4EAm4uBAi+6s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ap2zoKUIwG8k8FrcwwT4YAzA2dr4c+iCCT+xOKcgVw3NoJ4flT+f19/6Wh6DAlp5p
         IGcy4U2heQwy6IoiChFpcq1EP1iSm1byhsd9/piXvzIJYAdptIRRXfwISjJrHzemCN
         HTFVghDBQyYpmxpWbVyNrj1FbefwZZC4Yo5PRVsc=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id CE5F7E20E06; Sun, 16 Dec 2018 02:33:47 -0800 (PST)
Date:   Sun, 16 Dec 2018 11:33:47 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/6] pinctrl: sh-pfc: r8a7740: Add missing REF125CK pin
 to gether_gmii group
Message-ID: <20181216103343.t5g6k5mb7abagtuw@verge.net.au>
References: <20181213162855.14190-1-geert+renesas@glider.be>
 <20181213162855.14190-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213162855.14190-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 05:28:50PM +0100, Geert Uytterhoeven wrote:
> The gether_gmii_mux[] array contains the REF125CK pin mark, but the
> gether_gmii_pins[] array lacks the corresponding pin number.
> 
> Fixes: bae11d30d0cafdc5 ("sh-pfc: r8a7740: Add GETHER pin groups and functions")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

