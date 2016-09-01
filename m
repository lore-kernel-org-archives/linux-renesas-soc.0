Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:35751 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754664AbcIAQad (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 12:30:33 -0400
Received: by mail-lf0-f46.google.com with SMTP id e198so31179692lfb.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Sep 2016 09:30:32 -0700 (PDT)
Subject: Re: [PATCH 1/3] ARM: dts: r7s72100: add ethernet clock to device tree
To: Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20160901155430.23400-1-chris.brandt@renesas.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <aaf8c5de-a4f8-42e5-583d-c81a9d92edae@cogentembedded.com>
Date: Thu, 1 Sep 2016 19:30:28 +0300
MIME-Version: 1.0
In-Reply-To: <20160901155430.23400-1-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/01/2016 06:54 PM, Chris Brandt wrote:

> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  include/dt-bindings/clock/r7s72100-clock.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/dt-bindings/clock/r7s72100-clock.h b/include/dt-bindings/clock/r7s72100-clock.h
> index 5128f4d..3cd8138 100644
> --- a/include/dt-bindings/clock/r7s72100-clock.h
> +++ b/include/dt-bindings/clock/r7s72100-clock.h
> @@ -25,6 +25,9 @@
>  #define R7S72100_CLK_SCIF6	1
>  #define R7S72100_CLK_SCIF7	0
>
> +/* MSTP7 */
> +#define R7S72100_CLK_ETHER	4
> +
>  /* MSTP9 */
>  #define R7S72100_CLK_I2C0	7
>  #define R7S72100_CLK_I2C1	6

    I'd add the MSTP7 clock node itself in the same patch...

MBR, Sergei
