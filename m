Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF406C43612
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 12:42:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B56A02133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 12:42:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="TeRN7gWi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbeLQMmQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 07:42:16 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39859 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732327AbeLQMmK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 07:42:10 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0DB4F25B781;
        Mon, 17 Dec 2018 23:42:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545050528; bh=hKNUeS6ZCvROnO3jK+QG3X1kLWLfYpec2QWhreG/Bb0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TeRN7gWiMbmBc9lhXzlSM3Wr8d09WfH/9QyR2kUj6AarEG4Kbj8iJAjW5hsuB5zr3
         zuGQFhkcd55OH93YPWZhe4eLQxMFbyhFnPHPlJuarNVhRlNeBUnyHuj1buv9+oQORw
         JRmyI8x22OLMiH3t9sVgMnlt7P0eaPZ4KcJb+KMc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7DFDD94048A; Mon, 17 Dec 2018 13:42:06 +0100 (CET)
Date:   Mon, 17 Dec 2018 13:42:06 +0100
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
Message-ID: <20181217124202.mplbirkhxhobw4a2@verge.net.au>
References: <1544450712-44226-1-git-send-email-biju.das@bp.renesas.com>
 <20181212103140.3kci64mn6fubuaok@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181212103140.3kci64mn6fubuaok@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 12, 2018 at 11:31:40AM +0100, Simon Horman wrote:
> On Mon, Dec 10, 2018 at 02:05:12PM +0000, Biju Das wrote:
> > The iWave RZ/G1C SBC supports RTC (NXP pcf85263). To increase
> > hardware support enable the driver in the multi_v7_defconfig
> > multiplatform configuration.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

Applied for v4.22.
