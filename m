Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:38029 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758059AbdJMNjl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2017 09:39:41 -0400
Date: Fri, 13 Oct 2017 08:39:39 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Joerg Roedel <joro@8bytes.org>,
        Mark Rutland <mark.rutland@arm.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iommu: ipmmu-vmsa: Use generic node name
Message-ID: <20171013133939.nob5ex5ipsns24dr@rob-hp-laptop>
References: <1507120388-14179-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507120388-14179-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 04, 2017 at 02:33:08PM +0200, Geert Uytterhoeven wrote:
> Use the preferred generic node name in the example.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Rob
