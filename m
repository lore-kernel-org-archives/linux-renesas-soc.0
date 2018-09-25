Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35795 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727588AbeIYNhj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Sep 2018 09:37:39 -0400
Date: Tue, 25 Sep 2018 09:31:22 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/8] phy: renesas: rcar-gen3-usb2: Rename has_otg_pins to
 uses_otg_pins
Message-ID: <20180925073121.q2xlc22ywl6x527w@verge.net.au>
References: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1537530804-19399-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537530804-19399-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 21, 2018 at 08:53:19PM +0900, Yoshihiro Shimoda wrote:
> Since R-Car E3 and D3 have dedicated otg pins actually, "has_otg_pins"
> is possible to misread in the future. So, this patch renames
> has_otg_pins to uses_otg_pins.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
