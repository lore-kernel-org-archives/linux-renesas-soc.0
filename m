Return-Path: <SRS0=0nld=RA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E24C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:42:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B34E2084D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:42:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ZVnhNEVn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfBYJmw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Feb 2019 04:42:52 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40806 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbfBYJmw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Feb 2019 04:42:52 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5619C25B784;
        Mon, 25 Feb 2019 20:42:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551087769; bh=S9ML3ramlH9hWklM9yq7Rrfcb348q9H36PFNAmeYn20=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZVnhNEVneGuaFC1zNN6aRUf1tU7wS+05ZWYUfkzWGRGMndlGpo7Ii++Wuy7ERMKQz
         3D1cU2hU60IqFntq4S1cX6aJAYmHxx4cFGO2o8TCUdOWcwY8wM83oJm/91GZkN3ax3
         lEcd65znvaq2czLHj1mV6UMYvNavsdSxg+/W02sg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7B0C494056F; Mon, 25 Feb 2019 10:42:47 +0100 (CET)
Date:   Mon, 25 Feb 2019 10:42:47 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Chris Paterson <Chris.Paterson2@renesas.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: move CANFD pin groups and
 functions
Message-ID: <20190225094247.n422zgyzlx5t2nb5@verge.net.au>
References: <1550678985-1316-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYAPR01MB2285DCD8AA880833E7A96AF8B77D0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYAPR01MB2285DCD8AA880833E7A96AF8B77D0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 20, 2019 at 08:39:33PM +0000, Chris Paterson wrote:
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Sent: 20 February 2019 16:10
> > To: Geert Uytterhoeven <geert+renesas@glider.be>; Linus Walleij
> > <linus.walleij@linaro.org>
> > Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>; linux-renesas-
> > soc@vger.kernel.org; linux-gpio@vger.kernel.org; Simon Horman
> > <horms@verge.net.au>; Chris Paterson <Chris.Paterson2@renesas.com>;
> > Biju Das <biju.das@bp.renesas.com>
> > Subject: [PATCH] pinctrl: sh-pfc: r8a7796: move CANFD pin groups and
> > functions
> > 
> > CANFD is found also on the R8A774A1, therefore move CANFD pin
> > groups and functions to "common".
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

