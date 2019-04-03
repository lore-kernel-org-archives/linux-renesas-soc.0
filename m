Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E64C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 09:30:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 772362082C
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 09:30:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ktiCXOMw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbfDCJaw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 05:30:52 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:35958 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfDCJav (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 05:30:51 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 83EDC25AD6C;
        Wed,  3 Apr 2019 20:30:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554283849; bh=XezMtIVgnlg3B6AMtma3iVi1XHPxWKZSZt3rO9B544g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ktiCXOMwb1NsvUq1vmi40A2aHB6JGEIFl4Y5t49OkTbjUnaxtA9UmX6lp0zRXg1yA
         9D1gkWtBg4IzFSZMgZ59rOs7pvtDZJjC7/FKbmfc4e3fvXgKQ52fVQdM4duF7zuQFw
         ieldjXeEqrh+oWYqPiyHb8WgAHoprAkjZOLoQPhU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7C33E940361; Wed,  3 Apr 2019 11:30:47 +0200 (CEST)
Date:   Wed, 3 Apr 2019 11:30:47 +0200
From:   Simon Horman <horms@verge.net.au>
To:     marek.vasut@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: alt: Enable USB support
Message-ID: <20190403093047.pgrqrproslcwrcaw@verge.net.au>
References: <20190330070811.25123-1-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190330070811.25123-1-marek.vasut@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Mar 30, 2019 at 08:08:11AM +0100, marek.vasut@gmail.com wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Add nodes enabling internal PCI controllers to which the internal USB
> controllers are connected, add USB PHY node and pinmux nodes.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm/boot/dts/r8a7794-alt.dts | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Thanks Marek,

applied for v5.2.
