Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:36635 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752414AbdCEX2W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Mar 2017 18:28:22 -0500
Received: by mail-lf0-f50.google.com with SMTP id y193so65445498lfd.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 05 Mar 2017 15:28:21 -0800 (PST)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Mon, 6 Mar 2017 00:28:18 +0100
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv2] arm64: dts: r8a7795: salvator-x: Set drive-strength
 for ravb pins
Message-ID: <20170305232818.GA20587@bigcity.dyn.berto.se>
References: <20161205174310.28802-1-niklas.soderlund+renesas@ragnatech.se>
 <20161208133137.GE7150@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20161208133137.GE7150@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On 2016-12-08 14:31:38 +0100, Simon Horman wrote:
> On Mon, Dec 05, 2016 at 06:43:10PM +0100, Niklas S�derlund wrote:
> > The EthernetAVB should not depend on the bootloader to setup correct
> > drive-strength values. Values for drive-strength where found by
> > examining the registers after the bootloader has configured the
> > registers and successfully used the EthernetAVB.
> > 
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> I believe this patch has run-time dependencies on PFC patches and will
> result in a regression without them. Please resubmit or otherwise ping me
> once chose changes are present in an (rc) release or immutable branch.

The dependency for this DT change is now present in v4.11-rc1, see 1. If 
it's convenient for you feel free to pick up this patch.

1. b25719eb938eb39a ("pinctrl: sh-pfc: r8a7795: Add group for AVB MDIO 
   and MII pins")

> 
> Thanks!

-- 
Regards,
Niklas S�derlund
