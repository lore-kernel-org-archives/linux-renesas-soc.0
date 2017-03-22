Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 22 Mar 2017 15:23:12 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au,
        robin.murphy@arm.com, m.szyprowski@samsung.com
Subject: Re: [PATCH v3 0/3] iommu/ipmmu-vmsa: r8a7796 support V3
Message-ID: <20170322142312.GB7266@8bytes.org>
References: <148929710090.20744.10912918031085568693.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <148929710090.20744.10912918031085568693.sendpatchset@little-apple>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hey Magnus,

On Sun, Mar 12, 2017 at 02:38:20PM +0900, Magnus Damm wrote:
> iommu/ipmmu-vmsa: r8a7796 support V3
> 
> [PATCH v3 1/3] iommu/ipmmu-vmsa: Add r8a7796 DT binding
> [PATCH v3 2/3] iommu/ipmmu-vmsa: Increase maximum micro-TLBS to 48
> [PATCH v3 3/3] iommu/ipmmu-vmsa: Hook up r8a7796 DT matching code

I just tried to apply a few of your patch-sets, but failed because they
don't apply cleanly and it is not clear what the dependencies are and in
which order they need to be applied.

So for now I skipped all ipmmu-vmsa patches that are currently in my
inbox. Please rebase your different series to v4.11-rc3 and resend them
in the right order, with all Reviewed-bys and other tags that people
gave you included. Then I am taking another look into applying them.


Thanks,

	Joerg
