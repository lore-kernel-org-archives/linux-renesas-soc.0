Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42674 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753893AbdBGLVt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Feb 2017 06:21:49 -0500
Date: Tue, 7 Feb 2017 12:21:43 +0100
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 0/5] arm64: dts: r8a779[56]: EtherAVB Gigabit timing
 enhancements
Message-ID: <20170207112143.GA28188@verge.net.au>
References: <1485938524-9322-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1485938524-9322-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Feb 01, 2017 at 09:41:59AM +0100, Simon Horman wrote:
> Hi,
> 
> this series tweaks PHY settings to address communications failures reported
> for 1Gbit communication using EtherAVB. Gigabit is supported for R-Car H3
> ES1.1+ and M3-W as of commit 0e98f9d5f0b4 ("ravb: Support 1Gbps on R-Car H3
> ES1.1+ and R-Car M3-W") which is present in net-next and should be included
> in v4.11.
> 
> This series is based on renesas-devel-20170130-v4.10-rc6

I have queued up this series for v4.12.
