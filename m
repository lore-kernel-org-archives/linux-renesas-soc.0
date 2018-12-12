Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C29C04EB8
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:31:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E81B92084E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:31:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="FmA9lt61"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E81B92084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verge.net.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbeLLKbo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 05:31:44 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:44208 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbeLLKbo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 05:31:44 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 90B5325B740;
        Wed, 12 Dec 2018 21:31:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544610702; bh=hAJcJvwHkyYzPn3A2zaSnKd5HVN3ZKGVYKU9EBus/uk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FmA9lt61KO6WExa8fhQtZWrW7C6ebjTTOT64XpQcCZiE/629rRlpA3NwPbH+MHhSy
         HCj4uJR5ibkmTc3t4lMA2DiJxgjM65TvZOtfmt9ZBuiUxv50n7gkZdcfGylj9dUv2P
         jEZVFD1Z3ntOPXbnwNOq4unWyr/Qjfg4hFpG28pE=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id EA3A39404C7; Wed, 12 Dec 2018 11:31:40 +0100 (CET)
Date:   Wed, 12 Dec 2018 11:31:40 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Stefan Agner <stefan@agner.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable NXP pcf85363 rtc
Message-ID: <20181212103140.3kci64mn6fubuaok@verge.net.au>
References: <1544450712-44226-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544450712-44226-1-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 10, 2018 at 02:05:12PM +0000, Biju Das wrote:
> The iWave RZ/G1C SBC supports RTC (NXP pcf85263). To increase
> hardware support enable the driver in the multi_v7_defconfig
> multiplatform configuration.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
