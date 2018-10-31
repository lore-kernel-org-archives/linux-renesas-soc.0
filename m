Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43413 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729529AbeJaXc1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Oct 2018 19:32:27 -0400
Date: Wed, 31 Oct 2018 15:34:06 +0100
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 2/4] arm64: renesas_defconfig: Enable scu-simple-card
 driver
Message-ID: <20181031143406.4wysyxz5fd34d5r6@verge.net.au>
References: <20181015095924.25794-1-horms+renesas@verge.net.au>
 <20181015095924.25794-3-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181015095924.25794-3-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 15, 2018 at 11:59:22AM +0200, Simon Horman wrote:
> Enable the scu-simple-card which is used by
> the R-Car E3 (r8a77990) based Ebisu board.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> N.B: This is targeted at the devel branch of the renesas tree
> but not upstream where renesas_defconfig does not currently exist

Applied to topic/renesas-defconfig, which is included in the devel
branch but not targeted at upstream.
