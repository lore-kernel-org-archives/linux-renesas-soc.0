Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392A3C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:47:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01EBF2145D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:47:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="hXlb61QF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbeLQNr0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 08:47:26 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40941 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbeLQNr0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 08:47:26 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 70B3225B80B;
        Tue, 18 Dec 2018 00:47:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545054443; bh=joJhuMr0xmvFHmUFbfUeXsD+23UCp5UtbxjfEbMMetM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hXlb61QFsdQVAVbZfyyiWRQCEbeC8czu9IOWBgUVkpBWzu8SMdtec4rVKqcf06OQa
         F+2CGGnFtDhYa3kbT48fpLSpQeFlNcw3ewa/7TVfAXq1RQMqCqRLwQb+MJhCqXB3yE
         rz0IePXzHlvRqkAPG6lQ9R/CnJKnpgwC1M2C/dIg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7AE2194048A; Mon, 17 Dec 2018 14:47:21 +0100 (CET)
Date:   Mon, 17 Dec 2018 14:47:21 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 02/15] pinctrl: sh-pfc: r8a779970: Add missing MOD_SEL0
 field
Message-ID: <20181217134720.wrkf3ho4jakmc4uc@verge.net.au>
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213182714.26094-3-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 07:27:01PM +0100, Geert Uytterhoeven wrote:
> The Module Select Register 0 contains 20 (= 5 x 4) reserved bits, and 12
> single-bit fields, but the variable field descriptor lacks a field of 4
> reserved bits.
> 
> Fixes: b92ac66a1819602b ("pinctrl: sh-pfc: Add R8A77970 PFC support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

