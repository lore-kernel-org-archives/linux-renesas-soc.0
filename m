Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD66C282D7
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 15:44:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8330120663
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 15:44:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="fZUXWSe0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729917AbfBEPoh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 10:44:37 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:52125 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729835AbfBEPoh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 10:44:37 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1BB7E25B7E9;
        Wed,  6 Feb 2019 02:44:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549381475; bh=87kfSsafaIAQOpco0riDmzNac+iwvZWsHGmhoJ42krQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fZUXWSe0SFP6hjEfpwwQqtUZA7H9/7nzmygZ8Cs5YGGZOLgV6CjNxCQ4jHHGiLbBt
         5n30AVzUzjfiS8v+mwtx4QErBCqAZnOOyQI8Oc21J0ipTFZfC8ZMVPk5k3nwdnMtpM
         tdjSdWmXrIyk1ty3O9HSr5/rahxDzFMLhVeXz+4E=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 50D56940486; Tue,  5 Feb 2019 16:44:33 +0100 (CET)
Date:   Tue, 5 Feb 2019 16:44:33 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Add OPPs table for cpu
 devices
Message-ID: <20190205154433.55ee3bfdbdsjwzek@verge.net.au>
References: <1548934450-10256-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548934450-10256-1-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 31, 2019 at 11:34:10AM +0000, Fabrizio Castro wrote:
> This patch defines OOP tables for all CPUs, similarly to
> what done by Takeshi Kihara and Yoshihiro Kaneko for the
> R8A77990.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
> 
> This patch depends on series:
> https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg38109.html

Thanks, applied for v5.1.
