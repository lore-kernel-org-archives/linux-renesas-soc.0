Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44723 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752828AbdAZHsQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 02:48:16 -0500
Date: Thu, 26 Jan 2017 08:48:09 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Mark EthernetAVB device nodes
 disabled
Message-ID: <20170126074806.GE12042@verge.net.au>
References: <1485350371-16091-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1485350371-16091-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 25, 2017 at 02:19:29PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series marks the EthernetAVB device nodes in the R-Car H3 and
> M3-W DTSes disabled.
> Device nodes representing I/O devices should be marked disabled in the
> SoC-specific DTSes, and overridden by board-specific DTSes where needed.
> 
> Thanks for applying!

Thanks,

as these are fixes I have queued them up for v4.11.
