Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60944 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752863AbcLHNbn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Dec 2016 08:31:43 -0500
Date: Thu, 8 Dec 2016 14:31:38 +0100
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv2] arm64: dts: r8a7795: salvator-x: Set drive-strength
 for ravb pins
Message-ID: <20161208133137.GE7150@verge.net.au>
References: <20161205174310.28802-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20161205174310.28802-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 05, 2016 at 06:43:10PM +0100, Niklas Söderlund wrote:
> The EthernetAVB should not depend on the bootloader to setup correct
> drive-strength values. Values for drive-strength where found by
> examining the registers after the bootloader has configured the
> registers and successfully used the EthernetAVB.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

I believe this patch has run-time dependencies on PFC patches and will
result in a regression without them. Please resubmit or otherwise ping me
once chose changes are present in an (rc) release or immutable branch.

Thanks!
