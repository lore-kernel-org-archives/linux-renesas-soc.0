Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57468 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730533AbeKGUvP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Nov 2018 15:51:15 -0500
Date: Wed, 7 Nov 2018 12:21:16 +0100
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/03] Connect R-Car Gen3 Ethernet-AVB to IPMMU
Message-ID: <20181107112115.5d2l2tfpf6nvuvca@verge.net.au>
References: <154014207424.4344.6894320987219157257.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <154014207424.4344.6894320987219157257.sendpatchset@octo>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 22, 2018 at 02:14:34AM +0900, Magnus Damm wrote:
> Connect R-Car Gen3 Ethernet-AVB to IPMMU
> 
> [PATCH 01/03] arm64: dts: renesas: r8a77965: Connect R-Car M3-N AVB to IPMMU
> [PATCH 02/03] arm64: dts: renesas: r8a77980: Connect R-Car V3H AVB to IPMMU
> [PATCH 03/03] arm64: dts: renesas: r8a77990: Connect R-Car E3 AVB to IPMMU
> 
> For each SoC describe Ethernet-AVB to IPMMU hardware connection in the
> Device Tree. This series affects R-Car M3-N, V3H and E3. Other members
> of the R-Car Gen3 family such as H3, M3-W, V3M and D3 already includes
> this information in their DT files.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Hi,

I have already queued-up these patches but I noticed that
they do the same thing to different SoCs and recently the ARM-SoC
maintainers have asked us to consolidate such patches. With that in mind
I am considering squashing the three patches that comprise this series into
one. Are there any objections?
