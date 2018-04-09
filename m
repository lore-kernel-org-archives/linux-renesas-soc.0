Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55251 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750759AbeDILRT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Apr 2018 07:17:19 -0400
Date: Mon, 9 Apr 2018 13:17:15 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 0/3] R-Car DU: Fix LVDS output on Gen2 boards
Message-ID: <20180409111714.rdfji4ub6cj332jc@verge.net.au>
References: <20180406191438.3630-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180406191438.3630-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 06, 2018 at 10:14:35PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series fixes LVDS output support on the Lager, Koelsh, Porter and
> Gose boards that broke in v4.17-rc1 due to the combination of the R-Car DU
> LVDS driver rework and the DT move of all on-SoC peripherals to a /soc node.
> 
> We could handle the problem in the R-Car DU LVDS DT backward compatibility
> code, but that fix would only be used for v4.17 as in v4.18 the Gen2 DT will
> move to the new LVDS DT bindings. I thus propose merging these three patches
> in v4.17 already to fix the problem as this is the simplest solution.
> 
> The patches are based on top of Linus' master that includes both the R-Car DU
> changes and the ARM DT changes for v4.17-rc1. I can rebase them on top of
> v4.17-rc1 when it will be released, but I don't expect any change.

Thanks, I think this should be fine. Please ping me once v4.17-rc1 has
been released.

> 
> Laurent Pinchart (3):
>   ARM: dts: r8a7790: Convert to new LVDS DT bindings
>   ARM: dts: r8a7791: Convert to new LVDS DT bindings
>   ARM: dts: r8a7793: Convert to new LVDS DT bindings
> 
>  arch/arm/boot/dts/r8a7790-lager.dts   | 22 +++++++++---
>  arch/arm/boot/dts/r8a7790.dtsi        | 65 ++++++++++++++++++++++++++++++-----
>  arch/arm/boot/dts/r8a7791-koelsch.dts | 10 ++++--
>  arch/arm/boot/dts/r8a7791-porter.dts  | 16 +++++++--
>  arch/arm/boot/dts/r8a7791.dtsi        | 36 +++++++++++++++----
>  arch/arm/boot/dts/r8a7793-gose.dts    | 10 ++++--
>  arch/arm/boot/dts/r8a7793.dtsi        | 37 ++++++++++++++++----
>  7 files changed, 163 insertions(+), 33 deletions(-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
