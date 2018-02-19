Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58078 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752666AbeBSN2w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 08:28:52 -0500
Date: Mon, 19 Feb 2018 14:28:34 +0100
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Update OPPs to support CA53 dfs
Message-ID: <20180219132834.suxvodokl4vzdzqj@verge.net.au>
References: <20180129182121.833-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180129182121.833-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jan 29, 2018 at 07:21:19PM +0100, Simon Horman wrote:
> Describe frequencies, other than the default for CA53 cores.  This is a
> pre-requisite for using providing alternative frequencies for use with
> CPUFreq with these cores.
> 
> CPUFreq requires Z and Z2 clock support to function.
> That this patchset and that dependency can be found at:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/rcar-gen3-cpufreq-v5
> 
> Dien Pham (2):
>   arm64: dts: r8a7796: Update OPPs to support CA53 dfs
>   arm64: dts: r8a7795: Update OPPs to support CA53 dfs

Applied for v4.17.
