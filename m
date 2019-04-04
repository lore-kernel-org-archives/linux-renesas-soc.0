Return-Path: <SRS0=kNGB=SG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3247DC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 10:34:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0323C20820
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 10:34:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="MGbibpn4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729019AbfDDKev (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 4 Apr 2019 06:34:51 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:59551 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728843AbfDDKev (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Apr 2019 06:34:51 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id DDF3125BEC6;
        Thu,  4 Apr 2019 21:34:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554374089; bh=+lsUAOR4ro2hS8fimTJVHal6EM6/F/6ohm/lNwp4gIg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MGbibpn4eZQYH9EINALEXGGdJ+WDk28raOm9bBP4Lm3rcfCSs3YPzkXney1um+LWj
         Wa96Tf3CNWfVWxQIcDuv7VY+u8J1yCzSj0dHqafn28bpU8V3AhypvCd2T9ID3xFSM0
         Ok6Or5SMzdgdpfYQIGjUwnXl8qgIadP/WDJbmf6Q=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 11D679402FD; Thu,  4 Apr 2019 12:34:47 +0200 (CEST)
Date:   Thu, 4 Apr 2019 12:34:46 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r8a77995: draak: Remove hsusb
 node
Message-ID: <20190404103446.d5n2bnsuieyuli3v@verge.net.au>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1551438348-22119-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <TY1PR01MB177003CB9BCE22BAC2FE83A9C0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB177003CB9BCE22BAC2FE83A9C0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 03, 2019 at 10:26:18AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> I would like to drop this patch.

Thanks Fabrizio,

I have marked it as "Rejected" in patchwork.
