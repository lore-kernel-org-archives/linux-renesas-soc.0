Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD12C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 15:07:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 957E320827
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 15:07:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="oZdJAIhR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbfAHPHf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 10:07:35 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:34828 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbfAHPHf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 10:07:35 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BFB7725AD76;
        Wed,  9 Jan 2019 02:07:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546960053; bh=lLH66C8g1nTAhoJsD0ei3jWIq1Njh17Buk+0xjS/8Lw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oZdJAIhRwX7Hbg+re0bAIF94PYUDtnp6OX8FjynNyHk4x/Ur6DwrmlQD16lejIzce
         20rUswwrQpJN+LNv8GF98tezGFdUUfYpOUZzUY/0jkZwz+j4+SMRIicaeCXY1TSH1b
         hct0GNCOYNDqSCeEvTs4YcW6BE9RcmVtyMbVZMcw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DE48A940420; Tue,  8 Jan 2019 16:07:30 +0100 (CET)
Date:   Tue, 8 Jan 2019 16:07:30 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH v2 2/2] pinctrl: sh-pfc: r8a7794: initialize TDSEL
 register for ES1.0
Message-ID: <20190108150730.ms4trjevwfj2we6u@verge.net.au>
References: <20190107221320.14930-1-wsa+renesas@sang-engineering.com>
 <20190107221320.14930-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190107221320.14930-3-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 07, 2019 at 11:13:20PM +0100, Wolfram Sang wrote:
> Documentation for ES1.0 says that some bits in TDSEL must be set (ch
> 5.3.35 in R-Car E2 v0.5). However, the reset value of the register is 0,
> so software has to do it. Add this to the kernel driver to ensure this
> is really done independent of firmware versions and use whitelisting for
> ES versions known to need this.
> 
> This is needed for some SD cards supporting SDR104 transfer mode.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

