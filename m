Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56611 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752838AbeFTJOV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jun 2018 05:14:21 -0400
Date: Wed, 20 Jun 2018 11:14:17 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/03] arm64: dts: renesas: Add IPMMU device nodes V2
Message-ID: <20180620091416.s4vdg5tgkl3mnoxd@verge.net.au>
References: <152923212426.18394.1638836062311758848.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <152923212426.18394.1638836062311758848.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Jun 17, 2018 at 07:42:04PM +0900, Magnus Damm wrote:
> arm64: dts: renesas: Add IPMMU device nodes V2
> 
> [PATCH v2 01/03] arm64: dts: renesas: r8a77965: Add IPMMU devices nodes
> [PATCH v2 02/03] arm64: dts: renesas: r8a77980: Add IPMMU devices nodes
> [PATCH v2 03/03] arm64: dts: renesas: r8a77990: Add IPMMU devices nodes
> 
> This series is the second attempt to add IPMMU device nodes to R-Car M3-N,
> R-Car V3H and R-Car E3 SoCs.
> 
> The IPMMU DT binding changes are not yet merged upstream however they
> have been documented by the following patches:
> 
> [PATCH] iommu/ipmmu-vmsa: Document R-Car M3-N IPMMU DT bindings 
> [PATCH] iommu/ipmmu-vmsa: Document R-Car V3H and E3 IPMMU DT bindings
> 
> Please see each individual patch for list of changes.

Hi Magnus,

as per my comment on v1, did you consider merging these patches into one
patch. Olof has asked that we consider such consolidation.
