Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37015 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729343AbeJ2TLD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Oct 2018 15:11:03 -0400
Date: Mon, 29 Oct 2018 11:22:57 +0100
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] arm64: renesas_defconfig: Enable R-Car thermal driver
Message-ID: <20181029102257.csg7i2fucsa6urlb@verge.net.au>
References: <20181017100722.29481-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017100722.29481-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 17, 2018 at 12:07:22PM +0200, Simon Horman wrote:
> Enable the R-Car thermal driver.
> 
> This driver is used in conjunction with the R-Car V3M (r8a77970),
> E3 (r8a77990) and D3 (r8a77995) SoCs.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> N.B: This is targeted at the devel branch of the renesas tree
> but not upstream where renesas_defconfig does not currently exist

Applied to the topic/renesas_defconfig branch of the renesas tree
which is carried in the devel branch of the same tree but not
targeted at upstream.
