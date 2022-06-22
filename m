Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096E3C43334
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 22 Jun 2022 13:46:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351878AbiFVNq0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 22 Jun 2022 09:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236962AbiFVNq0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jun 2022 09:46:26 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B4C27B27
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Jun 2022 06:46:25 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id CDCE72D0; Wed, 22 Jun 2022 15:46:22 +0200 (CEST)
Date:   Wed, 22 Jun 2022 15:46:21 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     will@kernel.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Fix compatible for rcar-gen4
Message-ID: <YrMdLeEL3EQ/+4bP@8bytes.org>
References: <20220617010107.3229784-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617010107.3229784-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 17, 2022 at 10:01:07AM +0900, Yoshihiro Shimoda wrote:
> Fix compatible string for R-Car Gen4.
> 
> Fixes: ae684caf465b ("iommu/ipmmu-vmsa: Add support for R-Car Gen4")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/iommu/ipmmu-vmsa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied for 5.19, thanks.
