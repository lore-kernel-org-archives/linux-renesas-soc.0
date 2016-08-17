Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53783 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753676AbcHQHIU (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 17 Aug 2016 03:08:20 -0400
Date: Wed, 17 Aug 2016 09:08:13 +0200
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH 0/2] ARM: dts: alt: add SDHI0 and 1, and MMCIF support
Message-ID: <20160817070813.GF8673@verge.net.au>
References: <1470745144-5394-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1470745144-5394-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 09, 2016 at 02:19:02PM +0200, Simon Horman wrote:
> Hi,
> 
> this short series enables SDHI 0 and 1, and MMCIF on the r8a7794/Alt board.
> The SDHI IP blocks are exposed as SD card slots while the MMCIF block
> is wired up to on-board eMMC.
> 
> N.B.: I do not currently have physical access to an Alt board but I do
>       have remote access which I used to test these patches.
> 
> Simon Horman (2):
>   ARM: dts: alt: add SDHI0 and 1 support
>   ARM: dts: alt: add MMCIF support

I have queued these up.
