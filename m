Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:59538 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751065AbdCQPLU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2017 11:11:20 -0400
Date: Fri, 17 Mar 2017 16:11:17 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/5] rtc: rtc-sh: add support for rza series
Message-ID: <20170317151117.a7q4fz4ucqg5ngdi@piout.net>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
 <20170316175112.27913-2-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170316175112.27913-2-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Mostly good, one nitpick:

On 16/03/2017 at 13:51:08 -0400, Chris Brandt wrote:
>  	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> +	if (res == NULL)

if (!res) is preferred here

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
