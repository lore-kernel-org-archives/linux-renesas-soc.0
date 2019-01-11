Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AE9C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 14:09:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 882B920872
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 14:09:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="CDGyQBuM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731530AbfAKOJD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 09:09:03 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:34110 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731288AbfAKOJD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 09:09:03 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A108D25B819;
        Sat, 12 Jan 2019 01:09:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547215741; bh=dIJtcpA1U6bU/aOpNsG3O1Dd7j2cMreSP5RqeudHcPs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CDGyQBuMe/o+AQxYzesmCya4+zDujMaSXeqxFEwr2Stkn5njzVSX0QPu1nVb/DV6t
         TXRAgikxfoR1noP/6e/2rTlcd85h0vNSkzMLxbhL7g9d/NL/i4VW1fgQjdMXczqms6
         g4/c8vU/FKvh7xhcoAEkrD8mczsvHu5QKQyKTFHo=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 91F88E21282; Fri, 11 Jan 2019 06:08:58 -0800 (PST)
Date:   Fri, 11 Jan 2019 15:08:58 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/4] pinctrl: sh-pfc: rcar-gen3: Deduplicate remaining
 VIN pin definitions
Message-ID: <20190111140857.axkquvc5h4fwzh3n@verge.net.au>
References: <20190111122705.32365-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190111122705.32365-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 11, 2019 at 01:27:01PM +0100, Geert Uytterhoeven wrote:
> 	Hi,
> 
> As of commit 50f3f2d73e3426ba ("pinctrl: sh-pfc: Reduce kernel size for
> narrow VIN channels"), the infrastructure is available to avoid
> duplication of pin definitions for narrow Video IN (VIN) channels.
> Make use of his to deduplicate the remaining VIN pin definitions on
> R-Car Gen3 SoCS.
> 
> This is similar to what was done before for the wide VIN channels e.g.
> commit 9942a5b52990b8d5 ("pinctrl: sh-pfc: r8a7795: Deduplicate VIN4 pin
> definitions").
> 
> This reduces kernel size for an R-Car Gen3 kernel by almost 1 KiB.
> 
> I plan to queue these in sh-pfc-for-v5.1.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

