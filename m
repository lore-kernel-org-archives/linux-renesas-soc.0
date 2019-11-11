Return-Path: <SRS0=wY1Z=ZD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC94DC43331
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Nov 2019 14:07:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8FD021783
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Nov 2019 14:07:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfKKOHE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Nov 2019 09:07:04 -0500
Received: from 8bytes.org ([81.169.241.247]:51282 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726811AbfKKOHE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Nov 2019 09:07:04 -0500
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 720F2120; Mon, 11 Nov 2019 15:07:02 +0100 (CET)
Date:   Mon, 11 Nov 2019 15:07:01 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     iommu@lists.linux-foundation.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/6] iommu/ipmmu-vmsa: minor updates
Message-ID: <20191111140700.GB18333@8bytes.org>
References: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 06, 2019 at 11:35:44AM +0900, Yoshihiro Shimoda wrote:
> Yoshihiro Shimoda (6):
>   iommu/ipmmu-vmsa: Remove all unused register definitions
>   iommu/ipmmu-vmsa: tidyup register definitions
>   iommu/ipmmu-vmsa: Add helper functions for MMU "context" registers
>   iommu/ipmmu-vmsa: Calculate context registers' offset instead of a
>     macro
>   iommu/ipmmu-vmsa: Add helper functions for "uTLB" registers
>   iommu/ipmmu-vmsa: Add utlb_offset_base
> 
>  drivers/iommu/ipmmu-vmsa.c | 214 +++++++++++++++++++--------------------------
>  1 file changed, 89 insertions(+), 125 deletions(-)

Applied, thanks.
