Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D934C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 11:17:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8B1B20883
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 11:17:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="SO/szBsf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfDILRd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 07:17:33 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42021 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfDILRd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 07:17:33 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C50EC25BDAE;
        Tue,  9 Apr 2019 21:17:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554808651; bh=MZ2f/dpx7RdQQwS2b6rIeR72lUU3FWJmZiF334wFQ68=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SO/szBsf8sLnQX0NdcSVvLYM0lhWvNd7MwKyRWkRdOqlKWB9iDQXJu95sIzTVsyON
         PubxebVbok+zTQ8CtMb9MT+WH+xtT7oCv/NDrE8jeNLEc+QpKbBTZVJqgl3CsfRIfC
         E3OZ6NLMMjPjK4dv6R9cIYVSuwvNVX8gFfIF/AOg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id F1DA89402E1; Tue,  9 Apr 2019 13:17:28 +0200 (CEST)
Date:   Tue, 9 Apr 2019 13:17:28 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH V3 12/13] ARM: dts: r8a77470: Add HSUSB device nodes
Message-ID: <20190409111728.nevn3cyltymba4ac@verge.net.au>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-13-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554287324-22312-13-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 03, 2019 at 11:28:43AM +0100, Biju Das wrote:
> Define the r8a77470 generic part of the HSUSB0/1 device nodes.
> 
> Currently the renesas_usbhs driver doesn't handle multiple phys and we
> don't have a proper hardware to validate such driver changes.
> 
> So for hsusb1 it is assumed that usbphy0 will be enabled by either
> channel0 host or device.
> 
> In future, if any boards support hsusb1, we will need to add multiple phy
> support in the renesas_usbhs driver and override the board dts to enable
> the same.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
