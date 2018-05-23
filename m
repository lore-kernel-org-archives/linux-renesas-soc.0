Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56836 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754471AbeEWIsx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 04:48:53 -0400
Date: Wed, 23 May 2018 10:48:49 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: mux: demux-pinctrl: use proper parent device
 for demux adapter
Message-ID: <20180523084849.zqvy6w7cesoapxio@verge.net.au>
References: <20180521072939.2836-1-wsa+renesas@sang-engineering.com>
 <20180521072939.2836-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180521072939.2836-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 21, 2018 at 09:29:38AM +0200, Wolfram Sang wrote:
> Due to a typo, the wrong parent device was assigned to the newly created
> demuxing adapter device. It got connected to the demuxing platform
> device but not to the selected parent I2C adapter device. Fix it to get
> a proper parent-child relationship of the demuxed busses.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
