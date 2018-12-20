Return-Path: <SRS0=bqQk=O5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9945C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 07:44:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8424C21720
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 07:44:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="r9yGH3Vb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbeLTHol (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Dec 2018 02:44:41 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:57567 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbeLTHol (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Dec 2018 02:44:41 -0500
Received: from penelope.horms.nl (softbank060150141248.bbtec.net [60.150.141.248])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 58E5125B7E1;
        Thu, 20 Dec 2018 18:44:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545291879; bh=htEIxwKQ/3waHarpYN9r5kNKzF3FEGgoZ2SOrKIGuJY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r9yGH3VbPTCtgaKg82s0f8yDnr4lPvyLDh9QksEYrF/XTZtNlLW01URl4yhibZLnh
         /v+lgL4KAWirmsay/gKzjTaBpUAWZnsiHzA3Y6ld1CZ8ITYNLV5Az2x/MoSNvqgDw8
         t+2F0p6rZmShaWgofmJ1oA6eiv/TLXsMbZnoKoqc=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id C2FAAE218FB; Wed, 19 Dec 2018 23:44:37 -0800 (PST)
Date:   Thu, 20 Dec 2018 16:44:37 +0900
From:   Simon Horman <horms@verge.net.au>
To:     DUNG NGUYEN <dung.nguyen.aj@renesas.com>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ARM: shmobile: Fix R-Car Gen2 regulator quirk
Message-ID: <20181220074437.44iq7n656tyqd5tt@verge.net.au>
References: <20181207202858.17129-1-marek.vasut+renesas@gmail.com>
 <TY2PR01MB369237F587AA0FF04484E421D5BF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY2PR01MB369237F587AA0FF04484E421D5BF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 20, 2018 at 05:01:15AM +0000, DUNG NGUYEN wrote:
> > The quirk code currently detects all compatible I2C chips with a shared IRQ line
> > on all I2C busses, adds them into a list, and registers a bus notifier. For every
> > chip for which the bus notifier triggers, the quirk code performs I2C transfer on
> > that I2C bus for all addresses in the list.
> > The problem is that this may generate transfers to non-existing chips on
> > systems with multiple I2C busses.
> > 
> > This patch adds a check to verify that the I2C bus to which the chip with shared
> > IRQ is attached to matches the I2C bus of the chip which triggered the bus
> > notifier and only starts the I2C transfer if they match.
> > 
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Cc: Simon Horman <horms+renesas@verge.net.au>
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Cc: linux-renesas-soc@vger.kernel.org
> > ---
> Hi Mr Marek
> 
> Tested-by: Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
> 
> I have tested this patch on H2 Lager with mainline v4.20-rc4 kernel.
> Confirmed that the problem is improved by this patch.
> 
> Best regards,

Thanks, applied for v4.22.
