Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35406C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 10:25:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0176B20850
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 10:25:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="QyfEc1FG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbfDAKZQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 06:25:16 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45382 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbfDAKZQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 06:25:16 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1D8D925B766;
        Mon,  1 Apr 2019 21:25:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554114313; bh=3qAC8Bk7LeQb93r+5iX7gM7oQPY1adMgZStACVcW0/w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QyfEc1FGjbT+Vhopwu4VrOEhaAjN29GyvNuDO8dXiJ/6WH3o/KsYoihYEgowFbGFA
         N0DvICvsHy474gdJMMqzKA9/QPKSs6HYDdQ8t93JRUEznn6IvVBcXLqO+kozzuUhto
         joPVPfVZi7d+P0gSBuo9btwtXsXEAqw6bjzh0NiU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 38F5194039A; Mon,  1 Apr 2019 12:25:11 +0200 (CEST)
Date:   Mon, 1 Apr 2019 12:25:11 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 8/8] pinctrl: sh-pfc: rcar-gen3: Rename SEL_NDFC to
 SEL_NDF
Message-ID: <20190401102510.5orqoq2pwqzw4dtt@verge.net.au>
References: <20190329152942.13995-1-geert+renesas@glider.be>
 <20190329152942.13995-9-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190329152942.13995-9-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 29, 2019 at 04:29:42PM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> According to the R-Car Gen3 Hardware Manual Errata for Rev 1.50 of Feb
> 12, 2019, the sel_ndfc MOD_SEL register bit is renamed to sel_ndf.
> 
> Update the pin control drivers to reflect this.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [geert: Update R-Car E3]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

