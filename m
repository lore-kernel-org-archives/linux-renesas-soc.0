Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56380 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754574AbeFTJCJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jun 2018 05:02:09 -0400
Date: Wed, 20 Jun 2018 11:02:06 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/LOCAL] arm64: defconfig: Update renesas_defconfig for
 v4.18-rc1
Message-ID: <20180620090204.putmvmhyyscgsz5g@verge.net.au>
References: <20180619180947.23362-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180619180947.23362-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jun 19, 2018 at 08:09:47PM +0200, Geert Uytterhoeven wrote:
> Update the defconfig for Renesas R-Car Gen3 boards:
>   - Enable CONFIG_VIDEO_RCAR_CSI2 (for all R-Car Gen3),
>   - Enable CONFIG_DRM_THINE_THC63LVD1024 (for Eagle and V3MSK),
>   - Disable CONFIG_PCIE_DW_PLAT_HOST (N/A),
>   - Disable CONFIG_SOCIONEXT_SYNQUACER_PREITS (N/A),
>   - Disable CONFIG_HISILICON_ERRATUM_161600802 (N/A),
>   - Disable CONFIG_ARM64_LSE_ATOMICS (not supported by CA53/57),
>   - Disable CONFIG_ARM64_RAS_EXTN (not supported by CA53/57),
>   - Disable CONFIG_CAVIUM_PTP (N/A),
>   - Disable CONFIG_MEDIA_TUNER_TDA18250 (N/A),
>   - Disable CONFIG_MEDIA_TUNER_QM1D1B0004 (N/A),
>   - Remove CONFIG_SERIAL_SH_SCI_NR_UARTS=11 (default of 18 is fine),
>   - Remove CONFIG_SERIAL_SH_SCI_CONSOLE=y (auto-enabled),
>   - Remove CONFIG_SERIAL_SH_SCI_DMA=y (auto-enabled),
>   - Remove CONFIG_DRM_RCAR_VSP=y (auto-enabled).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not intended for upstream merge.

Thanks,

I have applied this to the topic/renesas-defconfig branch which is included
in the devel branch and tags of the Renesas tree as a convenience to
developers.  The branch is not, however, included in the next branch or
tags nor is it targeted at upstream.
