Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:34131 "EHLO
	mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752549AbcDYO0C (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 10:26:02 -0400
Received: by mail-lf0-f44.google.com with SMTP id j11so117923867lfb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2016 07:26:01 -0700 (PDT)
Subject: Re: [PATCH 1/6] arm64: dts: r8a7795: Don't disable referenced
 optional clocks
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
References: <1461593315-21307-1-git-send-email-geert+renesas@glider.be>
 <1461593315-21307-2-git-send-email-geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <7f571e04-2e61-8299-5374-bddfe788da68@cogentembedded.com>
Date: Mon, 25 Apr 2016 17:25:58 +0300
MIME-Version: 1.0
In-Reply-To: <1461593315-21307-2-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 4/25/2016 5:08 PM, Geert Uytterhoeven wrote:

> clk_get() on a disabled clock node will return -EPROBE_DEFER, which can
> cause drivers to be deferred forever if such clocks are referenced in
> their devices' clocks properties.
>
> Update the various disabled external clock nodes to default to a
> frequency of 0, but don't disable them, to prevent this.
>
> Reported-by: Jürg Billeter <j@bitron.ch>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 1 +
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 5 +----
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> index 63d51059ae639e9d..263abaede2a82780 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> @@ -619,6 +619,7 @@
>  };
>
>  &pcie_bus_clk {
> +	clock-frequency = <100000000>;
>  	status = "okay";

    This line is no longer needed.

[...]

MBR, Sergei
