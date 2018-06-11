Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58200 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754010AbeFKI20 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jun 2018 04:28:26 -0400
Date: Mon, 11 Jun 2018 10:28:22 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFT 2/2] arm64: dts: renesas: r8a77965: Add PCIe device
 nodes
Message-ID: <20180611082819.rnoiou2t7l6dynju@verge.net.au>
References: <1528373494-18503-1-git-send-email-ykaneko0929@gmail.com>
 <1528373494-18503-3-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528373494-18503-3-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 07, 2018 at 09:11:34PM +0900, Yoshihiro Kaneko wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch adds PCIe{0,1} device nodes to R8A77965 SoC.
> 
> Based on a similar patches of the R8A7796 device tree
> by Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Hi,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
