Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40590 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757329AbcIPJxV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 05:53:21 -0400
Date: Fri, 16 Sep 2016 11:53:15 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 04/11] ARM: dts: r8a7791: set maximum frequency for
 SDHI clocks
Message-ID: <20160916095315.GF14562@verge.net.au>
References: <1473764228-24768-1-git-send-email-horms+renesas@verge.net.au>
 <1473764228-24768-5-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1473764228-24768-5-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 13, 2016 at 12:57:01PM +0200, Simon Horman wrote:
> Define the upper limit otherwise the driver cannot utilize max speeds.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

I have queued this up.
