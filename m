Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F274DC282C8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 12:24:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B92E12171F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 12:24:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="fh6oYYv4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfA1MYZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 07:24:25 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59820 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726611AbfA1MYZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 07:24:25 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A1E4625BE02;
        Mon, 28 Jan 2019 23:24:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548678262; bh=UD5eS91sfRUSabdow6cjlRams5Ab1NCy1o6Za1Z/+Is=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fh6oYYv46SpPxsPcziJ/hs/cBmoejOwbb2QZpwWvXOQrNLQFki3CAGzZw+3bMeGFX
         nOuVwC9g3YgIgFPLKxchYxBI470EqqCZeZ7L65n73gABCUvMJDyZElEAq3JDY2KEJ6
         LSPzaIehE3W06HSr7A+B0mzgWlis522AzYzsGEyY=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 15A079403E0; Mon, 28 Jan 2019 13:24:21 +0100 (CET)
Date:   Mon, 28 Jan 2019 13:24:21 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/4] pinctrl: sh-pfc: Miscellaneous pinmux fixes
Message-ID: <20190128122420.nb2nq4ew7w4fhoac@verge.net.au>
References: <20190125154812.30680-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190125154812.30680-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 25, 2019 at 04:48:08PM +0100, Geert Uytterhoeven wrote:
> 	Hi Linus,
> 
> This patch series contains 4 pinmux functions for Renesas SoCs, all
> found by validation code that checks the relation between pin groups and
> pin functions.
> 
> I plan to queue these in sh-pfc-for-v5.1.

FWIIW:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
