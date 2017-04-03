Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:35372 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751496AbdDCPQI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2017 11:16:08 -0400
Date: Mon, 3 Apr 2017 10:16:06 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: rtc: document the rtc-sh bindings
Message-ID: <20170403151606.lnayy6p5lp4rmvrj@rob-hp-laptop>
References: <20170329173035.67477-1-chris.brandt@renesas.com>
 <20170329173035.67477-3-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170329173035.67477-3-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 29, 2017 at 10:30:30AM -0700, Chris Brandt wrote:
> Add the binding documentation for rtc-sh which is an RTC for
> SuperH and RZ/A SoCs.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v3:
> * remove 'power-domains' from example
> * update commit message subject and body
> v2:
> * added interrupt-names and clock-names
> * clocks now include counting sources
> * changed 'is a RTC' to 'is an RTC' in commit message
> ---
>  Documentation/devicetree/bindings/rtc/rtc-sh.txt | 28 ++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-sh.txt

Acked-by: Rob Herring <robh@kernel.org> 
