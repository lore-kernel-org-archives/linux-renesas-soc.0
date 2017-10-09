Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:43974 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754358AbdJIQS3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 12:18:29 -0400
Received: by mail-lf0-f51.google.com with SMTP id a16so10483033lfk.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Oct 2017 09:18:28 -0700 (PDT)
Subject: Re: [PATCH 2/4] ARM: dts: iwg20d-q7: Enable HS-USB
To: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1507555281-57845-1-git-send-email-biju.das@bp.renesas.com>
 <1507555281-57845-3-git-send-email-biju.das@bp.renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <cbf92515-644c-b677-80dd-f33028a3829d@cogentembedded.com>
Date: Mon, 9 Oct 2017 19:18:24 +0300
MIME-Version: 1.0
In-Reply-To: <1507555281-57845-3-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 10/09/2017 04:21 PM, Biju Das wrote:

> Enable HS-USB device for the iWave G20D-Q7 carrier board based on
> RZ/G1M.
> Also disable the host mode support on usb otg port by default to avoid
> pin conflicts.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
>   arch/arm/boot/dts/iwg20d-q7-common.dtsi | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> index 1c072c0..e6b50c6 100644
> --- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> +++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
[...]
> @@ -72,7 +78,7 @@
>   };
>   
>   &pci0 {
> -	status = "okay";
> +	status = "disabled";

    I think you may just omit this prop -- you most prolly have it "disabloed" 
in the R8A7743's DT.

>   	pinctrl-0 = <&usb0_pins>;
>   	pinctrl-names = "default";
>   };

MBR, Sergei
