Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77F0C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 12:48:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8948E20851
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 12:48:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="SMeTvd1D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfAQMsz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 07:48:55 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33336 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfAQMsz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 07:48:55 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 49CAD25B7E8;
        Thu, 17 Jan 2019 23:48:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547729332; bh=H/d/2b4moNEpS85UTeBB/KMpIeaZsNbMzq0jicdKJkE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SMeTvd1DnjXTQ6s+XI0+zVqDn0qWbyVLJNQPwXXNzOj7ncAHfVzDHIkgSp7ZLZ38F
         PZ3AsUsARFb5nUCf3QkHNdmG728d5jp1YHQ2P7hv5mCRXZVhGLfEYaoFTC4ha4luMQ
         YajvHeG1dyzz8jyUn+T2F0sP6YBEptaH5IswCotw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C46BD940459; Thu, 17 Jan 2019 13:48:50 +0100 (CET)
Date:   Thu, 17 Jan 2019 13:48:50 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7778: Fix HSPI pin numbers and names
Message-ID: <20190117124850.4a67wegcv7vibuvd@verge.net.au>
References: <20190116131923.6544-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190116131923.6544-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 16, 2019 at 02:19:23PM +0100, Geert Uytterhoeven wrote:
> When declaring the HSPI RX1_B and TX1_B pins, two mistakes were made:
>   - the rows and columns in the BGA pin matrix, from which the pin
>     numbers are derived, were exchanged,
>   - it was not taken into account that BGA pin row labelling skips
>     characters I, O, Q, and S.
> 
> Fix the order, and the corresponding pin names.
> 
> Notes:
>   - The actual values of the pin numbers don't really matter (they just
>     have to be unique), so the wrong order didn't have any impact,
>   - Changing the names of the pins is user-visible, but there are no
>     users in (upstream) DTS files.
> 
> Fixes: 4f82e3ee724f1712 ("sh-pfc: Support pins not associated with a GPIO port")
> Fixes: 09cc76a95802e87d ("sh-pfc: r8a7778: add HSPI pin groups")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

