Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:36393 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750927AbdGMFHs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 01:07:48 -0400
Received: by mail-lf0-f41.google.com with SMTP id h22so29976272lfk.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jul 2017 22:07:47 -0700 (PDT)
Date: Thu, 13 Jul 2017 07:07:44 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: r8a779[014]: Use R-Car Gen 2 fallback
 binding for vin nodes
Message-ID: <20170713050744.GA23854@bigcity.dyn.berto.se>
References: <1499777809-27492-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1499777809-27492-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

Thanks for your work.

On 2017-07-11 14:56:46 +0200, Simon Horman wrote:
> Use R-Car Gen 2 fallback binding for vind nodes in DT for r8a779[014] SoCs.
> 
> This has no run-time effect for the current driver as the initialisation
> sequence is the same for the SoC-specific binding for r8a779[014] and the
> fallback binding for R-Car Gen 2
> 
> This is consistent with existing compat string usage in vin nodes for the
> r8a779[23] SoCs.

For whole serries:

Acked-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Based on renesas-devel-20170711-v4.12
> 
> Simon Horman (3):
>   ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for vin nodes
>   ARM: dts: r8a7791: Use R-Car Gen 2 fallback binding for vin nodes
>   ARM: dts: r8a7794: Use R-Car Gen 2 fallback binding for vin nodes
> 
>  arch/arm/boot/dts/r8a7790.dtsi | 8 ++++----
>  arch/arm/boot/dts/r8a7791.dtsi | 6 +++---
>  arch/arm/boot/dts/r8a7794.dtsi | 4 ++--
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> -- 
> 2.1.4
> 

-- 
Regards,
Niklas S�derlund
