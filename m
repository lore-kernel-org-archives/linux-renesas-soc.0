Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0E4C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 14:11:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFD7A20872
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 14:11:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="rERLXCnw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730850AbfAKOL3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 09:11:29 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:34156 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729121AbfAKOL3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 09:11:29 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4390425B819;
        Sat, 12 Jan 2019 01:11:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547215887; bh=CtUM8weg8coZazAbHmGdb6rPQrf83FotrtqRvtgT5zM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rERLXCnwwXV7sdHH6Tt9XH0hSk3vlD+7/qir0JXlSXesfIlyw+kc/eZRDOqzDVNyy
         0Ar14xYRfzjSvmrqhFsLm0zUbwAlZRWnZ9QHuxxbG4fUoh4pXfp7wPWnbkRYwmv1oJ
         hGZkGOPVCv1AZCi44IgssldgftmJYvF0G9XIp56Q=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 4087FE21282; Fri, 11 Jan 2019 06:11:25 -0800 (PST)
Date:   Fri, 11 Jan 2019 15:11:25 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH/RFC] pinctrl: sh-pfc: r8a7791: Fix VIN1 versioned groups
Message-ID: <20190111141124.nrwed7znrapo45wq@verge.net.au>
References: <20190111124517.2730-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190111124517.2730-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 11, 2019 at 01:45:17PM +0100, Geert Uytterhoeven wrote:
> The naming of the "b" versions of the VIN1 pin groups is a bit odd, in
> that the "_b" appears in the middle of the names, instead of as a
> suffix.
> 
> Increase consistency with other SoCs by making R-Car M2-W and M2-N, and
> RZ/G1M and RZ/G1N, use the recently added optional "version" argument of
> the VIN_DATA_PIN_GROUP() macro.
> 
> Note that this breaks backwards compatibility with existing DTBs, but
> there are no upstream users of the "vin1_b_*" names.
> 
> Fixes: 8e32c9671f84acd8 ("pinctrl: sh-pfc: r8a7791: Add VIN pins")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Is it worth making this change?
> If yes, should we retain backwards-compatibility using e.g. the patch
> below, increasing kernel size by 380 bytes?
> 
> Note that unlike the deprecated "avb_mdc" pin groups on R-Car Gen3, the
> "vin1_b_*" groups never had upstream users, so I'm inclined not to care
> about backwards compatibility.

That sounds fine to me.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
