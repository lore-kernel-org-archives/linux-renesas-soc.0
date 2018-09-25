Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33135 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729315AbeIYVhg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Sep 2018 17:37:36 -0400
Date: Tue, 25 Sep 2018 10:29:32 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH v5 2/2] dt-bindings: watchdog: renesas-wdt: Add support
 for R7S9210
Message-ID: <20180925152932.GA30838@bogus>
References: <20180924135816.19474-1-chris.brandt@renesas.com>
 <20180924135816.19474-3-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180924135816.19474-3-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 24, 2018 at 08:58:16AM -0500, Chris Brandt wrote:
> Document support for RZ/A2
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2:
>  * Added Reviewed-by
> ---
>  Documentation/devicetree/bindings/watchdog/renesas-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)

I gave Reviewed-by on v3. Please add acks/reviewed-bys when posting new 
versions.

Rob
