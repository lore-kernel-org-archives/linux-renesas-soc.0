Return-Path: <SRS0=pBJi=SR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A07C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 08:41:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF8B720656
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 08:41:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbfDOIls (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 04:41:48 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42466 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfDOIls (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 04:41:48 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3399325AD6F;
        Mon, 15 Apr 2019 18:41:45 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2B8A99403F0; Mon, 15 Apr 2019 10:41:43 +0200 (CEST)
Date:   Mon, 15 Apr 2019 10:41:43 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     geert+renesas@glider.be, magnus.damm@gmail.com,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77965: Remove reg-names of
 display node
Message-ID: <20190415084142.6pk5sd7dupua34gs@verge.net.au>
References: <20190412120132.31119-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190412120132.31119-1-jacopo+renesas@jmondi.org>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 12, 2019 at 02:01:32PM +0200, Jacopo Mondi wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> Remove the "reg-names" property from the display node of R-Car Gen3 R8A77965
> device tree.
> 
> No other mainline R-Car Gen3 SoC has that property specified.
> 
> Fixes: 2f2c71bfc8c5 ("arm64: dts: renesas: r8a77965: Populate the DU instance placeholder")
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [reworded commit message, sent upstream]
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks Jacopo,

applied for inclusion in v5.2.
