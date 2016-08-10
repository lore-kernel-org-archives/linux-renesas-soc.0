Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58266 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752547AbcHJSOQ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 10 Aug 2016 14:14:16 -0400
Date: Wed, 10 Aug 2016 10:44:44 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Dirk Behme <dirk.behme@gmail.com>, linux-mmc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: r8a7795: set maximum frequency for SDHI
 clocks
Message-ID: <20160810084443.GC6276@verge.net.au>
References: <1469120504-2037-1-git-send-email-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1469120504-2037-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 21, 2016 at 07:01:44PM +0200, Wolfram Sang wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Define the upper limit otherwise the driver cannot utilize max speeds.

Thanks, I have queued this up for v4.9.
