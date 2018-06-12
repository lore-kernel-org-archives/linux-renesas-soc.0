Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:45161 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754325AbeFLVC3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jun 2018 17:02:29 -0400
Date: Tue, 12 Jun 2018 15:02:26 -0600
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] dt-bindings: display: renesas: du: document R8A77980
 bindings
Message-ID: <20180612210226.GA14893@rob-hp-laptop>
References: <2a775652-604c-6379-b807-19979f164f84@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a775652-604c-6379-b807-19979f164f84@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 04, 2018 at 10:04:59PM +0300, Sergei Shtylyov wrote:
> Document the R-Car V3H (R8A77980) SoC in the R-Car DU bindings; the DU
> hardware seems the same as in the R-Car V3M (R8A77970).
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> The patch is against the 'drm-next' branch of David Airlie's 'linux.git' repo.
> 
>  Documentation/devicetree/bindings/display/renesas,du.txt |    2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
