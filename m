Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 21 Jun 2016 14:42:07 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: iommu@lists.linux-foundation.org,
	laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	horms+renesas@verge.net.au
Subject: Re: [PATCH v2 00/11] iommu/ipmmu-vmsa: r8a7795 support V2
Message-ID: <20160621124206.GI28248@8bytes.org>
References: <20160606035723.31763.66500.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160606035723.31763.66500.sendpatchset@little-apple>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 06, 2016 at 12:57:23PM +0900, Magnus Damm wrote:
>  Developed on top of next-20160602 and:
>  [PATCH v3 00/06] iommu/ipmmu-vmsa: IPMMU multi-arch update V3
> 
>  drivers/iommu/ipmmu-vmsa.c |  318 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 269 insertions(+), 49 deletions(-)

Okay, what is the plan on merging this? It is developed on linux-next
and doesn't apply on v4.7-rc4. From the areas it touches it should go
through the iommu-tree, unless there are good reasons not to.


	Joerg

P.S.: Same question applies to your other two patch-sets.
