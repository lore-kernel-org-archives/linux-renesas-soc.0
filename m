Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044ECC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 12:33:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C353B20660
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 12:33:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Fu/39nkJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730131AbfAIMdE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 07:33:04 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:50757 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730017AbfAIMdE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 07:33:04 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 934A225B80E;
        Wed,  9 Jan 2019 23:33:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547037181; bh=c0kudzL6mJdqc9pijvmi75mvURmSmwTS0RjBJOL/YYc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fu/39nkJJISbYItVPnHrA4X86gLh4fHczQx4sZ1rG+jNK3eq+2eTVe7O6xReYbdM6
         +NAitHu4h79YZ0EP8aukKbCNNmc+BtOfSZSXmSd7QtFkCwX6YBC7wSjjS+RL5oB0pz
         wZhAWrvumAhR1+HMpN5u+eUN181E90ep+Ffv64zQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0BDD7940420; Wed,  9 Jan 2019 13:32:59 +0100 (CET)
Date:   Wed, 9 Jan 2019 13:32:59 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V3] arm64: dts: r8a77990: ebisu: Add and enable SDHI
 device nodes
Message-ID: <20190109123259.cpql62omcvypafdu@verge.net.au>
References: <20181106204647.18051-1-marek.vasut+renesas@gmail.com>
 <20190109104922.z6g772vgncdqqbqt@verge.net.au>
 <20190109105754.vvqx6uvsktvxeq7a@ninjato>
 <34cd1769-f0c9-0c2b-8947-4fceca9a9fb2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34cd1769-f0c9-0c2b-8947-4fceca9a9fb2@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 09, 2019 at 01:02:00PM +0100, Marek Vasut wrote:
> On 1/9/19 11:57 AM, Wolfram Sang wrote:
> >> [    3.373714] renesas_sdhi_internal_dmac ee100000.sd: mmc0 base at 0xee100000 max clock rate 200 MHz
> >> [    3.456829] renesas_sdhi_internal_dmac ee120000.sd: mmc1 base at 0xee120000 max clock rate 200 MHz
> > 
> > No mmc2 initialized. That should work regardless of eMMC. Probably
> > something wrong in the DT somewhere.
> 
> Weird, it worked in next-20181102 with these patches, I just rechecked:
> 
> 7818a9f06df1 mmc: renesas_sdhi: Whitelist R8A77990 SDHI
> a05a906776f8 pinctrl: sh-pfc: r8a77990: Add voltage switch operations
> for SDHI
> 2cc9d3a293e9 pinctrl: sh-pfc: r8a77990: Add SDHI pins, groups and functions
> 6b8d151613b7 pinctrl: sh-pfc: r8a77990: Add Audio SSI pins, groups and
> functions
> 9167b22938f7 pinctrl: sh-pfc: r8a77990: Add Audio clock pins, groups and
> functions
> 000cc50fc942 arm64: dts: r8a77990-ebisu: Enable HS200 of SDHI3
> d3f59bbbf7ce arm64: dts: r8a77990-ebisu: Enable eMMC of SDHI3
> 5928c59bff8d arm64: dts: r8a77990-ebisu: Enable UHS-I of SDHI0 and SDHI1
> dae32a3172b8 arm64: dts: r8a77990-ebisu: Enable SD card of SDHI0 and SDHI1
> 8feef039c6c6 arm64: dts: r8a77990: Add SDHI device nodes
> 25e9471b6a27 (tag: next-20181102) Add linux-next specific files for 20181102
> 
> I'll let you know once I figure it out.

Could it be related to potentially old U-Boot etc.. on the board I am using?
