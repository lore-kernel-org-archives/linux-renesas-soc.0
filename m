Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 22 Aug 2017 16:19:25 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        sricharan@codeaurora.org, will.deacon@arm.com,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        robin.murphy@arm.com, m.szyprowski@samsung.com
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Use iommu_device_sysfs_add()/remove()
Message-ID: <20170822141925.5jfh7j22ttsu63b5@8bytes.org>
References: <150329481531.31395.6238405988822544474.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <150329481531.31395.6238405988822544474.sendpatchset@little-apple>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 21, 2017 at 02:53:35PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Extend the driver to make use of iommu_device_sysfs_add()/remove()
> functions to hook up initial sysfs support.
> 
> Suggested-by: Joerg Roedel <jroedel@suse.de>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Applied, thanks.
