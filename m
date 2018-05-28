Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56193 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754457AbeE1JFJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 May 2018 05:05:09 -0400
Date: Mon, 28 May 2018 11:05:05 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/03] arm64: dts: renesas: Add IPMMU device nodes
Message-ID: <20180528090504.aeimp5eelmeyraa4@verge.net.au>
References: <152691388485.29667.16990860330809844193.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <152691388485.29667.16990860330809844193.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 21, 2018 at 11:44:44PM +0900, Magnus Damm wrote:
> arm64: dts: renesas: Add IPMMU device nodes
> 
> [PATCH 01/03] arm64: dts: renesas: r8a77965: Add IPMMU devices nodes
> [PATCH 02/03] arm64: dts: renesas: r8a77980: Add IPMMU devices nodes
> [PATCH 03/03] arm64: dts: renesas: r8a77990: Add IPMMU devices nodes
> 
> This series adds IPMMU device nodes to R-Car M3-N, V3H and E3 SoCs.
> 
> The IPMMU DT binding changes are not yet merged upstream however they
> have been documented by the following patches:
> 
> [PATCH] iommu/ipmmu-vmsa: Document R-Car M3-N IPMMU DT bindings 
> [PATCH] iommu/ipmmu-vmsa: Document R-Car V3H and E3 IPMMU DT bindings

Hi Magnus,

Given Olof Johansson's recent comments in ("Re: [GIT PULL] Renesas ARM64
Based SoC DT Updates for v4.18") please consider squashing this
series into a single patch when posting v2.
