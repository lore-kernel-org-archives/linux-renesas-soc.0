Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60798 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753672AbeGFOEQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 10:04:16 -0400
Date: Fri, 6 Jul 2018 16:04:13 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: geert+renesas@glider.be, horms@verge.net.au, magnus.damm@gmail.com,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] iommu/shmobile: Remove unused
 include/linux/platform_data/sh_ipmmu.h header
Message-ID: <20180706140413.iefljhs74smaysnw@suse.de>
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
> ---
>  include/linux/platform_data/sh_ipmmu.h | 18 ------------------
>  1 file changed, 18 deletions(-)
>  delete mode 100644 include/linux/platform_data/sh_ipmmu.h

Applied, thanks.
