Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 8bytes.org ([81.169.241.247]:53534 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932483AbeGFMNB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 08:13:01 -0400
Date: Fri, 6 Jul 2018 14:12:55 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert@linux-m68k.org, horms@verge.net.au, magnus.damm@gmail.com,
        yoshihiro.shimoda.uh@renesas.com,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND 0/6] iommu: ipmmu-vmsa: Add more Gen3 SoCs support
Message-ID: <20180706121254.m5tyyzpxsyqqo73d@8bytes.org>
References: <1528973306-7962-1-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528973306-7962-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 14, 2018 at 12:48:20PM +0200, Jacopo Mondi wrote:
> Jacopo Mondi (2):
>   dt-bindings: iommu/ipmmu-vmsa: Add R-Car M3-N (R8A77965)
>   iommu/ipmmu-vmsa: Hook up R8A77965 DT matching code
> 
> Magnus Damm (3):
>   iommu/ipmmu-vmsa: Increase maximum micro-TLBS to 48
>   iommu/ipmmu-vmsa: Hook up r8a7796 DT matching code
>   iommu/ipmmu-vmsa: Document R-Car V3H and E3 IPMMU DT bindings
> 
> Simon Horman (1):
>   iommu/ipmmu-vmsa: Hook up r8a779(70|95) DT matching code

Applied for v4.19, thanks.
