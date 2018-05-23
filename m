Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:36953 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754649AbeEWQ00 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 12:26:26 -0400
Date: Wed, 23 May 2018 11:26:23 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V2] mfd: dt: Add bindings for DA9063L
Message-ID: <20180523162623.GA11346@rob-hp-laptop>
References: <20180523122140.6275-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180523122140.6275-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 23, 2018 at 02:21:40PM +0200, Marek Vasut wrote:
> Add device tree bindings for the Dialog DA9063L. This is a
> variant of the DA9063 chip with smaller package, with less
> LDO regulators and without RTC block. The other properties
> of the chip are the same, including the content of the chip
> ID register.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Steve Twiss <stwiss.opensource@diasemi.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Merge the DA9063/DA9063L regulator lists and mark DA9063-only
>     regulators in that single list
> ---
>  Documentation/devicetree/bindings/mfd/da9063.txt | 32 +++++++++++++-----------
>  1 file changed, 17 insertions(+), 15 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
