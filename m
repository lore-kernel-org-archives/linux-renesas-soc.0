Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33261 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751030AbdJKH3d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 03:29:33 -0400
Date: Wed, 11 Oct 2017 09:29:24 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 2/4] phy: rcar-gen3-usb2: use enum phy_mode in the
 role_store()
Message-ID: <20171011072924.GD9661@verge.net.au>
References: <1507628490-7944-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1507628490-7944-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507628490-7944-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 10, 2017 at 06:41:28PM +0900, Yoshihiro Shimoda wrote:
> This patch modifies the role_store() to use "enum phy_mode" instead
> of the local "bool" for host/device mode selection.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for the updates, this looks nice to me.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
