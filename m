Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38756 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755418AbcLTKvu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Dec 2016 05:51:50 -0500
Date: Tue, 20 Dec 2016 11:51:44 +0100
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 renesas/devel 00/13] ARM, arm64: dts: Use R-Car
 fallback bindings for i2c/iic nodes
Message-ID: <20161220105144.GJ19532@verge.net.au>
References: <1481629559-14187-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481629559-14187-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 13, 2016 at 12:45:46PM +0100, Simon Horman wrote:
> Hi,
> 
> this short series makes use of newly added R-Car fallback bindings in i2c
> and iic nodes of the DTs for SoCs where the drivers in question are already
> used.
> 
> This should have no run-time effect at this time as the current driver
> implementations use the same initialisation squeuences for SoC-specific and
> R-Car fallback bindings for all the cases covered by this patch-set.
> 
> Based on renesas-devel-20161212-v4.9

I have queued these up for v4.11.
