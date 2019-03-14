Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2848DC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 10:44:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E15C620854
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 10:44:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="X6NbC2e5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbfCNKoR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 06:44:17 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:49381 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbfCNKoR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 06:44:17 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 365F625BDF8;
        Thu, 14 Mar 2019 21:44:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552560255; bh=pn7LJrnu+Pgy5dpk9bM0+P7/+aPtNpKMvBzqC2TjL/8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X6NbC2e5/4vNv0gxpjr63WcSoPu25iAfR+OLtQOFKEKiCm/+efeFd1pxpG9gEyVou
         XeD1AGKI9ILyfq+YMjkfSWLym8Tt/R+sZIRi9ymRxjP6TwigUOU1rwoRLm9T06relM
         BpUZyDNinqUeMRHem8l17TIExKKoDnP81s67QlWE=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 74F3C9403F2; Thu, 14 Mar 2019 11:44:13 +0100 (CET)
Date:   Thu, 14 Mar 2019 11:44:13 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: ebisu: Add PMIC DDR0 Backup
 Power config
Message-ID: <20190314104413.vzpnhyl2w63kag6v@verge.net.au>
References: <20190313105816.8592-1-horms+renesas@verge.net.au>
 <20190313105816.8592-3-horms+renesas@verge.net.au>
 <CAMuHMdXAFf_bcpn0zo+Wx+5f3C1TbgTY_jucmqH71mcmn11f-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXAFf_bcpn0zo+Wx+5f3C1TbgTY_jucmqH71mcmn11f-Q@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 13, 2019 at 01:17:30PM +0100, Geert Uytterhoeven wrote:
> On Wed, Mar 13, 2019 at 11:58 AM Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > On Ebisu the DDR0 power rail needs to be kept powered when backup mode is
> > enabled.  Reflect this in the "rohm,ddr-backup-power" property for the
> > BD9571MWV PMIC node.
> >
> > The accessory power switch (SW23) is a toggle switch, hence specify
> > "rohm,rstbmode-level".
> >
> > Based on advice from Geert Uytterhoeven.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.2.
