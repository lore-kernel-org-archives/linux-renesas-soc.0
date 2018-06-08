Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56456 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751140AbeFHH5N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jun 2018 03:57:13 -0400
Date: Fri, 8 Jun 2018 09:57:09 +0200
From: Simon Horman <horms@verge.net.au>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: geert+renesas@glider.be, jroedel@suse.de, magnus.damm@gmail.com,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] iommu/shmobile: Remove unused
 include/linux/platform_data/sh_ipmmu.h header
Message-ID: <20180608075709.fjk5ohrxz5ukrcdh@verge.net.au>
References: <1528400696-32609-1-git-send-email-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528400696-32609-1-git-send-email-clabbe@baylibre.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 07, 2018 at 07:44:56PM +0000, Corentin Labbe wrote:
> include/linux/platform_data/sh_ipmmu.h is unused since commit ae50dc4874c5 ("iommu/shmobile: Remove unused Renesas IPMMU/IPMMUI")
> Let's remove it.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
