Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:65360 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968280AbdADPKr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 10:10:47 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Fixes for v4.10
Date: Wed, 04 Jan 2017 16:10:09 +0100
Message-ID: <3426031.nFTgvuDslP@wuerfel>
In-Reply-To: <cover.1481530910.git.horms+renesas@verge.net.au>
References: <cover.1481530910.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Monday, December 12, 2016 9:30:00 AM CET Simon Horman wrote:
> This provides an sd0_uhs node rather than duplicate sdh0 nodes
> resolving an error introduced in a clean-up patch.
> 
> This pull request is based on "Second Round of Renesas ARM Based SoC DT
> Updates for v4.10", tagged as renesas-arm64-dt2-for-v4.10,
> which you have already pulled. The error corrected by this change
> was introduced in that pull-request.
> 

Pulled into fixes, sorry for the delay.

	Arnd
