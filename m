Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765D7C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 10:34:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E449217FA
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 10:34:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="agpq07cE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729847AbeLPKeT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 05:34:19 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:55607 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729732AbeLPKeS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 05:34:18 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2582A25BE0A;
        Sun, 16 Dec 2018 21:34:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544956456; bh=Hr0DI2dfvwyq3zqOyUZ0YbVIkdsXt40r1mtMkksx91E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=agpq07cEn/wcSsfGCEZDgd2RsQPNrIAJPFjVph37Pv+NyAzkgGZJJjRXEJbSXc9D8
         cR28uYry9D403gcJDdZ8aSHzbZD76Z508awuvk6f0YSIHgclKn1T45UqXnmijC30QO
         9IpaVGpHEb6P1Gj3jzleMjf0qmMYhGPn+YOqXqr0=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 37BD3E20E06; Sun, 16 Dec 2018 02:34:14 -0800 (PST)
Date:   Sun, 16 Dec 2018 11:34:14 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/6] pinctrl: sh-pfc: r8a7791: Remove bogus ctrl marks
 from qspi_data4_b group
Message-ID: <20181216103413.vyul65swjkr4lcyo@verge.net.au>
References: <20181213162855.14190-1-geert+renesas@glider.be>
 <20181213162855.14190-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213162855.14190-4-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 05:28:52PM +0100, Geert Uytterhoeven wrote:
> The qspi_data4_b_mux[] array contains pin marks for the clock and chip
> select pins.  The qspi_data4_b_pins[] array rightfully does not contain
> the corresponding pin numbers, as the control pins are provided by a
> separate group (qspi_ctrl_b).
> 
> Fixes: 2d0c386f135e4186 ("pinctrl: sh-pfc: r8a7791: Add QSPI pin groups")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


