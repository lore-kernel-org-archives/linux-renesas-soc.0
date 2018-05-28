Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56613 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754305AbeE1JbG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 May 2018 05:31:06 -0400
Date: Mon, 28 May 2018 11:31:02 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 2/2] arm64: dts: ulcb: Add sdhi2_ds pin group to SDHI2
 pinctrl groups
Message-ID: <20180528093102.koll7ny3g5rjo2zb@verge.net.au>
References: <20180525150518.26894-1-wsa+renesas@sang-engineering.com>
 <20180525150518.26894-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180525150518.26894-3-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 25, 2018 at 05:05:18PM +0200, Wolfram Sang wrote:
> This patch adds definitions for configuration of the power-source,
> drive-strength, etc... for the SD2_DS pin. Based on a similar patch for
> Salvator boards by Masaharu Hayakawa and Takeshi Kihara.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Hi Wolfram,

Given Olof Johansson's recent comments in ("Re: [GIT PULL] Renesas ARM64
Based SoC DT Updates for v4.18") please consider squashing this
series into a single patch and reposting.
