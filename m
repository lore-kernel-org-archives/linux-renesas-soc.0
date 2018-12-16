Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98699C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 11:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AD4D217FB
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 11:03:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="QWgy5rnN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729861AbeLPLDd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 06:03:33 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:55853 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729822AbeLPLDd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 06:03:33 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E969225BDFF;
        Sun, 16 Dec 2018 22:03:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544958211; bh=M6QRiDnf/GIE3DTrVx1Z87gnZLGEyOl9UthpZmShYbM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QWgy5rnN2OAgVeVW6oJe3wLYr9Ph/OVP2h3KPwqN84s3y18oNVoTYidFZo1vgdEYk
         UKTZ1YFyHDsm1muYzKT/qWypLt39X+w6j6aZFyjKQuwDI6G8KUxkjjl6I1a36LXatY
         cGbZLaaBdKZBiF3xEucwTf372qL3GKXfneUej8SA=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id CEDF9E20F02; Sun, 16 Dec 2018 03:03:28 -0800 (PST)
Date:   Sun, 16 Dec 2018 12:03:28 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 6/6] pinctrl: sh-pfc: Validate pins/marks in pin group at
 build time
Message-ID: <20181216110327.pkixy52a6uxmwuao@verge.net.au>
References: <20181213162855.14190-1-geert+renesas@glider.be>
 <20181213162855.14190-7-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213162855.14190-7-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 05:28:55PM +0100, Geert Uytterhoeven wrote:
> Add a build-time check, to ensure the number of pins and pin marks in a
> pin group matches.  This helps catching bugs early.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

A very nice enhancement :)

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
