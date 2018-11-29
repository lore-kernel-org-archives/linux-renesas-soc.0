Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60435 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbeK2Unu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 15:43:50 -0500
Date: Thu, 29 Nov 2018 10:39:02 +0100
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "joro@8bytes.org" <joro@8bytes.org>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] iommu/ipmmu-vmsa: add an array of slave devices
 whitelist
Message-ID: <20181129093901.i5rr3cpdnmyq6t5s@verge.net.au>
References: <1543396868-14723-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1543396868-14723-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543396868-14723-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 28, 2018 at 09:23:36AM +0000, Yoshihiro Shimoda wrote:
> To avoid adding copy and pasted strcmp codes in the future,
> this patch adds an array "rcar_gen3_slave_whitelist" to check
> whether the device can work with the IPMMU or not.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
