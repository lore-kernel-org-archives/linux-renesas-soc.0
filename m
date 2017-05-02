Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47912 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751343AbdEBI0Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 04:26:25 -0400
Date: Tue, 2 May 2017 10:26:20 +0200
From: Simon Horman <horms@verge.net.au>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH V3] ARM: dts: r8a7791: Add GyroADC clock and device node
Message-ID: <20170502082620.GA32059@verge.net.au>
References: <20170424152632.3478-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170424152632.3478-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek, Hi Geert,

On Mon, Apr 24, 2017 at 05:26:32PM +0200, Marek Vasut wrote:
> Add node for the GyroADC block and it's associated clock.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> To: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Drop the whole ad-hoc ADC clock block
> V3: - Add gyroadc p_clk phandle into the mstp9 clocks node

What is the status of the review of this patch?
