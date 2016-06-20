Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59235 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753034AbcFTJSx (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 20 Jun 2016 05:18:53 -0400
Date: Mon, 20 Jun 2016 17:53:24 +0900
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 0/2] ARM: defconfig: Enable r8a7792
Message-ID: <20160620085324.GA5080@verge.net.au>
References: <1466054638-11326-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1466054638-11326-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 16, 2016 at 02:23:56PM +0900, Simon Horman wrote:
> Enable r8a7792 SoC in shmobile and multi_v7 defconfigs.
> 
> Based on renesas-devel-20160616-v4.7-rc3
> 
> Simon Horman (2):
>   ARM: shmobile: defconfig: Enable r8a7792 SoC
>   ARM: multi_v7_defconfig: defconfig: Enable r8a7792 SoC
> 
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  arch/arm/configs/shmobile_defconfig | 1 +
>  2 files changed, 2 insertions(+)

I have queued these up.
