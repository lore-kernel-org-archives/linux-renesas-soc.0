Return-Path: <SRS0=kNGB=SG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDADC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 10:41:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE7C320820
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 10:41:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="XIwYZ0HV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729393AbfDDKl0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 4 Apr 2019 06:41:26 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:59625 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbfDDKl0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Apr 2019 06:41:26 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 94A6C25B7A1;
        Thu,  4 Apr 2019 21:41:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554374483; bh=QAybLYdmXAGf7qw+Gqk1JjHFrL8TiQMSriHcQ0jWQH4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XIwYZ0HV27vepFYlI98yLo0oRRNhURVJKBvQFWXP2/ZYTphQZh+Ub8iVhiTvYtB7z
         CjjzKmTSUslpgkxAw8Dkm9fqsHsEEOcsWUA2aDrLOb8sW7P0hnn5mLSb8pRGIOD76B
         QuYCCV6B0kD2QwZCD+GOravZLXB5nSoYUFz/WM+Y=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id BF7209402FD; Thu,  4 Apr 2019 12:41:21 +0200 (CEST)
Date:   Thu, 4 Apr 2019 12:41:21 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r8a774c0-cat874: Add USB-HOST
 support
Message-ID: <20190404104121.tbd7alm5u3yrl3js@verge.net.au>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1551438348-22119-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <TY1PR01MB1770C64F41C77DAED3556E58C0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770C64F41C77DAED3556E58C0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 03, 2019 at 10:29:39AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> Patch "usb: common: Consider only available nodes for dr_mode" has been taken,
> and that is enough to get USB 2.0 host to work on the EK874, do you think you
> can take this patch now?

Thanks Fabrizio,

can do. I have applied this for v5.2.
