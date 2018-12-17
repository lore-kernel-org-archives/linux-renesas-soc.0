Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9621DC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:47:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 498B9206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:47:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="PFlM2283"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732875AbeLQOry (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:47:54 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:42153 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732216AbeLQOry (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:47:54 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2423125B781;
        Tue, 18 Dec 2018 01:47:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545058072; bh=4LylHCPnw2uLUDFUYhuHeVvWNE7Exp7IWRoOCDAWJ9E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PFlM2283rhSPquZe4xvfK7zA9Nbz2sRVg7Nvdni4AOt0hU2v6PwDqPoayXHPZPDXq
         afM18JWRZg32tmj0/8mbsVGiWnGXteOr5Y/GwiOyU3Aurr45d9Cz6A/aVcyN0PXnk7
         oEdYQt3kuflCfwmNVx1e9WAtDuFP2Q4h9mQI8B7o=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1594E94048A; Mon, 17 Dec 2018 15:47:50 +0100 (CET)
Date:   Mon, 17 Dec 2018 15:47:50 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 12/15] pinctrl: sh-pfc: Make
 pinmux_cfg_reg.var_field_width[] variable-length
Message-ID: <20181217144749.abhi7rwc65vijlhs@verge.net.au>
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-13-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213182714.26094-13-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 07:27:11PM +0100, Geert Uytterhoeven wrote:
> pinmux_cfg_reg.var_field_width[] is actually a variable-length array,
> terminated by a zero, and counting at most r_width entries.
> Usually the number of entries is much smaller than r_width, so the
> ability to catch bugs at compile time through an "excess elements in
> array initializer" warning is fairly limited.
> 
> Hence make the array variable-length, decreasing kernel size slightly.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
