Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53778 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751873AbeBWQij (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Feb 2018 11:38:39 -0500
Date: Fri, 23 Feb 2018 17:38:35 +0100
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: marzen: Add SDHI0 VCCQ Regulator
Message-ID: <20180223163835.wn4abhvyzr7qpaqt@verge.net.au>
References: <151904387813.30430.10543147136498508821.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <151904387813.30430.10543147136498508821.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 19, 2018 at 09:37:58PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Add support for the on-board voltage regulator hooked up to GPIO3_20
> on r8a7779 Marzen. The board schematics describes the regulator as U4
> TPS2110A. Input wise, U4 has D0 fixed to ground, D1 tied to GPIO3_20
> while IN1 is fixed to 3.3V and IN2 is fixed to 1.8V. OUT goes to the
> pull-ups for the data pins of SDHI0.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks Magnus, applied.
