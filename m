Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59775 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750703AbdAWJeK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 04:34:10 -0500
Date: Mon, 23 Jan 2017 10:34:04 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v7 0/2] arm64: dts: r8a779x: add thermal to DTS
Message-ID: <20170123093403.GH31651@verge.net.au>
References: <20170120112643.2282-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170120112643.2282-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 20, 2017 at 12:26:41PM +0100, Wolfram Sang wrote:
> Since the driver is now merged into next, we can add the DTS snipplets as well.
> Changes from V6:
> 
> * rebased to latest renesas/arm64-dt-for-v4.11
> * changed critical temp from 90° to 120° which is the state in the latest BSP

Thanks, applied.
